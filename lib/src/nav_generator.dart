import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// Deep import keeps the builder flutter-free: only this file is compiled,
// not canon's flutter-dependent umbrella.
// ignore: implementation_imports
import 'package:canon/src/screens_annotation.dart';

import 'link_model.dart';
import 'tree_reader.dart';

class _Row {
  _Row(
    this.name,
    this.idType,
    this.spec, {
    this.owner = true,
    this.idNodes,
    this.idComponentTypes,
    this.idComponentNames,
  });

  final String name;
  final String? idType;

  /// Component TYPE names when [idType] is a NOMINAL composite (an @ids
  /// extension type, unsplittable as a string) — null otherwise.
  final List<String>? idComponentTypes;

  /// The components' grammar-row names (the generated getters: `.ad`,
  /// `.user`) for a nominal composite — null otherwise.
  final List<String>? idComponentNames;

  /// The `@ids` node identities this screen's id is made of (`Ids#1`), or null
  /// when the id isn't node-based. One entry for an atomic node, N for a
  /// composite — so `inherit` can match a source component by node, not type.
  final List<String>? idNodes;

  /// The home enum's name — screens may come from grafted sub-enums.
  final String spec;

  /// True when this declaration carries a widget (the OWNER). A null-widget
  /// declaration is a REF that collapses to its same-named owner.
  final bool owner;
}

bool _hasValueEquality(DartType t) {
  if (t is RecordType) return true;
  if (t is! InterfaceType) return false;
  final element = t.element;
  if (element is EnumElement) return true;
  if (t.isDartCoreString ||
      t.isDartCoreInt ||
      t.isDartCoreDouble ||
      t.isDartCoreBool ||
      t.isDartCoreNum) {
    return true;
  }
  if (element.getMethod('==') != null) return true;
  return element.allSupertypes.any(
    (s) => !s.isDartCoreObject && s.element.getMethod('==') != null,
  );
}

String _cap(String s) => s[0].toUpperCase() + s.substring(1);

// The `T` of a `Codec<T>` value's type — walks supertypes (a built-in like
// `_UuidCodec` implements `Codec<String>`), so it works for any codec. Null when
// the value isn't a Codec (e.g. an id-free screen with no codec).
DartType? _codecArg(DartType? t) {
  if (t is! InterfaceType) return null;
  for (final s in [t, ...t.allSupertypes]) {
    if (s.element.name == 'Codec') {
      return s.typeArguments.isNotEmpty ? s.typeArguments.first : null;
    }
  }
  return null;
}

String _lcFirst(String s) => s[0].toLowerCase() + s.substring(1);

// The components of a (possibly record) id type: `(A, B)` -> [A, B]; an atomic
// type -> [it]; null -> []. Splits on TOP-LEVEL commas so nested records /
// generics (`(A, (B, C))`, `List<A, B>`) stay whole.
List<String> _idComponents(String? type) {
  if (type == null) return const [];
  final s = type.trim();
  if (!(s.startsWith('(') && s.endsWith(')'))) return [s];
  final inner = s.substring(1, s.length - 1);
  final parts = <String>[];
  var depth = 0, start = 0;
  for (var i = 0; i < inner.length; i++) {
    final ch = inner[i];
    if (ch == '(' || ch == '<' || ch == '{' || ch == '[') {
      depth++;
    } else if (ch == ')' || ch == '>' || ch == '}' || ch == ']') {
      depth--;
    } else if (ch == ',' && depth == 0) {
      parts.add(inner.substring(start, i).trim());
      start = i + 1;
    }
  }
  final last = inner.substring(start).trim();
  if (last.isNotEmpty) parts.add(last);
  return parts;
}

// A stable identity for an `@ids` node value (`Ids.user`) — its enum type + the
// ordinal — so two screens keyed by the SAME node compare equal. Null when the
// value isn't an id-node (a plain codec has no ordinal).
String? _nodeIdentity(DartObject? o) {
  if (o == null || o.isNull) return null;
  final t = o.type?.getDisplayString();
  final i = o.getField('index')?.toIntValue();
  return (t != null && i != null) ? '$t#$i' : null;
}

// An id-node's inner codec VALUE. `codec` when it's a plain field; `_codec`
// when the @ids enum hosts composite rows (there `codec` is a getter over a
// nullable `_codec` backing field, null on the composite rows themselves).
DartObject? _nodeCodec(DartObject? o) {
  final direct = o?.getField('codec');
  if (direct != null && !direct.isNull) return direct;
  final backing = o?.getField('_codec');
  return (backing != null && !backing.isNull) ? backing : null;
}

// Whether an id value's enum wears `@IDs` — the gate for TYPED ids: an
// annotated id-space has generated extension types (`AuthorId`), so verbs and
// casts use them; an unannotated one keeps the raw codec types.
// The mark (`@IDs` or `@canon`) signals the extension types were GENERATED —
// an unmarked IdNode enum has none, so its values stay raw. Annotation-based
// on purpose.
bool _idsAnnotated(DartObject? o) {
  final el = o?.type?.element;
  if (el is! EnumElement) return false;
  return el.metadata.annotations.any(
    (a) => const {
      'IDs',
      'Canon',
    }.contains(a.computeConstantValue()?.type?.element?.name),
  );
}

// The generated extension-type name for an id value: `Ids.author` → `AuthorId`;
// a composite → the record of its components' type names (splittable by the
// composite machinery, assignable to/from the generated typedef). Null when
// the id isn't a node of an `@IDs` enum.
String? _typedIdName(DartObject? o) {
  if (o == null || o.isNull) return null;
  String? nameOf(DartObject n) {
    if (!_idsAnnotated(n)) return null;
    final raw = n.getField('_name')?.toStringValue();
    if (raw == null) return null;
    return '${raw[0].toUpperCase()}${raw.substring(1)}Id';
  }

  final parts = _compositeParts(o);
  if (parts != null) {
    // An @ids enum composite row is its own extension type (`AdChatId`);
    // a static-const composite falls back to the positional tuple.
    final own = nameOf(o);
    if (own != null) return own;
    final names = [for (final p in parts) nameOf(p)];
    if (names.contains(null)) return null;
    return '(${names.join(', ')})';
  }
  return nameOf(o);
}

// A composite id-node's component node values, in order — read from its
// `n1`…`n16` fields (a const constructor can't build a list, so the parts are
// individual fields; the trailing ones are null). Both composite forms carry
// them: a `CompositeId` and a `.compose(...)` row of the @ids enum itself.
// Null when the value isn't a composite.
List<DartObject>? _compositeParts(DartObject? o) {
  if (o == null || o.isNull) return null;
  final n1 = o.getField('n1');
  if (n1 == null || n1.isNull) return null;
  return [
    n1,
    for (var i = 2; i <= 16; i++)
      if (o.getField('n$i') case final n? when !n.isNull) n,
  ];
}

// The `@ids` component nodes an id value is made of: a `CompositeId` carries its
// parts as `n*` fields (atomic nodes have none). Null when the id isn't
// node-based (a plain codec / record).
List<String>? _idNodes(DartObject? idObj) {
  if (idObj == null || idObj.isNull) return null;
  final comps = _compositeParts(idObj);
  if (comps != null) {
    final ids = [for (final c in comps) _nodeIdentity(c)];
    return ids.contains(null) ? null : ids.cast<String>();
  }
  final self = _nodeIdentity(idObj);
  return self == null ? null : [self];
}

// ---- link surface helpers (sibling-class naming, field names) ----------
// A union slot becomes sibling `Link` classes (rule 14), one per branch, split
// across the `Place`/`Link` families and IMPLEMENTing a per-entity
// marker. A non-union endpoint is a single concrete class.
String _linkBase(String className) =>
    className.substring(0, className.length - 4); // drop the "Link" suffix
// The lower-camel field a value codec contributes (`.uuid(#userId)` → userId).
String _branchField(CodecSpec c) =>
    c.nameOverride ?? c.fieldName ?? _lcFirst(c.name);
// Drop a leading occurrence of the entity name (`User` + `username` → `Name`).
String _stripEntity(String entity, String field) {
  if (field.toLowerCase().startsWith(entity.toLowerCase()) &&
      field.length > entity.length) {
    return field.substring(entity.length);
  }
  return field;
}

// The sibling class name for a union branch: `UserMeLink` / `UserByIdLink`.
String _siblingName(String entity, CodecSpec c) => c.isLiteral
    ? '$entity${_cap(c.literal!)}Link'
    : '${entity}By${_cap(_stripEntity(entity, _branchField(c)))}Link';
// A non-union slot's field name on a single concrete class.
String _slotFieldName(Endpoint e, int i) {
  final c = e.slots[i].codecs.first;
  return c.nameOverride ?? c.fieldName ?? 'value$i';
}

// The single union slot index of an endpoint, or null.
int? _unionSlot(Endpoint e) {
  for (var i = 0; i < e.slots.length; i++) {
    if (e.slots[i].isUnion) return i;
  }
  return null;
}

// ---- link builder chain (trie of segments) -----------------------------
// `Link.<route>` fluent path → URL, mirroring canon_link. A node is one URL
// segment; its `_LN…` step class accumulates path/branch values until a
// terminal endpoint exposes `toUri()`. At a union `*` slot, canon's sibling
// model means one BRANCH METHOD per case (`.me()`/`.byId(id)`) instead of
// canon_link's single typed `call`.
class _ChainNode {
  _ChainNode(this.seg, this.path);
  final String seg; // this node's segment (`*` for a slot)
  final List<String> path; // segments from the root, inclusive
  final Map<String, _ChainNode> kids = {};
  Endpoint? refEp; // first endpoint passing through (for slot lookup)
  Endpoint? endpoint; // an endpoint terminates here
  bool terminalOk = false; // reachable terminal for the current family
  int slotOrdinal = -1; // for a `*` node: its index among the endpoint's slots
  final Set<int> okBranches = {}; // for a union `*` node: allowed case indices
}

String _pascalSeg(String s) => s.split('-').map(_cap).join();
// Step-class name from a path: `item/*` → `_LNItemSlot`. The [prefix] differs
// per family so the three tries never share a step class (sharing would let a
// family cross into another's continuation).
String _chainStep(String prefix, List<String> path) =>
    '$prefix${path.map((s) => s == '*' ? 'Slot' : _pascalSeg(s)).join()}';
String _chainSeg(String seg) {
  final p = seg.split('-');
  return p.first + p.skip(1).map(_cap).join();
}

class NavGenerator extends GeneratorForAnnotation<Screens> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError(
        '@screens must annotate an enum',
        element: element,
      );
    }
    final spec = element.name;
    if (spec == null || !spec.startsWith('_')) {
      throw InvalidGenerationSourceError(
        'the @screens enum must be library-private',
        element: element,
      );
    }

    // If the library also declares a regency (`@canon const app = Regency(...)`),
    // the generated `bind()` exists — the manager calls it (idempotently), so
    // the app needs no explicit wiring.
    final hasData =
        element.library.topLevelVariables.any((v) {
          final t = v.type;
          return t is InterfaceType &&
              (t.element.name == 'Regency' ||
                  t.allSupertypes.any((s) => s.element.name == 'Regency'));
        }) ||
        element.library.enums.any(
          (e) => e.allSupertypes.any((t) => t.element.name == 'RegentNode'),
        );

    // Read the VIRTUAL tree first (follows grafts into sub-enums), then build
    // rows from every enum it spans — each tagged with its home enum (`spec`).
    final model = await readTree(element, buildStep);
    final rows = <_Row>[];
    for (final e in model.enums) {
      for (final field in e.fields) {
        if (!field.isEnumConstant) continue;
        final value = field.computeConstantValue();
        final idObj = value?.getField('id');
        final widgetObj = value?.getField('widget');
        final owner = widgetObj != null && !widgetObj.isNull;
        // The id is a `Codec<T>` (or null for an id-free screen): T is the id type
        // (it drives the typed verb), and the codec round-trips the value for
        // restoration. A repeated-key `Codec.list` can't be a single-token id.
        String? idStr;
        List<String>? compTypes;
        List<String>? compNames;
        DartType? idDartType;
        if (idObj != null && !idObj.isNull) {
          // A screen may bind a Codec directly OR an @ids node that carries one in
          // its `codec`/`_codec` field — the SAME node a registry keys by. Unwrap
          // the node to recover the specific value type (the node erases to
          // Codec<Object?>).
          final codecObj = _nodeCodec(idObj);
          final ct = codecObj != null ? codecObj.type : idObj.type;
          if (ct is InterfaceType && ct.element.name == 'ListCodec') {
            throw InvalidGenerationSourceError(
              'screen "${field.name}" uses Codec.list as its id — it carries '
              'repeated URL keys, not a single token, so it can never round-trip. '
              'Use Codec.csv for a single-token list id.',
              element: e,
            );
          }
          idDartType = _codecArg(ct);
          idStr = idDartType?.getDisplayString();
          // A composite id-node's `codec` is a getter (not const-evaluable), so it
          // erases to Object?. Rebuild its record type from the component codecs.
          final compVals = _compositeParts(idObj);
          if (compVals != null) {
            compTypes = [
              for (final c in compVals)
                _typedIdName(c) ??
                    _codecArg(_nodeCodec(c)?.type)?.getDisplayString() ??
                    'Object?',
            ];
            compNames = [
              for (final c in compVals) c.getField('_name')?.toStringValue(),
            ].whereType<String>().toList();
            if (compNames.length != compVals.length) compNames = null;
            idStr = '(${compTypes.join(', ')})';
          }
          // An `@IDs` id-space has generated extension types — the id type IS the
          // typed name (`AuthorId`, `(ProductId, AuthorId)`), erasing to the codec
          // value type at runtime (all casts stay sound).
          idStr = _typedIdName(idObj) ?? idStr;
          // Named component getters exist only on NOMINAL composites (an @ids
          // enum row's extension type) — a structural tuple keeps `.$n`.
          if (idStr == null || idStr.startsWith('(')) compNames = null;
        }
        if (idStr != null &&
            idDartType != null &&
            !_hasValueEquality(idDartType)) {
          log.warning(
            'id type $idStr of "${field.name}" compares by identity — repeat-collapse '
            'and prefix reuse fire only when two id instances are equal, so for this '
            'screen they apply to identical instances only; override == and hashCode '
            'for value semantics',
          );
        }
        rows.add(
          _Row(
            field.name!,
            idStr,
            e.name!,
            owner: owner,
            idNodes: _idNodes(idObj),
            idComponentTypes: compTypes,
            idComponentNames: compNames,
          ),
        );
      }
    }
    // A screen name is ONE screen across the virtual tree. It may be declared
    // once with a widget (the OWNER) and any number of times with a null widget
    // (REFS — a sub-enum's bare row reused for in-family inherit/again). Collapse
    // every name to its single owner row; refs vanish into it. Mirror the runtime
    // checks (screen_node `_canonicalize`): exactly one owner, no dangling ref,
    // and all declarations of a name must agree on id type.
    final byName = <String, List<_Row>>{};
    for (final r in rows) {
      (byName[r.name] ??= []).add(r);
    }
    final collapsed = <_Row>[];
    for (final e in byName.entries) {
      final owners = [
        for (final r in e.value)
          if (r.owner) r,
      ];
      if (owners.length > 1) {
        final specs = (owners.map((r) => r.spec).toSet().toList()..sort());
        throw InvalidGenerationSourceError(
          'screen "${e.key}" has ${owners.length} owners (${specs.join(', ')}) '
          '— only one declaration may carry a widget; the rest must be null-'
          'widget refs.',
          element: element,
        );
      }
      if (owners.isEmpty) {
        throw InvalidGenerationSourceError(
          'screen "${e.key}" is a ref (null widget) with no owner — one same-'
          'named declaration must carry the widget.',
          element: element,
        );
      }
      final idTypes = e.value.map((r) => r.idType).whereType<String>().toSet();
      if (idTypes.length > 1) {
        throw InvalidGenerationSourceError(
          'screen "${e.key}" has conflicting id types (${idTypes.join(', ')}) '
          'across its declarations — owner and refs must agree.',
          element: element,
        );
      }
      // The owner carries the surviving row, but adopt a ref-declared id type if
      // the owner left it off (any disagreement already rejected above).
      final nodes = e.value
          .map((r) => r.idNodes)
          .whereType<List<String>>()
          .toList();
      final comps = e.value
          .map((r) => r.idComponentTypes)
          .whereType<List<String>>()
          .toList();
      final compNames = e.value
          .map((r) => r.idComponentNames)
          .whereType<List<String>>()
          .toList();
      collapsed.add(
        _Row(
          e.key,
          idTypes.isEmpty ? null : idTypes.first,
          owners.single.spec,
          idNodes: nodes.isEmpty ? null : nodes.first,
          idComponentTypes: comps.isEmpty ? null : comps.first,
          idComponentNames: compNames.isEmpty ? null : compNames.first,
        ),
      );
    }
    rows
      ..clear()
      ..addAll(collapsed);

    final idOf = {for (final r in rows) r.name: r.idType};
    // Component type names for NOMINAL composites (extension types): the
    // string form is no longer splittable, so the reader records them.
    final compsOf = <String, List<String>>{
      for (final r in rows)
        if (r.idComponentTypes != null) r.name: r.idComponentTypes!,
    };
    List<String> componentsOf(String screen) =>
        compsOf[screen] ?? _idComponents(idOf[screen]);
    final namesOf = <String, List<String>>{
      for (final r in rows)
        if (r.idComponentNames != null) r.name: r.idComponentNames!,
    };
    // A nominal composite reads `.ad`; a structural tuple reads `.\$1`.
    String componentRead(String src, int comp) {
      final names = namesOf[src];
      return names != null ? '.${names[comp]}' : '.\$${comp + 1}';
    }

    final specOf = {for (final r in rows) r.name: r.spec};
    // A screen's enum-qualified value (`_Root.home`, `Shop.shop`) — the only
    // place graft surfaces in the output; everything else is by name.
    String sv(String name) => '${specOf[name]}.$name';
    // The one enum a screen set lives in — the field type a constructed-only
    // spec site can carry; a graft-mixed set falls back to bare `Enum`.
    String specTypeOf(Iterable<String> screens) {
      final specs = {for (final s in screens) specOf[s]!};
      return specs.length == 1 ? specs.single : 'Enum';
    }

    // A screen literal under a context of [type]: the dot-shorthand when the
    // type pins the enum, the qualified spelling under bare `Enum`.
    String svIn(String type, String name) =>
        type == 'Enum' ? sv(name) : '.$name';
    final treeT = specTypeOf([for (final r in rows) r.name]);

    final tree = model.tree;
    final placements = {for (final r in rows) r.name: <PlacementNode>[]};
    final againEdges = <PlacementNode>[];
    void collect(PlacementNode n) {
      if (n.again != null) {
        againEdges.add(n);
        return;
      }
      placements[n.screen]!.add(n);
      n.children.forEach(collect);
    }

    tree.forEach(collect);

    // View-state per screen (from `placement.query/.fragment`) → typed `<Screen>Query`
    // / `<Screen>Fragment` read models + their `…Mut` setter subtypes.
    final viewScreens =
        <String, ({List<ViewKey> query, List<ViewKey> fragment})>{};
    // Parallel grouped view (preserves allOf/oneOf) for the typed value model.
    final viewGroupsByScreen =
        <String, ({List<ViewGroup> query, List<ViewGroup> fragment})>{};
    void collectView(PlacementNode n) {
      if (n.viewQuery.isNotEmpty || n.viewFragment.isNotEmpty) {
        viewScreens.putIfAbsent(
          n.screen,
          () => (
            query: viewKeys(n.viewQuery, element),
            fragment: viewKeys(n.viewFragment, element),
          ),
        );
        viewGroupsByScreen.putIfAbsent(
          n.screen,
          () => (
            query: viewGroups(n.viewQuery, element),
            fragment: viewGroups(n.viewFragment, element),
          ),
        );
      }
      n.children.forEach(collectView);
    }

    tree.forEach(collectView);

    // The nav body lines exposing a screen's MUTABLE view-state (read+write).
    String viewGetters(String screen) {
      final v = viewScreens[screen];
      if (v == null) return '';
      return [
        if (v.query.isNotEmpty)
          '  ${_cap(screen)}QueryMut get query => const ${_cap(screen)}QueryMut._();',
        if (v.fragment.isNotEmpty)
          '  ${_cap(screen)}FragmentMut get fragment => const ${_cap(screen)}FragmentMut._();',
      ].join('\n');
    }

    // A composite (record) id is sourced component-by-component from its inherit
    // ancestors, so it does NOT route through the single-source `inheritSource`
    // machinery (kick-start rescue, ancestor-reach, On chains). Detect it from
    // the id (a record id has >1 component) and clear `inheritSource` so the
    // single-source paths treat the screen as a plain atomic-record-id screen;
    // the composite verb is emitted separately from `inheritSources`.
    bool isComposite(String screen) =>
        componentsOf(screen).length > 1 &&
        placements[screen]!.any((n) => n.inheritSources.isNotEmpty);
    for (final ps in placements.values) {
      for (final n in ps) {
        if (n.inheritSources.length > 1 || isComposite(n.screen)) {
          n.inheritSource = null;
        }
      }
    }

    // Validate composite inherit: arity within the id's component count, and each
    // source id-bearing with a type matching an as-yet-unclaimed component.
    for (final ps in placements.values) {
      for (final n in ps) {
        if (!isComposite(n.screen) && n.inheritSources.length <= 1) continue;
        final comps = componentsOf(n.screen);
        if (n.inheritSources.length > comps.length) {
          throw InvalidGenerationSourceError(
            '"${n.screen}.inherit(${[for (final s in n.inheritSources) s.screen].join(', ')})": '
            '${n.inheritSources.length} inherit sources but ${n.screen} has only '
            '${comps.length} id component(s) — one source per component at most.',
            element: element,
          );
        }
        final claimed = List<bool>.filled(comps.length, false);
        for (final src in n.inheritSources) {
          final srcT = idOf[src.screen];
          if (srcT == null) {
            throw InvalidGenerationSourceError(
              '"${n.screen}.inherit(${src.screen})": cannot inherit from '
              '${src.screen} — it is id-free, so there is no id to inherit.',
              element: element,
            );
          }
          final idx = [
            for (var i = 0; i < comps.length; i++)
              if (!claimed[i] && comps[i] == srcT) i,
          ].firstOrNull;
          if (idx == null) {
            throw InvalidGenerationSourceError(
              '"${n.screen}.inherit(${src.screen})": ${src.screen}\'s id is $srcT, '
              'which matches no remaining component of ${n.screen}\'s id '
              '(${comps.join(', ')}).',
              element: element,
            );
          }
          claimed[idx] = true;
        }
      }
    }

    // A single-source inherit from a COMPOSITE source PROJECTS one component — the
    // one whose `@ids` node matches this screen's node (by node identity, so two
    // same-typed components stay distinct). Record the index; a projection is NOT
    // flattened past its composite source (its id is one part of that record).
    final nodesOf = {for (final r in rows) r.name: r.idNodes};
    for (final ps in placements.values) {
      for (final n in ps) {
        final src = n.inheritSource;
        if (src == null) continue;
        final srcNodes = nodesOf[src.screen];
        final childNodes = nodesOf[n.screen];
        if (srcNodes != null &&
            srcNodes.length > 1 &&
            childNodes != null &&
            childNodes.length == 1) {
          final i = srcNodes.indexOf(childNodes.first);
          if (i >= 0) n.inheritComponent = i;
        }
      }
    }

    // Flatten every inherit link to its ULTIMATE source, order-independently: a
    // chain editItem→itemPreview→item resolves editItem's source to item (the id
    // screen), so the shared id is detected no matter the declaration order. A
    // projection stops at its composite source (and isn't flattened through).
    for (final ps in placements.values) {
      for (final n in ps) {
        if (n.inheritComponent != null) continue;
        var s = n.inheritSource;
        while (s != null &&
            s.inheritSource != null &&
            s.inheritComponent == null) {
          s = s.inheritSource;
        }
        n.inheritSource = s;
      }
    }

    // An inherited placement's id IS its source's, read live from the chain and
    // stamped under the child screen — so the child must declare the SAME id
    // type as its (ultimate) source. A mismatch would erase through the Object?
    // chain entry and only crash at runtime on the `e.id as <type>` cast, so
    // reject it at build time instead.
    for (final ps in placements.values) {
      for (final n in ps) {
        final src = n.inheritSource;
        if (src == null) continue;
        final childT = idOf[n.screen];
        final srcT = idOf[src.screen];
        if (srcT == null) {
          throw InvalidGenerationSourceError(
            '"${n.screen}.inherit(${src.screen})": cannot inherit from '
            '${src.screen} — it is id-free, so there is no id to inherit.',
            element: element,
          );
        }
        if (childT == null) {
          throw InvalidGenerationSourceError(
            '"${n.screen}.inherit(${src.screen})": ${n.screen} declares no id '
            'type but inherit makes its id ${src.screen}\'s — give ${n.screen} '
            'the id type $srcT.',
            element: element,
          );
        }
        if (childT != srcT) {
          if (n.inheritComponent != null) {
            // A projection: the child's id is ONE component of the composite
            // source — that component's type must match the child's.
            final comps = componentsOf(src.screen);
            final ci = n.inheritComponent!;
            if (ci >= comps.length || comps[ci] != childT) {
              throw InvalidGenerationSourceError(
                '"${n.screen}.inherit(${src.screen})": projects component $ci '
                '(${ci < comps.length ? comps[ci] : 'out of range'}) of '
                '${src.screen}\'s id $srcT, but ${n.screen} is $childT.',
                element: element,
              );
            }
          } else {
            throw InvalidGenerationSourceError(
              '"${n.screen}.inherit(${src.screen})": id type mismatch — '
              '${n.screen} is $childT but ${src.screen} is $srcT. An inheriting '
              'placement must declare the same id type as its source. ',
              element: element,
            );
          }
        }
      }
    }

    // Liveness toggles validate at build: a keep/forget that doesn't flip the
    // inherited state is redundant (mirrors NavSpec._validate).
    void checkLiveness(PlacementNode n, bool live) {
      if (n.keep) {
        if (live) {
          throw InvalidGenerationSourceError(
            '"${n.screen}.keep" is redundant — an ancestor already keeps this '
            'region (need a forget between them)',
            element: element,
          );
        }
        live = true;
      } else if (n.forget) {
        if (!live) {
          throw InvalidGenerationSourceError(
            '"${n.screen}.forget" is redundant — this region is already not '
            'kept (forget only carves inside a keep)',
            element: element,
          );
        }
        live = false;
      }
      for (final c in n.children) {
        checkLiveness(c, live);
      }
    }

    for (final root in tree) {
      checkLiveness(root, false);
    }

    // A back-edge makes its target pushable from the edge's parent too, so
    // `parentOf` counts that parent.
    final backPreds = <String, List<PlacementNode>>{};
    for (final ae in againEdges) {
      final p = ae.parent;
      if (p != null) (backPreds[ae.screen] ??= []).add(p);
    }

    // Canonical tree encoding — must match NavSpec.structureSignature exactly.
    // A mismatch at runtime means the tree was edited without regenerating.
    String sig(PlacementNode n) {
      final kids = [for (final c in n.children) sig(c)]..sort();
      final flags =
          '${n.keep ? 'K' : ''}${n.forget ? 'F' : ''}${n.again != null ? 'A' : ''}';
      return '${n.screen}$flags(${kids.join(',')})';
    }

    final treeSignature = ([for (final r in tree) sig(r)]..sort()).join(';');

    bool isSingle(String screen) => placements[screen]!.length <= 1;
    String unionName(String s) => '${_cap(s)}Nav';
    // A placement of a multi-placement screen is named by its ordinal among
    // that screen's placements: a name joined from the path grows with the
    // tree's depth.
    String placementName(PlacementNode n) => isSingle(n.screen)
        ? unionName(n.screen)
        : '${unionName(n.screen)}${placements[n.screen]!.indexOf(n) + 1}';
    String childType(PlacementNode c) =>
        c.again != null ? placementName(c.again!) : placementName(c);
    // `Screen.pop()` exists when some placement sits on a parent.
    final hasPop = placements.values.any(
      (ps) => ps.any((n) => n.parent != null),
    );
    // The const-list literal of a placement's path, under the tree enum's
    // dot-shorthand when there is one.
    String pathLit(PlacementNode n) =>
        'const [${[for (final s in n.path) svIn(treeT, s)].join(', ')}]';

    // The global teleport (Screen.go / Hop) is the unambiguous kick-start: it
    // may target only a SINGLE-placement, id-free screen. Multi-placement
    // (union) targets are ambiguous (which placement?) and id-behind targets
    // would need a fabricated ancestor id (the null-id bug) — both are reached
    // instead by chaining a forward edge off a handle (Screen.at/on or a prior
    // goXx), where the position, and thus the placement and ancestor ids, is
    // already pinned.
    bool globalSafe(String screen) {
      final ps = placements[screen]!;
      if (ps.length != 1) return false;
      final node = ps.single;
      final src = node.inheritSource;
      // An id-bearing ancestor is allowed ONLY if it shares this screen's id —
      // i.e. it's covered by the inherit chain (same ultimate source) — so the
      // one kick-start id fills it. Otherwise it'd need a fabricated id.
      for (final a in node.ancestors) {
        if (idOf[a.screen] == null) continue;
        if (src != null && identical(a.inheritSource ?? a, src)) continue;
        return false;
      }
      return true;
    }

    // Kick-start body. Plain: one canonical go. Inherit-rescued (id shared with
    // an id-bearing ancestor): kick-start to the source, then edge down to the
    // target, stamping the shared id at every level (never a null ancestor id).
    String kickStart(String screen) {
      final ret = unionName(screen);
      final node = placements[screen]!.single;
      final src = node.inheritSource;
      final idT = idOf[screen];
      if (src == null) {
        final params = idT == null ? '' : '$idT id';
        final arg = idT == null ? '' : ', id';
        return '  static $ret go${_cap(screen)}($params) {\n'
            '    $spec.graph.go(${sv(screen)}$arg);\n'
            '    return const $ret._();\n'
            '  }';
      }
      final steps = node.path.sublist(node.path.indexOf(src.screen));
      final lines = StringBuffer(
        '    $spec.graph.go(${sv(steps.first)}, id);\n',
      );
      for (final s in steps.skip(1)) {
        lines.write('    $spec.graph.go(${sv(s)}, id, true);\n');
      }
      return '  static $ret go${_cap(screen)}($idT id) {\n'
          '$lines'
          '    return const $ret._();\n'
          '  }';
    }

    // Kick-start targets: every globally reachable (single-placement) screen.
    // `Screen.go(Hop)` returns the Hop's exact typed nav (`hop.nav`) — a known
    // target is statically typed; a dynamic (ternary) Hop's LUB is `AnyNav`,
    // switched exhaustively.
    final kickstartNavs = [
      for (final r in rows)
        if (globalSafe(r.name)) unionName(r.name),
    ];
    final hasKickstart = kickstartNavs.isNotEmpty;

    // parentOf exists only to DISAMBIGUATE: it offers a screen X iff X has 2+
    // distinct parent placements (with one parent you'd just name it, e.g.
    // `Screen.on(.ad)?.goEditAd()`; a root has none). `Screen.on(.parentOf.x)`
    // resolves — by current-top membership in X's parent screens — to a handle
    // exposing what's provable at ANY of those parents: the push to X, every
    // sibling edge shared by all parents, and pop() when all parents are
    // non-root (the intersection of the parents' capabilities).
    final parentsOf = <String, List<PlacementNode>>{};
    for (final r in rows) {
      final ps = <PlacementNode>[];
      final seen = <String>{};
      for (final p in [
        for (final n in placements[r.name]!)
          if (n.parent != null) n.parent!,
        // A screen reached via a back-edge (.again) is pushable from that
        // edge's parent too — so e.g. parentOf.userProfile covers a
        // userProfile screen pushing another (the .again self-recursion).
        ...?backPreds[r.name],
      ]) {
        if (seen.add(p.path.join('/'))) ps.add(p);
      }
      // Ambiguous only when the parents span 2+ distinct SCREENS — if they're
      // all the same screen you'd just name it (`on(.item)`). Shared
      // capabilities are still intersected over all parent placements below.
      if ({for (final p in ps) p.screen}.length >= 2) parentsOf[r.name] = ps;
    }
    final parentScreensOf = {
      for (final e in parentsOf.entries)
        e.key: {for (final p in e.value) p.screen},
    };
    // Children screens common to ALL of x's parents (x itself is always one,
    // since every parent has x as a child).
    Set<String> sharedChildrenOf(List<PlacementNode> parents) => parents
        .map((p) => {for (final c in p.children) c.screen})
        .reduce((a, b) => a.intersection(b));
    // Uniform inherit source across all of X's placements (null if none, or if
    // mixed id-bearing/inherited — the signature-split case, deferred).
    String? inheritSrcUniform(String screen) {
      final ns = placements[screen]!;
      if (ns.isEmpty || ns.any((n) => n.inheritSource == null)) return null;
      final srcs = {for (final n in ns) n.inheritSource!.screen};
      return srcs.length == 1 ? srcs.single : null;
    }

    // Uniform projected-component across X's placements (null = whole id).
    int? inheritComponentUniform(String screen) {
      final comps = {for (final n in placements[screen]!) n.inheritComponent};
      return comps.length == 1 ? comps.single : null;
    }

    // Read a source's live id, projecting one record component for a projection.
    String idRead(String src, int? comp) => comp == null
        ? '_idOf(${svIn(treeT, src)})'
        : '(_idOf(${svIn(treeT, src)}) as ${idOf[src]}?)?${componentRead(src, comp)}';
    String parentPush(String x) {
      final src = inheritSrcUniform(x);
      final idT = idOf[x];
      final params = (src != null || idT == null) ? '' : '$idT id';
      final arg = src != null
          ? idRead(src, inheritComponentUniform(x))
          : (idT == null ? 'null' : 'id');
      // Named after the committed target (go<Target>), consistent with every
      // other push verb — the selector already narrowed to this screen. A
      // handle minted by `ownerOf` goes from its owner. It lands among several
      // parents, so it hands back no placement.
      return '  void go${_cap(x)}($params) {\n'
          '    if (_at case final at?) {\n'
          '      $spec.graph.goFrom(at, ${sv(x)}, $arg);\n'
          '    } else {\n'
          '      $spec.graph.go(${sv(x)}, $arg, true);\n'
          '    }\n'
          '  }';
    }

    // A composite-id placement assembled from its inherit ancestors: the record
    // value to push and the params for the components NO ancestor supplies.
    // Inherited components read the live ancestor id (`_idOf`); remaining ones
    // are required args (each as its component type). Null when not composite.
    ({String params, String record})? compositeVerb(PlacementNode n) {
      if (n.inheritSources.isEmpty) return null;
      final comps = componentsOf(n.screen);
      if (comps.length < 2) return null;
      final filled = List<String?>.filled(comps.length, null);
      for (final src in n.inheritSources) {
        final srcT = idOf[src.screen];
        final idx = [
          for (var i = 0; i < comps.length; i++)
            if (filled[i] == null && comps[i] == srcT) i,
        ].first;
        filled[idx] = '_idOf(${svIn(treeT, src.screen)})';
      }
      final missing = [
        for (var i = 0; i < comps.length; i++)
          if (filled[i] == null) i,
      ];
      final names = <int, String>{};
      if (missing.length == 1) {
        names[missing.single] = 'id';
      } else {
        for (var k = 0; k < missing.length; k++) {
          names[missing[k]] = 'id$k';
        }
      }
      final params = [for (final i in missing) '${comps[i]} ${names[i]}'];
      for (final i in missing) {
        filled[i] = names[i];
      }
      return (params: params.join(', '), record: '(${filled.join(', ')})');
    }

    // A position-anchored handle (non-null path) navigates edge-required: the
    // target must be a live edge from the current top or graph.go throws (a
    // stale handle), never a silent canonical teleport. Stale-but-still-legal
    // resolves. Entry-point navs (null path) stay total (canonical allowed).
    String goVerb(
      String child,
      String returns, [
      List<String>? path,
      String? inheritSrc,
      PlacementNode? node,
    ]) {
      // A position-anchored verb goes FROM its placement: back to it when it's
      // buried, then along the edge — so `at(.x)?.goChild()` works from
      // anywhere on the stack, a handle whose screen has left does nothing,
      // and a repeat lands on the entry already there (`graph.goFrom`).
      String from(String id) => path != null && path.isNotEmpty
          ? '$spec.graph.goFrom(${sv(path.last)}, ${sv(child)}, $id)'
          : '$spec.graph.go(${sv(child)}, $id, true)';
      // Composite-id edge (chained only): the id is a record assembled from the
      // inherit ancestors; the verb shrinks to only the unsupplied components.
      final comp = node == null ? null : compositeVerb(node);
      if (comp != null && path != null) {
        return '  $returns go${_cap(child)}(${comp.params}) {\n'
            '    ${from(comp.record)};\n'
            '    return const $returns._();\n'
            '  }';
      }
      // Inherited edge (chained only): id IS the ancestor's, read live from the
      // chain — no parameter to pass, none to get wrong. A PROJECTION reads one
      // record component of a composite source instead of the whole id.
      if (inheritSrc != null && path != null) {
        final ci = node?.inheritComponent;
        final read = ci == null
            ? '_idOf(${svIn(treeT, inheritSrc)})'
            : '(_idOf(${svIn(treeT, inheritSrc)}) as ${idOf[inheritSrc]}?)'
                  '?${componentRead(inheritSrc, ci)}';
        return '  $returns go${_cap(child)}() {\n'
            '    ${from(read)};\n'
            '    return const $returns._();\n'
            '  }';
      }
      final idT = idOf[child];
      final params = idT == null ? '' : '$idT id';
      final call = path != null
          ? from(idT == null ? 'null' : 'id')
          : '$spec.graph.go(${sv(child)}${idT == null ? '' : ', id'})';
      return '  $returns go${_cap(child)}($params) {\n'
          '    $call;\n'
          '    return const $returns._();\n'
          '  }';
    }

    // One verb per child screen; placement tiers resolve the return type
    // exactly, union tiers by screen.
    List<String> goVerbs(
      Iterable<PlacementNode> children,
      String Function(PlacementNode) type, [
      List<String>? path,
    ]) {
      final byChild = <String, PlacementNode>{};
      for (final c in children) {
        byChild[c.screen] = c;
      }
      return [
        for (final e in byChild.entries)
          goVerb(
            e.key,
            type(e.value),
            path,
            e.value.inheritSource?.screen,
            e.value,
          ),
      ];
    }

    final b = StringBuffer();

    // Emits a placement's nav: `surface()`, its view-state getter and one
    // forward verb per child. Markers it is a case of ride `implements`.
    void navClass(
      String className,
      List<String> verbs, {
      List<String> markers = const [],
      String? extra,
      List<String>? path,
    }) {
      final allMarkers = [...markers];
      // A foreground-resolvable placement EXTENDS the sealed [AnyPlacement] (so a
      // ternary's LUB lands there, exhaustively switchable); other handles extend
      // the bare [AnyNav]. The 'AnyPlacement' marker is the flag, consumed here.
      final base = allMarkers.remove('AnyPlacement')
          ? 'AnyPlacement'
          : 'AnyNav';
      final impl = allMarkers.isEmpty
          ? ''
          : ' implements ${allMarkers.join(', ')}';
      b.writeln('final class const $className._() extends $base$impl {');
      b.writeln('  this : super._();');
      // `surface()`: ensure this placement is the foreground — a no-op if it
      // already is, else pop the stack back to it (sim-safe). Returns itself,
      // forward-capable. The one op `at` adds over `on` (popping to a child is
      // just the smart `goXx`). Bare name dodges the `popTo<Screen>` collision.
      if (base == 'AnyPlacement' && path != null && path.isNotEmpty) {
        b.writeln(
          '  $className surface() { $spec.graph.popTo(${sv(path.last)}); return const $className._(); }',
        );
      }
      if (extra != null) b.writeln(extra);
      verbs.forEach(b.writeln);
      b.writeln('}');
    }

    final hasMulti = rows.any((r) => !isSingle(r.name));
    final hasInherit = placements.values.any(
      (ps) =>
          ps.any((n) => n.inheritSource != null || n.inheritSources.isNotEmpty),
    );
    final hasParentOf = parentScreensOf.isNotEmpty;

    b.writeln('// ignore_for_file: library_private_types_in_public_api');
    // The generated bridge calls canon's @internal ScreenScope statics.
    b.writeln('// ignore_for_file: invalid_use_of_internal_member');
    // A placement's verbs implement its screen's sealed `…Placement`.
    b.writeln('// ignore_for_file: annotate_overrides');
    if (hasInherit) {
      // An inherited edge reads its ancestor's live id from the chain (null
      // once it has left — the verb then does nothing).
      b.writeln('Object? _idOf($treeT s) {');
      b.writeln('  for (final e in $spec.graph.stack.reversed) {');
      b.writeln('    if (e.screen == s) return e.id;');
      b.writeln('  }');
      b.writeln('  return null;');
      b.writeln('}');
    }
    if (hasMulti) {
      b.writeln('bool _chainIs(List<Enum> a, List<$treeT> b) {');
      b.writeln('  if (a.length != b.length) return false;');
      b.writeln('  for (var i = 0; i < a.length; i++) {');
      b.writeln('    if (a[i] != b[i]) return false;');
      b.writeln('  }');
      b.writeln('  return true;');
      b.writeln('}');
    }

    b.writeln('final class const Screen<I>._(final Enum _spec) {');
    b.writeln("  /// This screen's name, as written in the grammar enum — the");
    b.writeln(
      '  /// readable identity of a stack entry (`Screen.stack.current.name`).',
    );
    b.writeln('  String get name => _spec.name;');
    for (final r in rows) {
      b.writeln(
        '  static const ${r.name} = Screen<${r.idType ?? 'Never'}>._(${sv(r.name)});',
      );
    }
    b.writeln(
      '  static Screen<Object?> _forSpec(Enum spec) => _bySpec[spec]!;',
    );
    b.writeln(
      '  /// The [Screen] constant for a grammar row — `pageOf`\'s bridge from',
    );
    b.writeln(
      '  /// `PageCtx.screen` to the typed surface (per-screen meta extensions',
    );
    b.writeln('  /// switch on the constants).');
    b.writeln('  static Screen<Object?> from(Enum spec) => _bySpec[spec]!;');
    b.writeln('  static const _bySpec = <Enum, Screen<Object?>>{');
    // the boot sentinel maps to a placeholder Screen so stack/observe stay safe.
    b.writeln('    BootScreen.root: Screen<Never>._(BootScreen.root),');
    for (final r in rows) {
      b.writeln('    ${sv(r.name)}: ${r.name},');
    }
    b.writeln('  };');
    b.writeln(
      '  /// The live active stack as wrappers: .current/.currentId/.tab/',
    );
    b.writeln('  /// .screens/.reachable, extensible without touching Screen.');
    b.writeln('  static NavStack<Screen<Object?>> get stack => NavStack([');
    b.writeln(
      '    for (final e in $spec.graph.stack) NavEntry(_forSpec(e.screen), e.id),',
    );
    b.writeln('  ]);');
    b.writeln("  static const _treeSignature = '$treeSignature';");
    b.writeln(
      '  /// True when this generated code still matches the live tree.',
    );
    b.writeln('  static bool get isCodegenFresh =>');
    b.writeln('      $spec.graph.structureSignature == _treeSignature;');
    b.writeln('  static final bool _fresh = () {');
    b.writeln('    assert(isCodegenFresh,');
    b.writeln(
      "        'canon: the navigation tree changed but generated code is stale — run build_runner.');",
    );
    b.writeln('    return true;');
    b.writeln('  }();');
    b.writeln('  /// THE app host — a `RouterDelegate`. Wire it once:');
    b.writeln(
      '  /// `MaterialApp.router(routerDelegate: Screen.manager)`.',
    );
    b.writeln('  static NavDelegate get manager {');
    b.writeln('    assert(_fresh);');
    if (hasData) b.writeln('    ledger.bind();');
    b.writeln('    return $spec.graph.delegate;');
    b.writeln('  }');
    if (hasKickstart) {
      b.writeln(
        '  /// Executes a resolved [Hop] — a kick-start or a parsed [Place].',
      );
      b.writeln('  static N go<N extends AnyNav>(Hop<N> hop) {');
      // Explicit `<Object?>` — a chain id is statically `Object?`, which would
      // otherwise infer `T = Object` and trip go's "requires an id" assert on a
      // null-id (id-free) segment. The chain is pre-validated, so replay freely.
      b.writeln(
        '    for (final (s, i) in hop.chain) $spec.graph.go<Object?>(s, i);',
      );
      b.writeln('    return hop.nav;');
      b.writeln('  }');
    }
    b.writeln(
      '  /// If the live stack ends with this selector path (every pinned id),',
    );
    b.writeln('  /// its nav — else null.');
    b.writeln('  static N? on<N extends AnyNav>(On<N> which) {');
    if (hasParentOf) {
      // parentOf selector matches by current-top membership, not a suffix path.
      b.writeln('    if (which is OnParentOf<N>) {');
      b.writeln(
        '      return which.parents.contains($spec.graph.current) ? which.nav : null;',
      );
      b.writeln('    }');
    }
    b.writeln('    final st = $spec.graph.stack;');
    b.writeln('    final specs = which.specs;');
    b.writeln('    if (st.length < specs.length) return null;');
    b.writeln('    final off = st.length - specs.length;');
    b.writeln('    for (var i = 0; i < specs.length; i++) {');
    b.writeln('      if (st[off + i].screen != specs[i]) return null;');
    b.writeln('      final wid = which.ids[i];');
    b.writeln('      if (wid != null && st[off + i].id != wid) return null;');
    b.writeln('    }');
    b.writeln('    return _atOf(specs.last) as N;');
    b.writeln('  }');
    // `at`: like `on`, but the path may end ANYWHERE on the live stack (buried or
    // front), so you can `surface()` it or `goX()` (a smart jump). Same grammar.
    b.writeln(
      '  /// The placement if this selector path is anywhere on the live stack',
    );
    b.writeln(
      '  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.',
    );
    b.writeln('  static N? at<N extends AnyNav>(On<N> which) {');
    if (hasParentOf) {
      b.writeln('    if (which is OnParentOf<N>) return null;');
    }
    b.writeln('    final st = $spec.graph.stack;');
    b.writeln('    final specs = which.specs;');
    b.writeln('    outer:');
    b.writeln('    for (var e = st.length - 1; e >= specs.length - 1; e--) {');
    b.writeln('      final off = e - specs.length + 1;');
    b.writeln('      for (var i = 0; i < specs.length; i++) {');
    b.writeln('        if (st[off + i].screen != specs[i]) continue outer;');
    b.writeln('        final wid = which.ids[i];');
    b.writeln(
      '        if (wid != null && st[off + i].id != wid) continue outer;',
    );
    b.writeln('      }');
    b.writeln('      return _atOf(specs.last) as N;');
    b.writeln('    }');
    b.writeln('    return null;');
    b.writeln('  }');
    // The total handle: the screen OWNING [context], never null. Its verbs go
    // from that screen, so a tap that lands after the stack moved (a double
    // tap, a late callback) still lands where it was made — or, once that
    // screen has left, does nothing.
    b.writeln(
      '  /// The nav of the screen OWNING [context] (this widget\'s screen),',
    );
    b.writeln(
      '  /// typed by [which]. Total: its verbs go from that screen.',
    );
    b.writeln(
      '  /// Throws a [StateError] when [context] stands at another placement.',
    );
    b.writeln(
      '  static N ownerOf<N extends AnyNav>(BuildContext context, On<N> which) {',
    );
    b.writeln('    final entry = ScreenScope.entryOf(context);');
    b.writeln('    final own = entry.screen;');
    if (hasParentOf) {
      b.writeln('    if (which is OnParentOf<N>) {');
      b.writeln('      if (which.parents.contains(own)) return which.at(own);');
      b.writeln(
        "      throw StateError('ownerOf: \${own.name} is no parent of this push');",
      );
      b.writeln('    }');
    }
    // The owner's own placement — buried, front, or already gone — whose
    // path must end with the selector's.
    b.writeln('    final chain = $spec.graph.chainOf(entry);');
    b.writeln('    final specs = which.specs;');
    b.writeln('    final off = chain.length - specs.length;');
    b.writeln('    for (var i = 0; i < specs.length; i++) {');
    b.writeln('      if (off < 0 || chain[off + i] != specs[i]) {');
    b.writeln(
      "        throw StateError('ownerOf(\${specs.map((s) => s.name).join('.')}) at \${chain.map((s) => s.name).join('/')}');",
    );
    b.writeln('      }');
    b.writeln('    }');
    b.writeln('    return _placementOf(own, chain) as N;');
    b.writeln('  }');
    {
      b.writeln(
        '  /// THE navigation resolver — assign once (ideally in `main` before',
      );
      b.writeln(
        '  /// `runApp`). Fires with the cold-start link (or null), then on every',
      );
      b.writeln('  /// deep link — web URL + mobile app-link, one channel.');
      b.writeln('  static set resolver(void Function(Url? url) fn) =>');
      b.writeln('      $spec.graph.setResolver((url) => fn(parseUrl(url)),');
      b.writeln('          boot: $spec.graph.bootUrl ??');
      b.writeln(
        '              WidgetsBinding.instance.platformDispatcher.defaultRouteName);',
      );
    }
    if (hasPop) {
      b.writeln(
        '  /// Pops the active top when it sits on a parent; a no-op at a root.',
      );
      b.writeln('  static void pop() {');
      b.writeln(
        '    if ($spec.graph.currentChain.length > 1) $spec.graph.pop();',
      );
      b.writeln('  }');
    }
    b.writeln(
      '  /// A broadcast stream of committed navigations as typed snapshots:',
    );
    b.writeln(
      '  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for',
    );
    b.writeln('  /// the landed screen + its typed id. Filter with `.where`.');
    b.writeln('  static Stream<ScreenNavigation> get navigations =>');
    b.writeln('      $spec.graph.navigations.map(ScreenNavigation._);');
    for (final r in rows) {
      if (!globalSafe(r.name)) {
        continue; // id-behind targets: reach via chaining
      }
      b.writeln('  ${kickStart(r.name).trim()}');
    }
    b.writeln('}');
    b.writeln('');

    // A committed navigation, retyped: the engine's `(Enum, Object?)` stacks
    // mapped to the public sealed `ScreenEntry`, so the destination's id is
    // typed. Derivations (direction/forward/…) forward from the runtime snapshot.
    // The boot placement is no screen of the tree, so the stacks leave it out.
    b.writeln('/// One committed navigation as typed [ScreenEntry] stacks.');
    b.writeln('final class ScreenNavigation._(final Navigation _n) {');
    b.writeln('  List<ScreenEntry> get from =>');
    b.writeln('      [for (final e in _n.from) if (e.\$1 != BootScreen.root) _entryOf(e.\$1, e.\$2)];');
    b.writeln('  List<ScreenEntry> get to =>');
    b.writeln('      [for (final e in _n.to) if (e.\$1 != BootScreen.root) _entryOf(e.\$1, e.\$2)];');
    b.writeln(
      '  ScreenEntry get source => _entryOf(_n.source.\$1, _n.source.\$2);',
    );
    b.writeln('  ScreenEntry get destination =>');
    b.writeln('      _entryOf(_n.destination.\$1, _n.destination.\$2);');
    b.writeln('  NavDirection get direction => _n.direction;');
    b.writeln('  bool get isForward => _n.isForward;');
    b.writeln('  bool get isBackward => _n.isBackward;');
    b.writeln('  bool get isRoundTrip => _n.isRoundTrip;');
    b.writeln('  bool get isJump => _n.isJump;');
    b.writeln('}');
    b.writeln('');

    b.writeln(
      '/// One typed entry per screen — `switch` it for the screen-specific id.',
    );
    b.writeln('sealed class const ScreenEntry();');
    for (final r in rows) {
      final idT = idOf[r.name];
      final cls = '${_cap(r.name)}Entry';
      if (idT == null) {
        b.writeln('final class const $cls() extends ScreenEntry;');
      } else {
        b.writeln('final class const $cls(final $idT id) extends ScreenEntry;');
      }
    }
    b.writeln('ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {');
    for (final r in rows) {
      final idT = idOf[r.name];
      final cls = '${_cap(r.name)}Entry';
      b.writeln(
        idT == null
            ? '      ${sv(r.name)} => const $cls(),'
            : '      ${sv(r.name)} => $cls(id as $idT),',
      );
    }
    b.writeln("      _ => throw StateError('not a $spec screen'),");
    b.writeln('    };');
    b.writeln('');

    if (hasKickstart) {
      b.writeln(
        'final class const Hop<N extends AnyNav>._('
        'final Enum spec, final Object? id, final N nav) {',
      );
      b.writeln(
        '  /// The root-down chain this hop replays. A single kick-start is one',
      );
      b.writeln(
        '  /// segment; a navigable `Place` (a `Place`) overrides it with its',
      );
      b.writeln('  /// full path, so `Screen.go` lands the whole placement.');
      b.writeln('  List<(Enum, Object?)> get chain => [(spec, id)];');
      b.writeln('  /// The screen this hop lands on — the total projection');
      b.writeln('  /// (the inverse needs an id, so it stays a Hop ctor).');
      b.writeln('  Screen<Object?> get screen => Screen._forSpec(spec);');
      for (final r in rows) {
        if (!globalSafe(r.name))
          continue; // id-behind targets: reach via chaining
        // Inherit-rescued kick-starts need a multi-step chain; a Hop is one go, so
        // they get the named Screen.goX only, not the Hop/ternary form.
        if (placements[r.name]!.single.inheritSource != null) continue;
        final n = unionName(r.name);
        if (r.idType == null) {
          b.writeln(
            '  static const ${r.name} = Hop<$n>._(${sv(r.name)}, null, $n._());',
          );
        } else {
          b.writeln(
            '  static Hop<$n> ${r.name}(${r.idType} id) => Hop._(${sv(r.name)}, id, const $n._());',
          );
        }
      }
      b.writeln('}');
    }

    // Screen.on(.path) selector: a suffix the matcher tests against the live
    // stack. On<N> accumulates one (spec, id) per segment; each chain step
    // narrows the live placement set FORWARD, so only satisfiable child paths are
    // offered (no impossible chain like a child that exists only under a
    // different parent).
    final stepBuf = StringBuffer();
    final stepEmitted = <String>{};
    // A single placement → its exact nav; a multi-placement screen → its sealed
    // `…Placement` (resolved by `Screen.on`; the selector carries no nav).
    String navTypeOf(List<PlacementNode> ms) => ms.length == 1
        ? placementName(ms.single)
        : '${_cap(ms.first.screen)}Placement';
    List<PlacementNode> fwd(List<PlacementNode> ms) => [
      for (final m in ms)
        for (final c in m.children)
          if (c.again == null) c,
    ];
    // A step is named by its placement set: the whole screen (`OnUser`), one
    // placement (`OnUser3`, after its nav), or a numbered subset (`OnUserS2`).
    final subsetNames = <String, String>{};
    String setStem(List<PlacementNode> ms) {
      final sc = ms.first.screen;
      if (ms.length == 1) {
        final pn = placementName(ms.single);
        return '${_cap(sc)}${pn.substring(unionName(sc).length)}';
      }
      if (ms.length == placements[sc]!.length) return _cap(sc);
      final key = [
        for (final m in ms) placements[sc]!.indexOf(m),
      ].join(',');
      return subsetNames.putIfAbsent(
        '$sc:$key',
        () =>
            '${_cap(sc)}S${subsetNames.keys.where((k) => k.startsWith('$sc:')).length + 1}',
      );
    }

    // A step type is needed when the set can be refined further (forward
    // children) or carries an id (the OnX class hosts `call(id)` so the
    // selector is `.x` for any id and `.x(id)` to pin one). Otherwise an
    // id-free leaf lands on a bare On<nav>.
    String? stepNameFor(List<PlacementNode> ms) {
      final sc = ms.first.screen;
      if (fwd(ms).isEmpty && idOf[sc] == null) return null;
      return 'On${setStem(ms)}';
    }

    void emitStep(List<PlacementNode> ms) {
      final name = stepNameFor(ms);
      if (name == null || !stepEmitted.add(name)) return;
      final sc = ms.first.screen;
      final nav = navTypeOf(ms);
      final groups = <String, List<PlacementNode>>{};
      for (final c in fwd(ms)) {
        // An inherited child is NOT a chain segment: its id is forced to the
        // parent's, so a chain like on(.ad(id).editAd(other)) could contradict
        // it. Select it directly instead — on(.editAd(id)) — keyed by the one
        // shared id (its top-level On.editAd still exists).
        if (c.inheritSource != null) continue;
        (groups[c.screen] ??= []).add(c);
      }
      stepBuf.writeln(
        'final class const $name._(super.specs, super.ids, super.nav) '
        'extends On<$nav> {',
      );
      stepBuf.writeln('  this : super._();');
      // Every child selector is a getter (id appended as null = "match any");
      // an id-bearing child's own step hosts `call(id)` to pin it.
      for (final e in groups.entries) {
        final cNav = navTypeOf(e.value);
        final cStep = stepNameFor(e.value);
        final ret = cStep ?? 'On<$cNav>';
        final ctor = cStep ?? 'On';
        // Single child → its exact nav; multi child → null (Screen.on resolves).
        final cArg = e.value.length == 1
            ? 'const ${placementName(e.value.single)}._()'
            : 'null';
        stepBuf.writeln(
          '  $ret get ${e.key} => $ctor._([...specs, ${svIn(treeT, e.key)}], [...ids, null], $cArg);',
        );
      }
      if (idOf[sc] != null) {
        stepBuf.writeln(
          '  $name call(${idOf[sc]} id) => $name._(specs, [...ids.sublist(0, ids.length - 1), id], nav);',
        );
      }
      stepBuf.writeln('}');
      for (final e in groups.entries) {
        emitStep(e.value);
      }
    }

    // The synthetic boot placement: `_atOf` maps the boot entry to it until
    // the first commit, which auto-replaces it (the loading screen leaves no
    // history).
    b.writeln(
      'final class const Root._() extends AnyPlacement { this : super._(); }',
    );

    b.writeln(
      'final class const On<N extends AnyNav>._(final List<$treeT> specs, '
      'final List<Object?> ids, final N? nav) {',
    );
    for (final r in rows) {
      final ms = placements[r.name]!;
      if (ms.isEmpty) continue;
      final nav = navTypeOf(ms);
      final navArg = isSingle(r.name)
          ? 'const ${unionName(r.name)}._()'
          : 'null';
      final step = stepNameFor(ms);
      final ret = step ?? 'On<$nav>';
      final ctor = step ?? 'On';
      // Always a getter (id = null matches any); `.x(id)` invokes the step's
      // call() to pin a specific id.
      b.writeln(
        '  static $ret get ${r.name} => $ctor._([${svIn(treeT, r.name)}], [null], $navArg);',
      );
    }
    if (hasParentOf) {
      b.writeln(
        '  /// Disambiguating push onto the current scope when a screen has',
      );
      b.writeln(
        '  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —',
      );
      b.writeln(
        '  /// `.parentOf` alone is not an `On`, so the bare form will not compile.',
      );
      b.writeln('  static _ParentSel get parentOf => const _ParentSel._();');
    }
    b.writeln('}');
    if (hasParentOf) {
      final parentT = specTypeOf([
        for (final ps in parentScreensOf.values) ...ps,
      ]);
      // [at] mints the owner-anchored handle `Screen.ownerOf` returns.
      b.writeln(
        'final class const OnParentOf<N extends AnyNav>._('
        'final Set<$parentT> parents, N nav, final N Function(Enum) at) '
        'extends On<N> {',
      );
      b.writeln('  this : super._(const [], const [], nav);');
      b.writeln('}');
      b.writeln('final class const _ParentSel._() {');
      for (final e in parentScreensOf.entries) {
        final cap = '${_cap(e.key)}NavParent';
        final lits = (e.value.toList()..sort())
            .map((s) => svIn(parentT, s))
            .join(', ');
        b.writeln('  OnParentOf<$cap> get ${e.key} =>');
        b.writeln(
          '      OnParentOf._(const {$lits}, const $cap._(), $cap._);',
        );
      }
      b.writeln('}');
      for (final e in parentsOf.entries) {
        final cap = '${_cap(e.key)}NavParent';
        final parents = e.value;
        // Push the target plus every sibling edge shared by all parents.
        final shared = sharedChildrenOf(parents).toList()..sort();
        b.writeln(
          'final class const $cap._([final Enum? _at]) extends AnyNav {',
        );
        b.writeln('  this : super._();');
        for (final child in shared) {
          b.writeln(parentPush(child));
        }
        b.writeln('}');
      }
    }
    for (final r in rows) {
      emitStep(placements[r.name]!);
    }
    b.write(stepBuf);

    // The sealed root of every foreground-resolvable placement — exactly what
    // `Screen.at` / a view's `.at` resolve to, so a switch over them is
    // exhaustive (each screen's `…Placement` and single-parent nav implement it).
    b.writeln(
      'sealed class const AnyPlacement._() extends AnyNav { this : super._(); }',
    );
    b.writeln('');
    // The one resolver: a screen → its CURRENT placement, off the live chain
    // truncated at that screen (so it resolves an ancestor as well as the top).
    // `Screen.at`, `Screen.on`, and every `pop()` route through here.
    b.writeln('AnyPlacement _atOf(Enum s) {');
    b.writeln('  final c = $spec.graph.currentChain;');
    b.writeln('  return _placementOf(s, c.sublist(0, c.lastIndexOf(s) + 1));');
    b.writeln('}');
    // A screen's placement given its path [p], trunk first.
    b.writeln('AnyPlacement _placementOf(Enum s, List<Enum> p) => switch (s) {');
    for (final r in rows) {
      b.writeln(
        isSingle(r.name)
            ? '    ${sv(r.name)} => const ${unionName(r.name)}._(),'
            : '    ${sv(r.name)} => _resolve${_cap(r.name)}Placement(p),',
      );
    }
    b.writeln('    BootScreen.root => const Root._(),');
    b.writeln("    _ => throw StateError('not a $spec screen'),");
    b.writeln('  };');
    b.writeln('');
    b.writeln('abstract base class const AnyNav._();');

    for (final r in rows) {
      final nodes = placements[r.name]!;
      if (isSingle(r.name)) {
        final n = nodes.isEmpty ? null : nodes.first;
        // 'AnyPlacement' (the sealed root) since a single-parent screen's nav
        // is exactly what `Screen.at` resolves to for it.
        navClass(
          unionName(r.name),
          n == null ? const [] : goVerbs(n.children, childType, n.path),
          markers: const ['AnyPlacement'],
          path: n?.path,
          extra: viewScreens.containsKey(r.name) ? viewGetters(r.name) : null,
        );
        continue;
      }

      // Multi-placement: one sealed `…Placement` per screen — what `Screen.on`
      // resolves to — declaring the verbs every placement shares; each
      // placement's nav supplies the body with its exact return.
      Set<String> sharedFwd(List<PlacementNode> group) => [
        for (final n in group) {for (final c in n.children) c.screen},
      ].reduce((a, b) => a.intersection(b));
      // The parameters a child's verb takes AT ONE POSITION — exactly goVerb's
      // rule: a composite edge shrinks to its unsupplied components, a whole
      // inherited edge takes none, anything else takes the child's id.
      String verbParams(PlacementNode c) {
        final comp = compositeVerb(c);
        if (comp != null) return comp.params;
        final idT = idOf[c.screen];
        return c.inheritSource != null || idT == null ? '' : '$idT id';
      }

      List<String> sharedVerbSigs(List<PlacementNode> group) {
        final fwdShared = sharedFwd(group);
        final seen = <String>{};
        final sigs = <String>[];
        for (final n in group) {
          for (final c in n.children) {
            if (!fwdShared.contains(c.screen) || !seen.add(c.screen)) continue;
            final params = verbParams(c);
            // Positions may reach one child differently (inherited here, given
            // an id there) — then no one signature is true of the group, and
            // the verb stays on the leaves that can honestly declare it.
            final agrees = group.every((m) {
              final o = m.children
                  .where((y) => y.screen == c.screen)
                  .firstOrNull;
              return o == null || verbParams(o) == params;
            });
            if (!agrees) continue;
            final ret = isSingle(c.screen)
                ? unionName(c.screen)
                : '${_cap(c.screen)}Placement';
            sigs.add('  $ret go${_cap(c.screen)}($params);');
          }
        }
        return sigs;
      }

      final marker = '${_cap(r.name)}Placement';
      // The resolver: live chain → the exact placement.
      b.writeln('$marker _resolve$marker(List<Enum> c) {');
      for (final n in nodes) {
        b.writeln(
          '  if (_chainIs(c, ${pathLit(n)})) return const ${placementName(n)}._();',
        );
      }
      b.writeln("  throw StateError('unresolved ${r.name} placement: \$c');");
      b.writeln('}');
      final sigs = [
        ...sharedVerbSigs(nodes),
        '  $marker surface();',
        if (viewScreens.containsKey(r.name))
          '  ${_cap(r.name)}QueryMut get query;',
      ];
      b.writeln(
        'sealed class $marker implements AnyPlacement {\n${sigs.join('\n')}\n}',
      );
      for (final n in nodes) {
        navClass(
          placementName(n),
          goVerbs(n.children, childType, n.path),
          markers: ['AnyPlacement', marker],
          path: n.path,
          extra: viewScreens.containsKey(n.screen)
              ? viewGetters(n.screen)
              : null,
        );
      }
    }

    // A typed key for ONLY the id-bearing screens, so `context.idOf(.x)` can't
    // be asked for a screen that has no id (it wouldn't compile).
    final idRows = [
      for (final r in rows)
        if (r.idType != null) r,
    ];
    if (idRows.isNotEmpty) {
      final iT = specTypeOf([for (final r in idRows) r.name]);
      b.writeln('extension type const ScreenId<I>._($iT spec) {');
      for (final r in idRows) {
        b.writeln(
          '  static const ${r.name} = ScreenId<${r.idType}>._(${svIn(iT, r.name)});',
        );
      }
      b.writeln('}');
    }

    b.writeln('extension ScreenIdOf on BuildContext {');
    if (idRows.isNotEmpty) {
      b.writeln(
        '  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);',
      );
    }
    b.writeln('  /// The screen this widget belongs to (its enclosing scope).');
    b.writeln(
      '  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));',
    );
    b.writeln('}');

    // ── Link surface. Always emitted: EVERY screen is a deep link, so the
    // Place nav tree + the `Link` superset stand on their own. The flat
    // parse classes / `parseUrl` / Link resolve-branches come from
    // the declared `.link` endpoints (empty when none). Domain-agnostic; parse
    // is path-only — the platform verifies the host.
    final endpoints = linkEndpoints(
      model.links,
      element,
      {for (final r in rows) r.name},
      idOf,
      typeOf: model.typeOf,
    );
    {
      b.writeln('');
      // One concrete `Link` class per case (k = a union branch, or null for a
      // single-slot endpoint). Phase A: a `.link` branch seeds no widget, so every
      // case is `Link`; the `Place` family rides the placement form.
      caseOf(Endpoint e, int? k) {
        final ui = _unionSlot(e);
        final entity = _linkBase(e.className);
        final fields = <(String, String)>[]; // (name, type) in slot order
        final ctorArgs = <String>[]; // m.path[..] reads, parse-side
        final pathVals = <String>[]; // encode path values
        final branchVals = <String>[]; // encode branch indices
        for (var i = 0; i < e.slots.length; i++) {
          if (i == ui && k != null) {
            final c = e.slots[i].codecs[k];
            branchVals.add('$k');
            if (c.isLiteral) {
              pathVals.add("'${c.literal}'"); // fixed segment carries no field
            } else {
              final f = _branchField(c);
              fields.add((f, c.type));
              ctorArgs.add('m.path[$i] as ${c.type}');
              pathVals.add(f);
            }
          } else {
            final f = _slotFieldName(e, i);
            final t = e.slots[i].codecs.first.type;
            fields.add((f, t));
            ctorArgs.add('m.path[$i] as $t');
            pathVals.add(f);
            branchVals.add('0');
          }
        }
        // The injected screen-id branch is renderable from the URL → Place;
        // every other branch needs resolution → Link. The id always
        // rides the union slot (a widget form has ≥1 declared resolver beside
        // it; an empty `slots({})` is rejected at read time).
        final widget = k != null && e.slots[ui!].codecs[k].isWidgetId;
        return (
          name: k == null
              ? e.className
              : _siblingName(entity, e.slots[ui!].codecs[k]),
          marker: ui == null ? null : e.className,
          family: widget ? 'Place' : 'Link',
          fields: fields,
          ctorArgs: ctorArgs,
          pathVals: pathVals,
          branchVals: branchVals,
        );
      }

      // The (endpoint, branch) pairs — one per concrete class.
      final cases = <({Endpoint e, int? k})>[];
      for (final e in endpoints) {
        final ui = _unionSlot(e);
        if (ui == null) {
          cases.add((e: e, k: null));
        } else {
          for (var k = 0; k < e.slots[ui].codecs.length; k++) {
            cases.add((e: e, k: k));
          }
        }
      }

      // Encode is an instance method `link.toUri([domain])` (mirrors canon_link),
      // not a global `toUri(link)`. Domain defaults to the grammar's when
      // declared — `Domain('https://…')` in the tree, or the legacy
      // `@Screens(domain:)` param.
      final linkDomain = model.domain ?? annotation.peek('domain')?.stringValue;
      final domainSig = linkDomain != null
          ? '[String? domain]'
          : 'String domain';
      final domainArg = linkDomain != null
          ? "domain ?? '$linkDomain'"
          : 'domain';
      // ── Builder chain — `Link.<route>` / `Place.<route>` /
      // `Link.<route>` fluent path to a URL. Each root owns its OWN
      // family-filtered trie + prefixed step classes, so a `Place` chain
      // can never offer a widgetless continuation (family-closed, canon-style).
      final chainBuf = StringBuffer(); // step classes, appended after parse
      // Emits one family's trie: returns the static-getter lines to inject into
      // its sealed root, and writes the family's step classes into [chainBuf].
      Map<String, String> emitFamily(
        String prefix,
        bool Function(Endpoint, int?) keep, {
        List<String> Function(Endpoint)? pathOf,
      }) {
        final root = _ChainNode('', const []);
        for (final e in endpoints) {
          final ui = _unionSlot(e);
          final ks = ui == null
              ? <int?>[null]
              : [for (var k = 0; k < e.slots[ui].codecs.length; k++) k];
          for (final k in ks) {
            if (!keep(e, k)) continue;
            final segs = pathOf != null
                ? pathOf(e)
                : (e.template.isEmpty
                      ? const <String>[]
                      : e.template.split('/'));
            var node = root;
            var ord = -1;
            for (final s in segs) {
              node = node.kids.putIfAbsent(
                s,
                () => _ChainNode(s, [...node.path, s]),
              );
              node.refEp ??= e;
              if (s == '*') {
                node.slotOrdinal = ++ord;
                if (node.slotOrdinal == ui && k != null) node.okBranches.add(k);
              }
            }
            node.endpoint = e;
            node.terminalOk = true;
          }
        }
        // The lower-camel branch method for a union case (`ItemByIdLink` →
        // `byId`); for a single non-union slot it's canon_link's `call`.
        String branchMethod(String entity, CodecSpec c) {
          final s = _siblingName(entity, c);
          return _lcFirst(s.substring(entity.length, s.length - 4));
        }

        void writeStep(_ChainNode n) {
          final name = _chainStep(prefix, n.path);
          chainBuf.writeln(
            'class $name(final List<Object?> _p, '
            'final List<int> _b) {',
          );
          for (final k in n.kids.values) {
            final child = _chainStep(prefix, k.path);
            if (k.seg == '*') {
              final e = k.refEp!;
              final slot = e.slots[k.slotOrdinal];
              if (slot.isUnion) {
                final entity = _linkBase(e.className);
                for (final br in n.kids['*']!.okBranches.toList()..sort()) {
                  final c = slot.codecs[br];
                  final m = branchMethod(entity, c);
                  if (c.isLiteral) {
                    chainBuf.writeln(
                      '  $child $m() => '
                      "$child([..._p, '${c.literal}'], [..._b, $br]);",
                    );
                  } else {
                    final f = _branchField(c);
                    chainBuf.writeln(
                      '  $child $m(${c.type} $f) => '
                      '$child([..._p, $f], [..._b, $br]);',
                    );
                  }
                }
              } else {
                final t = slot.codecs.first.type;
                final f = _slotFieldName(e, k.slotOrdinal);
                chainBuf.writeln(
                  '  $child call($t $f) => '
                  '$child([..._p, $f], [..._b, 0]);',
                );
              }
            } else {
              chainBuf.writeln(
                '  $child get ${_chainSeg(k.seg)} => $child(_p, _b);',
              );
            }
          }
          if (n.terminalOk) {
            chainBuf.writeln(
              '  Uri toUri($domainSig) => Uri.parse('
              "$spec.graph.encodeLink($domainArg, '${n.endpoint!.template}', "
              '_p, _b));',
            );
          }
          chainBuf.writeln('}');
        }

        void walk(_ChainNode n) {
          for (final k in n.kids.values) {
            writeStep(k);
            walk(k);
          }
        }

        walk(root);
        final statics = <String, String>{}; // getter name → static line
        for (final k in root.kids.values) {
          if (k.seg == '*') continue; // a top-level slot has no static name
          final step = _chainStep(prefix, k.path);
          statics[_chainSeg(k.seg)] =
              '  static $step get ${_chainSeg(k.seg)} => '
              '$step(const <Object?>[], const <int>[]);';
        }
        return statics;
      }

      familyOf(Endpoint e, int? k) => caseOf(e, k).family;

      // Link is SMART minimal-parent: a resolve-branch is addressed
      // from the nearest unambiguous ancestor — drop leading STATIC ancestor
      // segments (a slot-bearing ancestor can't be dropped, its value is needed),
      // keep the leaf screen segment for naming, and fall back to the full path
      // only to disambiguate. The URL still uses the endpoint's full template.
      List<String> minimalSegs(Endpoint e) {
        final segs = e.template.split('/');
        final leaf = segs.lastIndexWhere((s) => s != '*');
        if (leaf <= 0) return segs; // already leaf-rooted
        return segs.sublist(0, leaf).contains('*') ? segs : segs.sublist(leaf);
      }

      final wlessEndpoints = [
        for (final e in endpoints)
          if (_unionSlot(e) == null
              ? familyOf(e, null) == 'Link'
              : [
                  for (
                    var k = 0;
                    k < e.slots[_unionSlot(e)!].codecs.length;
                    k++
                  )
                    k,
                ].any((k) => familyOf(e, k) == 'Link'))
            e,
      ];
      final minCount = <String, int>{};
      for (final e in wlessEndpoints) {
        minCount[minimalSegs(e).join('/')] =
            (minCount[minimalSegs(e).join('/')] ?? 0) + 1;
      }
      // A minimal path shared by 2+ endpoints is ambiguous → those use the full
      // path; the rest drop their redundant parents.
      List<String> wxPath(Endpoint e) {
        final min = minimalSegs(e);
        return (minCount[min.join('/')] ?? 0) > 1 ? e.template.split('/') : min;
      }

      final widgetlessStatics = emitFamily(
        '_LX',
        (e, k) => familyOf(e, k) == 'Link',
        pathOf: wxPath,
      );

      b.writeln(
        '/// A URL the app understands: a [Place] or a [Link]; `parseUrl`',
      );
      b.writeln('/// returns one.');
      b.writeln('sealed class const Url([final String? domain]) {');
      b.writeln('  Uri toUri($domainSig);');
      b.writeln('}');
      b.writeln(
        '/// A POSITION in the tree — a parsed nav-mirror URL. Go-able: every',
      );
      b.writeln(
        '/// `Place` is a [Hop], so `Screen.go(place)` replays its chain.',
      );
      b.writeln(
        'sealed class const Place([super.domain]) extends Url '
        'implements Hop<AnyNav> {',
      );
      b.writeln('  @override');
      b.writeln('  List<(Enum, Object?)> get chain;');
      b.writeln('  @override');
      b.writeln('  Enum get spec => chain.last.\$1;');
      b.writeln('  @override');
      b.writeln('  Object? get id => chain.last.\$2;');
      b.writeln('  @override');
      b.writeln('  AnyNav get nav => _atOf($spec.graph.current);');
      b.writeln('  @override');
      b.writeln('  Screen<Object?> get screen => Screen._forSpec(spec);');
      b.writeln('}');
      b.writeln(
        '/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA',
      );
      b.writeln(
        '/// the resolver interprets. NOT a position — no widget, never navigable.',
      );
      b.writeln(
        '/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.',
      );
      b.writeln('sealed class const Link([super.domain]) extends Url {');
      widgetlessStatics.values.forEach(b.writeln);
      b.writeln('}');
      b.writeln(
        '/// The bare root `/` — a plain app-open (no specific destination).',
      );
      b.writeln('final class const RootUrl([super.domain]) extends Url {');
      b.writeln('  @override');
      b.writeln(
        linkDomain != null
            ? "  Uri toUri($domainSig) => Uri.parse('\${$domainArg}/');"
            : "  Uri toUri($domainSig) => Uri.parse('\$domain/');",
      );
      b.writeln('}');
      b.writeln(
        '/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries',
      );
      b.writeln('/// the root-down chain so `Screen.go` lands it.');
      b.writeln('final class const _NavPlace(');
      b.writeln('    @override final List<(Enum, Object?)> chain,');
      b.writeln('    [super.domain]) extends Place {');
      b.writeln('  @override');
      b.writeln(
        '  Uri toUri($domainSig) => Uri.parse($spec.graph.encodeNavUrl(',
      );
      b.writeln(
        '      $domainArg, [for (final c in chain) c.\$1], [for (final c in chain) c.\$2]));',
      );
      b.writeln('}');
      // per-entity marker (rule 14): the union cases IMPLEMENT it, cross-cutting
      // the widget families, so `case UserLink()` catches any branch of that entity.
      for (final e in endpoints) {
        if (_unionSlot(e) != null) {
          b.writeln('sealed class ${e.className} implements Url {}');
        }
      }
      for (final c in cases) {
        final d = caseOf(c.e, c.k);
        final impl = d.marker != null ? ' implements ${d.marker}' : '';
        final params = [for (final f in d.fields) 'final ${f.$2} ${f.$1}'];
        b.writeln(
          params.isEmpty
              ? 'final class const ${d.name}([super.domain]) '
                    'extends ${d.family}$impl {'
              : 'final class const ${d.name}(${params.join(', ')}, '
                    '[super.domain]) extends ${d.family}$impl {',
        );
        b.writeln('  @override');
        b.writeln(
          '  Uri toUri($domainSig) => Uri.parse($spec.graph.encodeLink('
          "$domainArg, '${c.e.template}', "
          '<Object?>[${d.pathVals.join(', ')}], <int>[${d.branchVals.join(', ')}]));',
        );
        // A Place case is a go-able nav target: its chain is the nav path it
        // encodes to (Link cases extend Link, not Place — pure data, no chain).
        if (d.family == 'Place') {
          b.writeln('  @override');
          b.writeln(
            '  List<(Enum, Object?)> get chain => '
            '$spec.graph.parsePath(toUri().path) ?? const [];',
          );
        }
        b.writeln('}');
      }

      // parse: runtime path match (host-agnostic) → typed Url carrying the origin
      // (the host is reported, not matched — the platform verified it is ours).
      b.writeln('');
      b.writeln(
        '/// Parses [url] into a [Url]: a declared [Link], a nav-mirror [Place]',
      );
      b.writeln(
        '/// (go-able), [RootUrl] for bare `/`, or null if it resolves to nothing.',
      );
      b.writeln('/// The result carries the inbound origin in [Url.domain].');
      b.writeln('Url? parseUrl(String url) {');
      b.writeln('  final uri = tryParseUri(url);');
      b.writeln('  if (uri == null) return null;');
      b.writeln(
        "  final origin = uri.hasAuthority ? '\${uri.scheme}://\${uri.authority}' : null;",
      );
      b.writeln('  final m = $spec.graph.parseLink(url);');
      b.writeln('  if (m != null) {');
      b.writeln('  final link = switch (m.template) {');
      for (final e in endpoints) {
        final ui = _unionSlot(e);
        if (ui == null) {
          final d = caseOf(e, null);
          b.writeln(
            "    '${e.template}' => ${d.name}(${[...d.ctorArgs, 'origin'].join(', ')}),",
          );
        } else {
          final arms = [
            for (var k = 0; k < e.slots[ui].codecs.length; k++)
              '$k => ${() {
                final d = caseOf(e, k);
                return '${d.name}(${[...d.ctorArgs, 'origin'].join(', ')})';
              }()}',
          ];
          b.writeln(
            "    '${e.template}' => switch (m.branches[$ui]) "
            "{ ${arms.join(', ')}, _ => throw StateError('bad union branch') },",
          );
        }
      }
      b.writeln('    _ => null,');
      b.writeln('  };');
      b.writeln('    if (link != null) return link;');
      b.writeln('  }');
      b.writeln('  // Bare root → a plain app-open.');
      b.writeln('  if (uri.pathSegments.where((s) => s.isNotEmpty).isEmpty) {');
      b.writeln('    return RootUrl(origin);');
      b.writeln('  }');
      b.writeln('  // Nav-mirror path → a go-able Place.');
      b.writeln('  final chain = $spec.graph.parsePath(url);');
      b.writeln('  if (chain != null) return _NavPlace(chain, origin);');
      b.writeln('  return null;');
      b.writeln('}');
      // encode is the instance `link.toUri([domain])` emitted on each class above.
      b.writeln('');
      b.write(chainBuf); // the `Link.<route>` builder step classes
    }

    // ── View-state data types: `<Screen>Query` (read getters) + `<Screen>QueryMut`
    // (adds setters), same for fragment. Everything nullable; a flag is `bool`
    // (set false ⟹ cleared). Backed by the runtime's view store.
    // Singles stay flat/nullable; an `allOf` becomes a co-present record getter
    // (null unless ALL members set); a `oneOf` becomes a sealed exactly-one
    // choice (the setter clears siblings) — all over the same flat view store.
    void emitViewType(String screen, String part, List<ViewGroup> groups) {
      if (groups.isEmpty) return;
      final base = '${_cap(screen)}${part == 'f' ? 'Fragment' : 'Query'}';
      final scv = sv(screen);
      final label = part == 'f' ? 'fragment' : 'query';
      String nget(ViewKey k) => k.flag
          ? "($spec.graph.viewGet($scv, '${k.name}') == true ? true : null)"
          : "$spec.graph.viewGet($scv, '${k.name}') as ${k.type}?";
      String recType(List<ViewKey> ks) =>
          '({${[for (final k in ks) '${k.flag ? 'bool' : k.type} ${k.name}'].join(', ')}})';

      // oneOf → sealed choice type, one branch per member (value branches carry it).
      for (final g in groups) {
        if (g is! ViewOneOf) continue;
        final choice = '${base}Choice';
        b.writeln(
          '/// Exactly-one `oneOf` choice for `$screen` $label view-state.',
        );
        b.writeln('sealed class const $choice();');
        for (final k in g.keys) {
          final cls = '$base${_cap(k.name)}';
          b.writeln(
            k.flag
                ? 'final class const $cls() extends $choice;'
                : 'final class const $cls(final ${k.type} value) extends $choice;',
          );
        }
        b.writeln('');
      }

      b.writeln(
        '/// Screen-local $label view-state for `$screen` (read-only).',
      );
      b.writeln('class const $base._() {');
      for (final g in groups) {
        switch (g) {
          case ViewSingle(:final key):
            final t = key.flag ? 'bool' : '${key.type}?';
            final getExpr = key.flag
                ? "$spec.graph.viewGet($scv, '${key.name}') == true"
                : "$spec.graph.viewGet($scv, '${key.name}') as ${key.type}?";
            b.writeln('  $t get ${key.name} => $getExpr;');
          case ViewAllOf(:final keys):
            final guard = [for (final k in keys) '${k.name} != null']
                .join(' && ');
            final rec =
                '(${[for (final k in keys) '${k.name}: ${k.name}'].join(', ')})';
            b.writeln('  ${recType(keys)}? get group {');
            for (final k in keys) {
              b.writeln('    final ${k.name} = ${nget(k)};');
            }
            b.writeln('    return ($guard) ? $rec : null;');
            b.writeln('  }');
          case ViewOneOf(:final keys):
            b.writeln('  ${base}Choice? get choice {');
            for (final k in keys) {
              final cls = '$base${_cap(k.name)}';
              b.writeln(
                k.flag
                    ? "    if ($spec.graph.viewGet($scv, '${k.name}') == true) return const $cls();"
                    : "    { final v = $spec.graph.viewGet($scv, '${k.name}') as ${k.type}?; if (v != null) return $cls(v); }",
              );
            }
            b.writeln('    return null;');
            b.writeln('  }');
        }
      }
      b.writeln('}');
      b.writeln('');

      b.writeln(
        '/// Mutable [$base] — set a key (null clears / removes from URL).',
      );
      b.writeln('final class const ${base}Mut._() extends $base {');
      b.writeln('  this : super._();');
      for (final g in groups) {
        switch (g) {
          case ViewSingle(:final key):
            b.writeln(
              key.flag
                  ? "  set ${key.name}(bool v) => $spec.graph.viewSet($scv, '${key.name}', v ? true : null);"
                  : "  set ${key.name}(${key.type}? v) => $spec.graph.viewSet($scv, '${key.name}', v);",
            );
          case ViewAllOf(:final keys):
            b.writeln('  set group(${recType(keys)}? v) {');
            for (final k in keys) {
              final val = k.flag
                  ? '(v?.${k.name} ?? false) ? true : null'
                  : 'v?.${k.name}';
              b.writeln("    $spec.graph.viewSet($scv, '${k.name}', $val);");
            }
            b.writeln('  }');
          case ViewOneOf(:final keys):
            b.writeln('  set choice(${base}Choice? v) {');
            for (final k in keys) {
              final cls = '$base${_cap(k.name)}';
              final val = k.flag
                  ? 'v is $cls ? true : null'
                  : 'v is $cls ? v.value : null';
              b.writeln("    $spec.graph.viewSet($scv, '${k.name}', $val);");
            }
            b.writeln('  }');
        }
      }
      b.writeln('}');
      b.writeln('');
    }

    for (final e in viewScreens.entries) {
      emitViewType(e.key, 'q', viewGroupsByScreen[e.key]!.query);
      emitViewType(e.key, 'f', viewGroupsByScreen[e.key]!.fragment);
    }

    return b.toString();
  }
}
