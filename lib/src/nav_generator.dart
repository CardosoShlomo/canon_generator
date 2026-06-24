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
  _Row(this.name, this.idType, this.spec, {this.owner = true});

  final String name;
  final String? idType;

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
  if (t.isDartCoreString || t.isDartCoreInt || t.isDartCoreDouble || t.isDartCoreBool || t.isDartCoreNum) {
    return true;
  }
  if (element.getMethod('==') != null) return true;
  return element.allSupertypes
      .any((s) => !s.isDartCoreObject && s.element.getMethod('==') != null);
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

// ---- link surface helpers (sibling-class naming, field names) ----------
// A union slot becomes sibling `Link` classes (rule 14), one per branch, split
// across the `WidgetLink`/`WidgetlessLink` families and IMPLEMENTing a per-entity
// marker. A non-union endpoint is a single concrete class.
String _linkBase(String className) =>
    className.substring(0, className.length - 4); // drop the "Link" suffix
// The lower-camel field a value codec contributes (`.uuid(#userId)` → userId).
String _branchField(CodecSpec c) => c.nameOverride ?? c.fieldName ?? _lcFirst(c.name);
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

class NavGenerator extends GeneratorForAnnotation<Screens> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@screens must annotate an enum', element: element);
    }
    final spec = element.name;
    if (spec == null || !spec.startsWith('_')) {
      throw InvalidGenerationSourceError('the @screens enum must be library-private', element: element);
    }

    // Read the VIRTUAL tree first (follows grafts into sub-enums), then build
    // rows from every enum it spans — each tagged with its home enum (`spec`).
    final model = await readTree(element, buildStep);
    final rows = <_Row>[];
    final widgetOf = <String, String?>{};
    for (final e in model.enums) {
      for (final field in e.fields) {
        if (!field.isEnumConstant) continue;
      final value = field.computeConstantValue();
      final idObj = value?.getField('id');
      final widgetObj = value?.getField('widget');
      final owner = widgetObj != null && !widgetObj.isNull;
      if (owner) widgetOf[field.name!] = widgetObj.type?.getDisplayString();
      // The id is a `Codec<T>` (or null for an id-free screen): T is the id type
      // (it drives the typed verb), and the codec round-trips the value for
      // restoration. A repeated-key `Codec.list` can't be a single-token id.
      String? idStr;
      DartType? idDartType;
      if (idObj != null && !idObj.isNull) {
        final ct = idObj.type;
        if (ct is InterfaceType && ct.element.name == 'ListCodec') {
          throw InvalidGenerationSourceError(
              'screen "${field.name}" uses Codec.list as its id — it carries '
              'repeated URL keys, not a single token, so it can never round-trip. '
              'Use Codec.csv for a single-token list id.',
              element: e);
        }
        idDartType = _codecArg(ct);
        idStr = idDartType?.getDisplayString();
      }
      if (idStr != null && idDartType != null && !_hasValueEquality(idDartType)) {
        log.warning(
            'id type $idStr of "${field.name}" compares by identity — repeat-collapse '
            'and prefix reuse fire only when two id instances are equal, so for this '
            'screen they apply to identical instances only; override == and hashCode '
            'for value semantics');
      }
      rows.add(_Row(field.name!, idStr, e.name!, owner: owner));
      }
    }
    // A screen name is ONE screen across the virtual tree. It may be declared
    // once with a widget (the OWNER) and any number of times with a null widget
    // (REFS — a sub-enum's bare row reused for in-family inherit/cycled). Collapse
    // every name to its single owner row; refs vanish into it. Mirror the runtime
    // checks (screen_node `_canonicalize`): exactly one owner, no dangling ref,
    // and all declarations of a name must agree on id type.
    final byName = <String, List<_Row>>{};
    for (final r in rows) {
      (byName[r.name] ??= []).add(r);
    }
    final collapsed = <_Row>[];
    for (final e in byName.entries) {
      final owners = [for (final r in e.value) if (r.owner) r];
      if (owners.length > 1) {
        final specs = (owners.map((r) => r.spec).toSet().toList()..sort());
        throw InvalidGenerationSourceError(
            'screen "${e.key}" has ${owners.length} owners (${specs.join(', ')}) '
            '— only one declaration may carry a widget; the rest must be null-'
            'widget refs.',
            element: element);
      }
      if (owners.isEmpty) {
        throw InvalidGenerationSourceError(
            'screen "${e.key}" is a ref (null widget) with no owner — one same-'
            'named declaration must carry the widget.',
            element: element);
      }
      final idTypes = e.value.map((r) => r.idType).whereType<String>().toSet();
      if (idTypes.length > 1) {
        throw InvalidGenerationSourceError(
            'screen "${e.key}" has conflicting id types (${idTypes.join(', ')}) '
            'across its declarations — owner and refs must agree.',
            element: element);
      }
      // The owner carries the surviving row, but adopt a ref-declared id type if
      // the owner left it off (any disagreement already rejected above).
      collapsed.add(_Row(e.key, idTypes.isEmpty ? null : idTypes.first,
          owners.single.spec));
    }
    rows
      ..clear()
      ..addAll(collapsed);

    final idOf = {for (final r in rows) r.name: r.idType};
    final specOf = {for (final r in rows) r.name: r.spec};
    // A screen's enum-qualified value (`_Root.home`, `Shop.shop`) — the only
    // place graft surfaces in the output; everything else is by name.
    String sv(String name) => '${specOf[name]}.$name';
    // Enums that declare an `id` field — i.e. some row of theirs is id-bearing.
    // Only these have `.id` to verify; an all-id-free enum has no field.
    final specsWithId = {for (final r in rows) if (r.idType != null) r.spec};

    // A widget shared by >=2 screens with >=2 distinct (non-null) id types is
    // id-ambiguous: inside it you can't statically know which screen you are.
    // Emit a sealed `(screen, typed id)` union + a resolver so the consumer
    // disambiguates EXHAUSTIVELY (vs an open `(current, currentId)` switch).
    final byWidget = <String, List<_Row>>{};
    for (final r in rows) {
      final w = widgetOf[r.name];
      if (w != null) (byWidget[w] ??= []).add(r);
    }
    final widgetUnions = [
      for (final e in byWidget.entries)
        if (e.value.map((r) => r.idType).whereType<String>().toSet().length >= 2)
          (sealed: '${e.key}Id', resolver: '${_lcFirst(e.key)}Id', members: e.value)
    ];

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
    void collectView(PlacementNode n) {
      if (n.viewQuery.isNotEmpty || n.viewFragment.isNotEmpty) {
        viewScreens.putIfAbsent(
            n.screen,
            () => (
                  query: viewKeys(n.viewQuery, element),
                  fragment: viewKeys(n.viewFragment, element),
                ));
      }
      n.children.forEach(collectView);
    }

    tree.forEach(collectView);

    // The nav body lines exposing a screen's MUTABLE view-state (read+write), and
    // the read-only `<Screen>View` interface marker the nav implements.
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

    // Flatten every inherit link to its ULTIMATE source, order-independently: a
    // chain editItem→itemPreview→item resolves editItem's source to item (the id
    // screen), so the shared id is detected no matter the declaration order.
    for (final ps in placements.values) {
      for (final n in ps) {
        var s = n.inheritSource;
        while (s != null && s.inheritSource != null) {
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
              element: element);
        }
        if (childT == null) {
          throw InvalidGenerationSourceError(
              '"${n.screen}.inherit(${src.screen})": ${n.screen} declares no id '
              'type but inherit makes its id ${src.screen}\'s — give ${n.screen} '
              'the id type $srcT.',
              element: element);
        }
        if (childT != srcT) {
          throw InvalidGenerationSourceError(
              '"${n.screen}.inherit(${src.screen})": id type mismatch — '
              '${n.screen} is $childT but ${src.screen} is $srcT. An inheriting '
              'placement must declare the same id type as its source.',
              element: element);
        }
      }
    }

    // Liveness toggles validate at build: a keep/forget that doesn't flip the
    // inherited state is redundant (mirrors NavSpec._validate). Also collects
    // every keep screen — forget()'s targets — at any depth.
    final keptSet = <String>{};
    void checkLiveness(PlacementNode n, bool live) {
      if (n.keep) {
        if (live) {
          throw InvalidGenerationSourceError(
              '"${n.screen}.keep" is redundant — an ancestor already keeps this '
              'region (need a forget between them)',
              element: element);
        }
        keptSet.add(n.screen);
        live = true;
      } else if (n.forget) {
        if (!live) {
          throw InvalidGenerationSourceError(
              '"${n.screen}.forget" is redundant — this region is already not '
              'kept (forget only carves inside a keep)',
              element: element);
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
    final kept = keptSet.toList()..sort();

    // Cycle membership: each back-edge forms a cycle from its target down to its
    // parent. Every screen on that path can recur.
    final cycles = <Set<String>>[];
    for (final ae in againEdges) {
      final members = <String>{};
      for (PlacementNode? p = ae.parent; p != null; p = p.parent) {
        members.add(p.screen);
        if (identical(p, ae.again)) break;
      }
      cycles.add(members);
    }
    // Screens that can recur — the only ones whose `on` token exposes `.depth(n)`
    // and whose nav exposes a `depth` getter.
    final cyclic = {for (final c in cycles) ...c};
    // The OTHER members of any cycle a screen is in — its throwing cycle-pop
    // targets (throws if not currently below; guard with a depth check).
    Set<String> cycleMembers(String screen) =>
        {for (final c in cycles) if (c.contains(screen)) ...c};

    // Predecessor placements a screen can sit directly on top of: its canonical
    // parent plus any node a back-edge to it lives under. >1 means a cycle can
    // reveal different parents on pop, so bare pop() resolves the actual one.
    final backPreds = <String, List<PlacementNode>>{};
    for (final ae in againEdges) {
      final p = ae.parent;
      if (p != null) (backPreds[ae.screen] ??= []).add(p);
    }
    List<PlacementNode> predecessorsOf(PlacementNode n) {
      final out = <PlacementNode>[];
      final seen = <String>{};
      for (final p in [if (n.parent != null) n.parent!, ...?backPreds[n.screen]]) {
        if (seen.add(p.path.join('/'))) out.add(p);
      }
      // Longest path first so a shorter suffix can't shadow a deeper match.
      out.sort((a, b) => b.path.length.compareTo(a.path.length));
      return out;
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
    String placementName(PlacementNode n) =>
        isSingle(n.screen) ? unionName(n.screen) : '${n.path.map(_cap).join()}Nav';
    String childType(PlacementNode c) =>
        c.again != null ? placementName(c.again!) : placementName(c);

    // Pop-union registry: a placement with >1 possible predecessor pops into a
    // union nav whose `.at` narrows to the actual parent (exhaustive switch). A
    // screen's own union is reused when the predecessors are just its placements.
    final unions = <String, ({String nav, String marker, List<PlacementNode> members})>{};
    final popReturnOf = <String, String>{}; // cyclic placement nav -> pop() return type
    final crossImpl = <String, Set<String>>{}; // nav -> pop-placement markers it implements
    String stemOf(PlacementNode m) {
      final pn = placementName(m);
      return pn.substring(0, pn.length - 3);
    }
    String? unionFor(List<PlacementNode> ms) {
      if (ms.isEmpty) return null;
      if (ms.length == 1) return placementName(ms.single);
      if (ms.map((m) => m.screen).toSet().length == 1) return unionName(ms.first.screen);
      final base = (ms.map(stemOf).toList()..sort()).join();
      return unions
          .putIfAbsent(base, () {
            final marker = '${base}PopPlacement';
            for (final m in ms) {
              (crossImpl[placementName(m)] ??= {}).add(marker);
            }
            return (nav: '${base}PopNav', marker: marker, members: ms);
          })
          .nav;
    }
    for (final r in rows) {
      for (final n in placements[r.name]!) {
        final preds = predecessorsOf(n);
        if (preds.length > 1) popReturnOf[placementName(n)] = unionFor(preds)!;
      }
    }

    // Global pop surface: `canPop` is the union of all NON-ROOT placements (the
    // ones that can be popped); `pop()` lands on a DESTINATION — any predecessor
    // of a non-root placement. Both are markers the relevant placement navs
    // implement, so resolution reuses the same `.at` machinery as the unions.
    final canPopMembers = [
      for (final r in rows)
        for (final n in placements[r.name]!)
          if (n.parent != null) n
    ];
    final destMembers = <PlacementNode>[];
    {
      final seen = <String>{};
      for (final n in canPopMembers) {
        for (final p in predecessorsOf(n)) {
          if (seen.add(p.path.join('/'))) destMembers.add(p);
        }
      }
    }
    final hasCanPop = canPopMembers.isNotEmpty;
    if (hasCanPop) {
      for (final n in canPopMembers) {
        (crossImpl[placementName(n)] ??= {}).add('CanPopPlacement');
      }
      for (final p in destMembers) {
        (crossImpl[placementName(p)] ??= {}).add('PopDestPlacement');
      }
    }

    // Canonical ancestors — always in the live chain at this placement, so popTo
    // them can't fail. Cycle members are merged into the pops map separately (at
    // the navClass call sites) as throwing pops; see cycleMembers.
    Map<String, String> ancestorsOf(PlacementNode n) =>
        {for (final a in n.ancestors) a.screen: placementName(a)};

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
      final lines = StringBuffer('    $spec.graph.go(${sv(steps.first)}, id);\n');
      for (final s in steps.skip(1)) {
        lines.write('    $spec.graph.go(${sv(s)}, id, true);\n');
      }
      return '  static $ret go${_cap(screen)}($idT id) {\n'
          '$lines'
          '    return const $ret._();\n'
          '  }';
    }

    // Kick-start union: every globally reachable (single-placement) screen's nav
    // implements `KickstartPlacement`, so `Screen.go(Hop)` returns a `KickstartNav`
    // whose `.at` narrows to the exact target it landed on.
    final kickstartNavs = [
      for (final r in rows)
        if (globalSafe(r.name)) unionName(r.name)
    ];
    final hasKickstart = kickstartNavs.isNotEmpty;
    for (final nav in kickstartNavs) {
      (crossImpl[nav] ??= {}).add('KickstartPlacement');
    }

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
        // A screen reached via a back-edge (.stacked/.cycled) is pushable from
        // that edge's parent too — so e.g. parentOf.userProfile covers a
        // userProfile screen pushing another (the .stacked self-recursion).
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
        e.key: {for (final p in e.value) p.screen}
    };
    // Children screens common to ALL of x's parents (x itself is always one,
    // since every parent has x as a child).
    Set<String> sharedChildrenOf(List<PlacementNode> parents) => parents
        .map((p) => {for (final c in p.children) c.screen})
        .reduce((a, b) => a.intersection(b));
    // pop() is provable on the handle only if popping is legal at every parent.
    bool allParentsNonRoot(List<PlacementNode> parents) =>
        parents.every((p) => p.parent != null);
    // Uniform inherit source across all of X's placements (null if none, or if
    // mixed id-bearing/inherited — the signature-split case, deferred).
    String? inheritSrcUniform(String screen) {
      final ns = placements[screen]!;
      if (ns.isEmpty || ns.any((n) => n.inheritSource == null)) return null;
      final srcs = {for (final n in ns) n.inheritSource!.screen};
      return srcs.length == 1 ? srcs.single : null;
    }
    String parentPush(String x) {
      final ret = unionName(x);
      final src = inheritSrcUniform(x);
      final idT = idOf[x];
      final params = (src != null || idT == null) ? '' : '$idT id';
      final arg = src != null
          ? '_idOf(${sv(src)})'
          : (idT == null ? 'null' : 'id');
      // Named after the committed target (go<Target>), consistent with every
      // other push verb — the selector already narrowed to this screen.
      return '  $ret go${_cap(x)}($params) {\n'
          '    $spec.graph.go(${sv(x)}, $arg, true);\n'
          '    return const $ret._();\n'
          '  }';
    }

    // A position-anchored handle (non-null path) navigates edge-required: the
    // target must be a live edge from the current top or graph.go throws (a
    // stale handle), never a silent canonical teleport. Stale-but-still-legal
    // resolves. Entry-point navs (null path) stay total (canonical allowed).
    String goVerb(String child, String returns,
        [List<String>? path, String? inheritSrc]) {
      // Inherited edge (chained only): id IS the ancestor's, read live from the
      // chain — no parameter to pass, none to get wrong.
      if (inheritSrc != null && path != null) {
        return '  $returns go${_cap(child)}() {\n'
            '    $spec.graph.go(${sv(child)}, _idOf(${sv(inheritSrc)}), true);\n'
            '    return const $returns._();\n'
            '  }';
      }
      final idT = idOf[child];
      final params = idT == null ? '' : '$idT id';
      final call = path != null
          ? '$spec.graph.go(${sv(child)}, ${idT == null ? 'null' : 'id'}, true)'
          : '$spec.graph.go(${sv(child)}${idT == null ? '' : ', id'})';
      return '  $returns go${_cap(child)}($params) {\n'
          '    $call;\n'
          '    return const $returns._();\n'
          '  }';
    }

    // One verb per child screen; placement tiers resolve the return type
    // exactly, union tiers by screen.
    List<String> goVerbs(Iterable<PlacementNode> children,
        String Function(PlacementNode) type, [List<String>? path]) {
      final byChild = <String, PlacementNode>{};
      for (final c in children) {
        byChild[c.screen] = c;
      }
      return [
        for (final e in byChild.entries)
          goVerb(e.key, type(e.value), path, e.value.inheritSource?.screen)
      ];
    }

    // Broad reach (the kick-start's reachability, on every placement): a
    // single-placement id screen X is reachable with ONE id from every ancestor
    // whose path down to X crosses no UNRELATED id screen. X, its id source, and
    // any inherited link share the id (stamped); id-free intermediates get null;
    // an unrelated id screen in between disqualifies that ancestor. The id source
    // is X itself when X isn't inherited. X's DIRECT parent already gets its verb
    // from goVerbs (a with-id push, or the no-arg inherited edge), so reach only
    // adds the ancestors above it. Keyed by the ancestor's nav class.
    final reachVerbs = <String, List<String>>{};
    for (final ns in placements.values) {
      for (final e in ns) {
        if (!isSingle(e.screen)) continue;
        final srcScreen = e.inheritSource?.screen ?? e.screen;
        final idT = idOf[srcScreen];
        if (idT == null) continue; // X carries / inherits no id
        final nodes = [...e.ancestors.toList().reversed, e]; // root..e
        final srcIdx = e.inheritSource == null
            ? nodes.length - 1
            : nodes.indexWhere((n) => n.screen == srcScreen);
        final directParentIdx = nodes.length - 2;
        final ret = placementName(e);
        bool covered(PlacementNode n) =>
            n.screen == srcScreen || n.inheritSource?.screen == srcScreen;
        for (var aIdx = srcIdx - 1; aIdx >= 0; aIdx--) {
          if (aIdx == directParentIdx) continue; // goVerbs covers the direct parent
          final pushes = <String>[];
          var ok = true;
          for (var i = aIdx + 1; i < nodes.length; i++) {
            final n = nodes[i];
            final arg = covered(n) ? 'id' : (idOf[n.screen] == null ? 'null' : null);
            if (arg == null) {
              ok = false;
              break;
            }
            pushes.add('    $spec.graph.go(${sv(n.screen)}, $arg, true);');
          }
          if (!ok) continue;
          (reachVerbs[placementName(nodes[aIdx])] ??= []).add(
              '  $ret go${_cap(e.screen)}($idT id) {\n'
              '${pushes.join('\n')}\n'
              '    return const $ret._();\n'
              '  }');
        }
      }
    }

    final b = StringBuffer();

    // Emits a nav class. A nav always extends AnyNav; the empty sealed
    // switch-markers it's a case of are listed via implements. Pops: ancestor
    // popToX never fails (always in the chain); cycle-member popToX (incl. self,
    // the previous occurrence) throws when not currently below — guard with the
    // depth check.
    // bare pop(): with one predecessor it returns that parent's nav. In a cycle
    // (multiple possible predecessors) it returns AnyNav, resolving the ACTUAL
    // one from the post-pop chain — pattern-match it (case HomeNav / case ChatNav)
    // instead of trusting a single canonical-parent type.
    void navClass(String className, List<String> verbs,
        {Map<String, String> pops = const {},
        Map<String, String> edges = const {},
        String? parentScreen,
        List<String> markers = const [],
        String? extra,
        List<String>? path}) {
      final allMarkers = [...markers, ...?crossImpl[className]];
      final impl = allMarkers.isEmpty ? '' : ' implements ${allMarkers.join(', ')}';
      final stem = className.substring(0, className.length - 3);
      final popName = '${stem}Pop';
      final hopName = '${stem}Hop';
      b.writeln('final class $className extends AnyNav$impl {');
      b.writeln('  const $className._() : super._();');
      if (extra != null) b.writeln(extra);
      verbs.forEach(b.writeln);
      // Reach-an-inherited-descendant verbs for qualifying ancestors.
      reachVerbs[className]?.forEach(b.writeln);
      // 0 edges → no go. 1 edge → just the named goXx (in verbs). 2+ → a typed,
      // edge-gated, ternary-capable go(Hop<N>) alongside the named verbs.
      if (edges.length >= 2) {
        final hopCall = path != null
            ? '$spec.graph.go(hop.spec, hop.id, true)'
            : '$spec.graph.go(hop.spec, hop.id)';
        b.writeln('  N go<N extends AnyNav>($hopName<N> hop) {');
        b.writeln('    $hopCall;');
        b.writeln('    return hop.nav;');
        b.writeln('  }');
      }
      final popUnion = popReturnOf[className];
      if (popUnion != null) {
        // Cycle: pop() returns the predecessor-union nav; narrow via its `.at`.
        b.writeln('  $popUnion pop() {');
        b.writeln('    $spec.graph.pop();');
        b.writeln('    return const $popUnion._();');
        b.writeln('  }');
      } else if (parentScreen != null) {
        final ret = unionName(parentScreen);
        b.writeln('  $ret pop() {');
        b.writeln('    $spec.graph.pop();');
        b.writeln('    return const $ret._();');
        b.writeln('  }');
      }
      // Named popToXx for the DEEPER ancestors (the immediate parent is bare
      // pop(), its abbreviation — skipped here). Mirrors named goXx; the token
      // popTo(Pop<N>) below covers the same set plus ternary.
      for (final e in pops.entries) {
        if (e.key == parentScreen) continue;
        b.writeln('  ${e.value} popTo${_cap(e.key)}() {');
        b.writeln('    $spec.graph.pop(${sv(e.key)});');
        b.writeln('    return const ${e.value}._();');
        b.writeln('  }');
      }
      // 0 ancestors (root) → no popTo. 1 ancestor → it's the immediate parent,
      // covered by pop(). 2+ → a typed, gated, ternary-capable popTo(Pop<N>):
      // popTo(.x) returns the exact ancestor nav, popTo(a ? .x : .y) the LUB.
      if (pops.length >= 2) {
        b.writeln('  N popTo<N extends AnyNav>($popName<N> to) {');
        b.writeln('    $spec.graph.pop(to.spec);');
        b.writeln('    return to.nav;');
        b.writeln('  }');
      }
      b.writeln('}');
      if (pops.length >= 2) {
        b.writeln('final class $popName<N extends AnyNav> {');
        b.writeln('  const $popName._(this.spec, this.nav);');
        b.writeln('  final Enum spec;');
        b.writeln('  final N nav;');
        for (final e in pops.entries) {
          b.writeln('  static const ${e.key} = $popName<${e.value}>._(${sv(e.key)}, ${e.value}._());');
        }
        b.writeln('}');
      }
      if (edges.length >= 2) {
        b.writeln('final class $hopName<N extends AnyNav> {');
        b.writeln('  const $hopName._(this.spec, this.id, this.nav);');
        b.writeln('  final Enum spec;');
        b.writeln('  final Object? id;');
        b.writeln('  final N nav;');
        for (final e in edges.entries) {
          final idT = idOf[e.key];
          if (idT == null) {
            b.writeln('  static const ${e.key} = $hopName<${e.value}>._(${sv(e.key)}, null, ${e.value}._());');
          } else {
            b.writeln('  static $hopName<${e.value}> ${e.key}($idT id) => $hopName._(${sv(e.key)}, id, const ${e.value}._());');
          }
        }
        b.writeln('}');
      }
    }

    final hasMulti = rows.any((r) => !isSingle(r.name));
    final hasInherit =
        placements.values.any((ps) => ps.any((n) => n.inheritSource != null));
    final hasParentOf = parentScreensOf.isNotEmpty;

    b.writeln('// ignore_for_file: library_private_types_in_public_api');
    // The generated bridge calls canon's @internal ScreenScope statics.
    b.writeln('// ignore_for_file: invalid_use_of_internal_member');
    if (hasInherit) {
      // An inherited edge reads its ancestor's live id from the chain.
      b.writeln('Object? _idOf(Enum s) =>');
      b.writeln('    $spec.graph.stack.lastWhere((e) => e.screen == s).id;');
    }
    if (hasMulti || hasCanPop) {
      b.writeln('bool _chainIs(List<Enum> a, List<Enum> b) {');
      b.writeln('  if (a.length != b.length) return false;');
      b.writeln('  for (var i = 0; i < a.length; i++) {');
      b.writeln('    if (a[i] != b[i]) return false;');
      b.writeln('  }');
      b.writeln('  return true;');
      b.writeln('}');
    }
    // `_endsWith` is only used by `.under` narrowing; emit it at the end iff a
    // `.under` actually referenced it (avoids an unused_element warning).
    var usesEndsWith = false;

    b.writeln('final class Screen<I> {');
    b.writeln('  const Screen._(this.spec);');
    b.writeln('  final Enum spec;');
    b.writeln('  String get name => spec.name;');
    for (final r in rows) {
      b.writeln('  static const ${r.name} = Screen<${r.idType ?? 'Never'}>._(${sv(r.name)});');
    }
    b.writeln('  static Screen<Object?> forSpec(Enum spec) => _bySpec[spec]!;');
    if (viewScreens.isNotEmpty) {
      b.writeln('  /// The current foreground as a read-only view, reactively — switch');
      b.writeln('  /// it to render per screen. Null when the current screen has no');
      b.writeln('  /// view-state. (`Placement.isOn`/`Placement.isCurrent` for raw checks.)');
      b.writeln('  static AnyView? of(BuildContext context) =>');
      b.writeln('      _viewOf(Placement.current(context));');
    }
    b.writeln('  /// Reactive: is the screen THIS context is under the current foreground');
    b.writeln('  /// top? Rebuilds only when that flips. The self-vs-current gate —');
    b.writeln('  /// `if (Screen.isCurrentOf(context)) …` to act only while visible.');
    b.writeln('  static bool isCurrentOf(BuildContext context) =>');
    b.writeln('      Placement.isCurrent(context, ScreenScope.of(context));');
    b.writeln('  static const _bySpec = <Enum, Screen<Object?>>{');
    // the boot sentinel maps to a placeholder Screen so stack/observe stay safe.
    b.writeln('    BootScreen.initial: Screen<Never>._(BootScreen.initial),');
    for (final r in rows) {
      b.writeln('    ${sv(r.name)}: ${r.name},');
    }
    b.writeln('  };');
    b.writeln('  /// The live active stack as wrappers: .current/.currentId/.tab/');
    b.writeln('  /// .screens/.reachable, extensible without touching Screen.');
    b.writeln('  static NavStack<Screen<Object?>> get stack => NavStack([');
    b.writeln('    for (final e in $spec.graph.stack) NavEntry(forSpec(e.screen), e.id),');
    b.writeln('  ]);');
    b.writeln('  /// The active top screen\'s QUERY view-state, read-only and');
    b.writeln('  /// context-free (the headless peer of `Query.of(context, ...)`).');
    b.writeln("  static Map<String, Object?> get query => $spec.graph.activeView('q');");
    b.writeln('  /// The active top screen\'s FRAGMENT view-state, read-only and');
    b.writeln('  /// context-free.');
    b.writeln("  static Map<String, Object?> get fragment => $spec.graph.activeView('f');");
    b.writeln("  static const _treeSignature = '$treeSignature';");
    b.writeln('  /// True when this generated code still matches the live tree.');
    b.writeln('  /// Assert it in a test to fail CI on a stale (un-regenerated) tree:');
    b.writeln("  /// `test('nav codegen fresh', () => expect(Screen.isCodegenFresh, true));`");
    b.writeln('  static bool get isCodegenFresh =>');
    b.writeln('      $spec.graph.structureSignature == _treeSignature;');
    b.writeln('  static final bool _fresh = () {');
    b.writeln('    assert(isCodegenFresh,');
    b.writeln("        'canon: the navigation tree changed but generated code is stale — run build_runner.');");
    b.writeln('    return true;');
    b.writeln('  }();');
    b.writeln('  static NavDelegate get delegate {');
    b.writeln('    assert(_fresh);');
    b.writeln('    return $spec.graph.delegate;');
    b.writeln('  }');
    b.writeln('  /// The URL-driven host for `MaterialApp.router(routerConfig:');
    b.writeln('  /// Screen.routerConfig)` — browser history + cold-start links via');
    b.writeln('  /// the nav-mirror. Use [manager] instead for a Router-less');
    b.writeln('  /// `MaterialApp(home: ...)` (no URL channel).');
    b.writeln('  static RouterConfig<Object> get routerConfig {');
    b.writeln('    assert(_fresh);');
    b.writeln('    return RouterConfig(');
    b.writeln('      routerDelegate: $spec.graph.delegate,');
    b.writeln('      routeInformationParser: const CanonRouteParser(),');
    b.writeln('      routeInformationProvider: PlatformRouteInformationProvider(');
    b.writeln('        initialRouteInformation: RouteInformation(');
    b.writeln('          uri: Uri.parse(');
    b.writeln('              WidgetsBinding.instance.platformDispatcher.defaultRouteName),');
    b.writeln('        ),');
    b.writeln('      ),');
    b.writeln('    );');
    b.writeln('  }');
    b.writeln('  /// A standalone nav host for `MaterialApp(home: ...)` — no Router,');
    b.writeln('  /// no URL/deep-link channel. Owns system back and snapshot');
    b.writeln('  /// restoration (always on; override [restorationId] only to avoid a');
    b.writeln('  /// storage-key collision).');
    b.writeln("  static Widget manager({String restorationId = 'nav'}) {");
    b.writeln('    assert(_fresh);');
    b.writeln('    return $spec.graph.manager(restorationId: restorationId);');
    b.writeln('  }');
    b.writeln('  /// A restoration-serializable snapshot of the whole nav state');
    b.writeln('  /// (no URLs; ids via each screen codec). Persist + [restore] it.');
    b.writeln('  static Map<String, Object?> snapshot() => $spec.graph.toState();');
    b.writeln('  /// Rebuilds the stack from a [snapshot], best-effort. Returns');
    b.writeln('  /// false on a stale/incompatible snapshot.');
    b.writeln('  static bool restore(Map<String, Object?> state) =>');
    b.writeln('      $spec.graph.restore(state);');
    if (hasKickstart) {
      b.writeln('  static KickstartNav go<N extends AnyNav>(Hop<N> hop) {');
      b.writeln('    $spec.graph.go(hop.spec, hop.id);');
      b.writeln('    return const KickstartNav._();');
      b.writeln('  }');
    }
    b.writeln('  /// If the live stack ends with this selector path (every pinned id and,');
    b.writeln('  /// for a cyclic terminal, its depth matching), its nav — else null.');
    b.writeln('  static N? on<N extends AnyNav>(On<N> which) {');
    if (hasParentOf) {
      // parentOf selector matches by current-top membership, not a suffix path.
      b.writeln('    if (which is OnParentOf) {');
      b.writeln('      return (which as OnParentOf).parents.contains($spec.graph.current)');
      b.writeln('          ? which.nav');
      b.writeln('          : null;');
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
    if (cyclic.isNotEmpty) {
      b.writeln('    if (which is OnDepth &&');
      b.writeln('        $spec.graph.countOf(specs.last, which.ids.last) != (which as OnDepth).depth) {');
      b.writeln('      return null;');
      b.writeln('    }');
    }
    // View-state conditions on the terminal screen must all hold.
    b.writeln('    for (final c in which.conds) {');
    b.writeln('      if (!c.test($spec.graph.viewGet(specs.last, c.key))) return null;');
    b.writeln('    }');
    b.writeln('    return which.nav;');
    b.writeln('  }');
    b.writeln('  /// Live-stack redirect: the chained verb REPLACES the current history');
    b.writeln('  /// entry instead of pushing. Decide it at the start —');
    b.writeln('  /// `Screen.replace.goHome()`, `Screen.replace.on(.user)?.goChat(id)`.');
    b.writeln('  static const replace = Replace._();');
    b.writeln('  /// The current EXACT placement nav — pattern-match it:');
    b.writeln('  /// `if (Screen.at case HomeUserProfileNav n) ...`.');
    b.writeln('  static AnyNav get at => switch ($spec.graph.current) {');
    for (final r in rows) {
      final n = unionName(r.name);
      b.writeln(isSingle(r.name)
          ? '        ${sv(r.name)} => const $n._(),'
          : '        ${sv(r.name)} => (const $n._()).at as AnyNav,');
    }
    b.writeln('        BootScreen.initial => const Initial._(),');
    // current is erased to Enum; the spec's screens are exhaustive in practice.
    b.writeln("        _ => throw StateError('not a $spec screen'),");
    b.writeln('      };');
    if (model.links.isNotEmpty) {
      b.writeln('  /// The cold-start link (already parsed), or null off the web,');
      b.writeln('  /// warm, or when the URL is not a representable link.');
      b.writeln('  static Link? get initialUrl {');
      b.writeln('    final u = $spec.graph.bootUrl;');
      b.writeln('    return u == null ? null : parseLink(u)?.link;');
      b.writeln('  }');
    }
    if (hasCanPop) {
      b.writeln('  /// The poppable handle if the active top is a non-root placement,');
      b.writeln('  /// else null (at a scope root). `.at` = current placement; `.pop()`');
      b.writeln('  /// executes the guaranteed pop and returns the destination.');
      b.writeln('  static CanPopNav? get canPop =>');
      b.writeln('      $spec.graph.currentChain.length > 1 ? const CanPopNav._() : null;');
      b.writeln('  /// Documented sugar for `canPop?.pop()` — pops the active top if any,');
      b.writeln('  /// returns where it landed, or null at a root. Never throws.');
      b.writeln('  static PopDestNav? pop() => canPop?.pop();');
    }
    b.writeln('  /// Side-effect listener fired after each navigation commits (new top');
    b.writeln('  /// settled, before its transition animates). Wire it where state lives');
    b.writeln('  /// (e.g. a provider); returns a disposer. Pure observation.');
    b.writeln('  static void Function() observe(');
    b.writeln('          void Function(Screen<Object?> from, Screen<Object?> to) fn) =>');
    b.writeln('      $spec.graph.observe((f, t) => fn(forSpec(f), forSpec(t)));');
    b.writeln('  /// A broadcast stream of committed navigations as typed snapshots:');
    b.writeln('  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for');
    b.writeln('  /// the landed screen + its typed id. Filter with `.where`.');
    b.writeln('  static Stream<ScreenNavigation> get navigations =>');
    b.writeln('      $spec.graph.navigations.map(ScreenNavigation._);');
    for (final u in widgetUnions) {
      b.writeln('  /// Resolves a widget shared by several screens to its exact');
      b.writeln('  /// (screen, typed id) — switch the sealed result exhaustively.');
      b.writeln('  static ${u.sealed} ${u.resolver}(BuildContext context) {');
      b.writeln('    final s = ScreenScope.of(context);');
      b.writeln('    return switch (s) {');
      for (final r in u.members) {
        b.writeln('      ${sv(r.name)} => ${_cap(r.name)}Id('
            'ScreenScope.idOf<${r.idType ?? 'Object?'}>(context, ${sv(r.name)})),');
      }
      b.writeln("      _ => throw StateError('${u.resolver}() under \${s.name}'),");
      b.writeln('    };');
      b.writeln('  }');
    }
    // forget(): free a parked keep. 0 keeps → no surface; 1 → a named zero-arg
    // verb (forgetShop); 2+ → forget(Keep) taking the keep handle.
    if (kept.length == 1) {
      b.writeln('  static void forget${_cap(kept.single)}() => '
          '$spec.graph.forget(${sv(kept.single)});');
    } else if (kept.length >= 2) {
      b.writeln('  static void forget(Keep keep) => $spec.graph.forget(keep.spec);');
    }
    for (final r in rows) {
      if (!globalSafe(r.name)) continue; // id-behind targets: reach via chaining
      b.writeln('  ${kickStart(r.name).trim()}');
    }
    b.writeln('}');
    b.writeln('');

    // Screen.replace facade: a static-only redirect handle (replace lives only
    // here, never on a Nav — so `Screen.replace.replace`/`nav.replace` are
    // un-writable). Each verb flags the batch replace, then delegates to Screen;
    // if `on(...)` misses, no commit runs and the engine drops the pending flag.
    b.writeln('/// The `Screen.replace` redirect facade — every verb mirrors `Screen`');
    b.writeln('/// but commits as a history REPLACE (web `replaceState`).');
    b.writeln('final class Replace {');
    b.writeln('  const Replace._();');
    if (hasKickstart) {
      b.writeln('  KickstartNav go<N extends AnyNav>(Hop<N> hop) {');
      b.writeln('    $spec.graph.markReplace();');
      b.writeln('    return Screen.go(hop);');
      b.writeln('  }');
    }
    b.writeln('  /// Scoped redirect — replace is decided here, before scoping; a miss');
    b.writeln('  /// (null) commits nothing, so the pending flag is dropped, not leaked.');
    b.writeln('  N? on<N extends AnyNav>(On<N> which) {');
    b.writeln('    $spec.graph.markReplace();');
    b.writeln('    return Screen.on(which);');
    b.writeln('  }');
    for (final r in rows) {
      if (!globalSafe(r.name)) continue;
      final ret = unionName(r.name);
      final idT = idOf[r.name];
      final params = idT == null ? '' : '$idT id';
      final args = idT == null ? '' : 'id';
      b.writeln('  $ret go${_cap(r.name)}($params) {');
      b.writeln('    $spec.graph.markReplace();');
      b.writeln('    return Screen.go${_cap(r.name)}($args);');
      b.writeln('  }');
    }
    b.writeln('}');
    b.writeln('');

    // A committed navigation, retyped: the engine's `(Enum, Object?)` stacks
    // mapped to the public sealed `ScreenEntry`, so the destination's id is
    // typed. Derivations (direction/forward/…) forward from the runtime snapshot.
    b.writeln('/// One committed navigation as typed [ScreenEntry] stacks.');
    b.writeln('final class ScreenNavigation {');
    b.writeln('  ScreenNavigation._(this._n);');
    b.writeln('  final Navigation _n;');
    b.writeln('  List<ScreenEntry> get from =>');
    b.writeln('      [for (final e in _n.from) _entryOf(e.\$1, e.\$2)];');
    b.writeln('  List<ScreenEntry> get to =>');
    b.writeln('      [for (final e in _n.to) _entryOf(e.\$1, e.\$2)];');
    b.writeln('  ScreenEntry get source => _entryOf(_n.source.\$1, _n.source.\$2);');
    b.writeln('  ScreenEntry get destination =>');
    b.writeln('      _entryOf(_n.destination.\$1, _n.destination.\$2);');
    b.writeln('  NavDirection get direction => _n.direction;');
    b.writeln('  bool get isForward => _n.isForward;');
    b.writeln('  bool get isBackward => _n.isBackward;');
    b.writeln('  bool get isRoundTrip => _n.isRoundTrip;');
    b.writeln('  bool get isJump => _n.isJump;');
    b.writeln('}');
    b.writeln('');

    b.writeln('/// One typed entry per screen — `switch` it for the screen-specific id.');
    b.writeln('sealed class ScreenEntry { const ScreenEntry(); }');
    for (final r in rows) {
      final idT = idOf[r.name];
      final cls = '${_cap(r.name)}Entry';
      if (idT == null) {
        b.writeln('final class $cls extends ScreenEntry { const $cls(); }');
      } else {
        b.writeln('final class $cls extends ScreenEntry {');
        b.writeln('  const $cls(this.id);');
        b.writeln('  final $idT id;');
        b.writeln('}');
      }
    }
    b.writeln('ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {');
    for (final r in rows) {
      final idT = idOf[r.name];
      final cls = '${_cap(r.name)}Entry';
      b.writeln(idT == null
          ? '      ${sv(r.name)} => const $cls(),'
          : '      ${sv(r.name)} => $cls(id as $idT),');
    }
    b.writeln("      _ => throw StateError('not a $spec screen'),");
    b.writeln('    };');
    b.writeln('');

    if (hasKickstart) {
      b.writeln('final class Hop<N extends AnyNav> {');
      b.writeln('  const Hop._(this.spec, this.id, this.nav);');
      b.writeln('  final Enum spec;');
      b.writeln('  final Object? id;');
      b.writeln('  final N nav;');
      for (final r in rows) {
        if (!globalSafe(r.name)) continue; // id-behind targets: reach via chaining
        // Inherit-rescued kick-starts need a multi-step chain; a Hop is one go, so
        // they get the named Screen.goX only, not the Hop/ternary form.
        if (placements[r.name]!.single.inheritSource != null) continue;
        final n = unionName(r.name);
        if (r.idType == null) {
          b.writeln('  static const ${r.name} = Hop<$n>._(${sv(r.name)}, null, $n._());');
        } else {
          b.writeln('  static Hop<$n> ${r.name}(${r.idType} id) => Hop._(${sv(r.name)}, id, const $n._());');
        }
      }
      b.writeln('}');
    }

    // Screen.on(.path) selector: a suffix the matcher tests against the live
    // stack. On<N> accumulates one (spec, id) per segment; each chain step
    // narrows the live placement set FORWARD, so only satisfiable child paths are
    // offered (no impossible chain like a child that exists only under a
    // different parent). A cyclic terminal also exposes .depth(n) -> OnDepth, the
    // only token carrying the depth FIELD (its method lives on the steps).
    final stepBuf = StringBuffer();
    final stepEmitted = <String>{};
    String navTypeOf(List<PlacementNode> ms) =>
        ms.length == 1 ? placementName(ms.single) : unionName(ms.first.screen);
    List<PlacementNode> fwd(List<PlacementNode> ms) =>
        [for (final m in ms) for (final c in m.children) if (c.again == null) c];
    String setStem(List<PlacementNode> ms) {
      if (ms.length == 1) {
        final pn = placementName(ms.single);
        return pn.substring(0, pn.length - 3);
      }
      if (ms.length == placements[ms.first.screen]!.length) return _cap(ms.first.screen);
      return (ms.map(stemOf).toList()..sort()).join();
    }
    // A step type is needed when the set can be refined further (forward
    // children), stopped-on with a depth (cyclic), or carries an id (the OnX
    // class hosts `call(id)` so the selector is `.x` for any id and `.x(id)` to
    // pin one). Otherwise a non-cyclic id-free leaf lands on a bare On<nav>.
    String? stepNameFor(List<PlacementNode> ms) {
      final sc = ms.first.screen;
      if (fwd(ms).isEmpty &&
          !cyclic.contains(sc) &&
          idOf[sc] == null &&
          !viewScreens.containsKey(sc)) return null;
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
      stepBuf.writeln('final class $name extends On<$nav> {');
      stepBuf.writeln('  const $name._(super.specs, super.ids, super.nav, [super.conds]) : super._();');
      // View-state conditions narrow the match: `.query({.category('x')})`.
      if (viewScreens.containsKey(sc)) {
        final vs = viewScreens[sc]!;
        if (vs.query.isNotEmpty) {
          stepBuf.writeln('  $name query(Set<${_cap(sc)}QueryCond> cs) =>'
              ' $name._(specs, ids, nav, [...conds, ...cs]);');
        }
        if (vs.fragment.isNotEmpty) {
          stepBuf.writeln('  $name fragment(Set<${_cap(sc)}FragmentCond> cs) =>'
              ' $name._(specs, ids, nav, [...conds, ...cs]);');
        }
      }
      // Every child selector is a getter (id appended as null = "match any");
      // an id-bearing child's own step hosts `call(id)` to pin it.
      for (final e in groups.entries) {
        final cNav = navTypeOf(e.value);
        final cStep = stepNameFor(e.value);
        final ret = cStep ?? 'On<$cNav>';
        final ctor = cStep ?? 'On';
        stepBuf.writeln('  $ret get ${e.key} => $ctor._([...specs, ${sv(e.key)}], [...ids, null], const $cNav._());');
      }
      if (idOf[sc] != null) {
        stepBuf.writeln('  $name call(${idOf[sc]} id) => $name._(specs, [...ids.sublist(0, ids.length - 1), id], nav);');
      }
      if (cyclic.contains(sc)) {
        stepBuf.writeln('  OnDepth<$nav> depth(int d) => OnDepth._(specs, ids, d, nav);');
      }
      stepBuf.writeln('}');
      for (final e in groups.entries) {
        emitStep(e.value);
      }
    }

    // The synthetic boot placement (rule 2): `Screen.at` returns it while booting
    // (blob-null cold-boot, before the resolver commits). No `Nav` suffix (so it
    // can't collide with a `<screen>Nav`), no `goInitial` (unreachable by
    // navigation) — pattern-match `Screen.at case Initial()`. The first commit out
    // of boot auto-replaces, so the loading screen leaves no history.
    b.writeln('/// The boot placement: `Screen.at` returns it until the first commit.');
    b.writeln('/// `if (Screen.at case Initial()) ...` gates blob-null cold-boot UI.');
    b.writeln('final class Initial extends AnyNav { const Initial._() : super._(); }');

    b.writeln('final class On<N extends AnyNav> {');
    b.writeln('  const On._(this.specs, this.ids, this.nav, [this.conds = const []]);');
    b.writeln('  final List<Enum> specs;');
    b.writeln('  final List<Object?> ids;');
    b.writeln('  final N nav;');
    b.writeln('  /// View-state conditions on the terminal screen (`.query`/`.fragment`).');
    b.writeln('  final List<ViewCond> conds;');
    for (final r in rows) {
      final ms = placements[r.name]!;
      if (ms.isEmpty) continue;
      final nav = unionName(r.name);
      final step = stepNameFor(ms);
      final ret = step ?? 'On<$nav>';
      final ctor = step ?? 'On';
      // Always a getter (id = null matches any); `.x(id)` invokes the step's
      // call() to pin a specific id.
      b.writeln('  static $ret get ${r.name} => const $ctor._([${sv(r.name)}], [null], $nav._());');
    }
    if (hasParentOf) {
      b.writeln('  /// Disambiguating push onto the current scope when a screen has');
      b.writeln('  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —');
      b.writeln('  /// `.parentOf` alone is not an `On`, so the bare form will not compile.');
      b.writeln('  static _ParentSel get parentOf => const _ParentSel._();');
    }
    b.writeln('}');
    if (hasParentOf) {
      b.writeln('final class OnParentOf<N extends AnyNav> extends On<N> {');
      b.writeln('  const OnParentOf._(this.parents, N nav) : super._(const [], const [], nav);');
      b.writeln('  final Set<Enum> parents;');
      b.writeln('}');
      b.writeln('final class _ParentSel {');
      b.writeln('  const _ParentSel._();');
      for (final e in parentScreensOf.entries) {
        final cap = '${_cap(e.key)}NavParent';
        final lits = (e.value.toList()..sort()).map((s) => '${sv(s)}').join(', ');
        b.writeln('  OnParentOf<$cap> get ${e.key} =>');
        b.writeln('      OnParentOf._(const {$lits}, const $cap._());');
      }
      b.writeln('}');
      for (final e in parentsOf.entries) {
        final cap = '${_cap(e.key)}NavParent';
        final parents = e.value;
        // Push the target plus every sibling edge shared by all parents.
        final shared = sharedChildrenOf(parents).toList()..sort();
        b.writeln('final class $cap extends AnyNav {');
        b.writeln('  const $cap._() : super._();');
        for (final child in shared) {
          b.writeln(parentPush(child));
        }
        // pop() is the parent-level pop; legal only if every parent is non-root.
        if (hasCanPop && allParentsNonRoot(parents)) {
          b.writeln('  PopDestNav pop() { $spec.graph.pop(); return const PopDestNav._(); }');
        }
        b.writeln('}');
      }
    }
    if (cyclic.isNotEmpty) {
      b.writeln('final class OnDepth<N extends AnyNav> extends On<N> {');
      b.writeln('  const OnDepth._(super.specs, super.ids, this.depth, super.nav) : super._();');
      b.writeln('  final int depth;');
      b.writeln('}');
    }
    for (final r in rows) {
      emitStep(placements[r.name]!);
    }
    b.write(stepBuf);

    // Instances carry only their own edge-gated go(Hop); jump-to-anywhere is
    // the static Screen.go, so a leaf nav cannot go nowhere by inheritance.
    b.writeln('abstract base class AnyNav {');
    b.writeln('  const AnyNav._();');
    b.writeln('}');

    // Cycle pop-union navs: bare pop() into a cycle returns one of these; its
    // `.at` resolves the actual predecessor (a sealed marker the predecessor navs
    // implement → exhaustive switch). It also pops one more level when the
    // grandparents resolve unambiguously, so `.pop().pop()` chains.
    for (final u in unions.values) {
      b.writeln('sealed class ${u.marker} {}');
      b.writeln('final class ${u.nav} extends AnyNav {');
      b.writeln('  const ${u.nav}._() : super._();');
      final parents = [for (final m in u.members) if (m.parent != null) m.parent!];
      if (parents.length == u.members.length) {
        String? gp;
        if (parents.length == 1) {
          gp = placementName(parents.single);
        } else if (parents.map((p) => p.screen).toSet().length == 1) {
          gp = unionName(parents.first.screen);
        }
        if (gp != null) {
          b.writeln('  $gp pop() { $spec.graph.pop(); return const $gp._(); }');
        }
      }
      usesEndsWith = true;
      b.writeln('  ${u.marker} get at {');
      b.writeln('    final c = $spec.graph.currentChain;');
      final sorted = [...u.members]..sort((a, b) => b.path.length.compareTo(a.path.length));
      for (final m in sorted) {
        final lits = m.path.map((s) => '${sv(s)}').join(', ');
        b.writeln('    if (_endsWith(c, const [$lits])) return const ${placementName(m)}._();');
      }
      b.writeln("    throw StateError('unresolved ${u.nav}: \$c');");
      b.writeln('  }');
      b.writeln('}');
    }

    // Global pop surface. CanPopNav: the union of poppable (non-root) placements
    // — Screen.canPop returns it iff the active top is non-root. PopDestNav: where
    // a pop lands, resolved from the post-pop chain; shared forward verbs appear
    // only for children common to EVERY destination (an app-wide screen).
    if (hasCanPop) {
      b.writeln('sealed class CanPopPlacement {}');
      b.writeln('sealed class PopDestPlacement {}');
      b.writeln('final class CanPopNav extends AnyNav {');
      b.writeln('  const CanPopNav._() : super._();');
      b.writeln('  CanPopPlacement get at => Screen.at as CanPopPlacement;');
      b.writeln('  PopDestNav pop() { $spec.graph.pop(); return const PopDestNav._(); }');
      b.writeln('}');
      b.writeln('final class PopDestNav extends AnyNav {');
      b.writeln('  const PopDestNav._() : super._();');
      final destFwd = [
        for (final p in destMembers)
          {for (final c in p.children) if (c.again == null) c.screen}
      ];
      final destShared =
          destFwd.isEmpty ? <String>{} : destFwd.reduce((a, b) => a.intersection(b));
      for (final cs in destShared) {
        b.writeln('  ${goVerb(cs, unionName(cs), const []).trim()}');
      }
      b.writeln('  PopDestPlacement get at {');
      b.writeln('    final c = $spec.graph.currentChain;');
      final sorted = [...destMembers]
        ..sort((a, b) => b.path.length.compareTo(a.path.length));
      for (final m in sorted) {
        final lits = m.path.map((s) => '${sv(s)}').join(', ');
        b.writeln('    if (_chainIs(c, const [$lits])) return const ${placementName(m)}._();');
      }
      b.writeln("    throw StateError('unresolved PopDestNav: \$c');");
      b.writeln('  }');
      b.writeln('}');
    }

    // Kick-start union: `Screen.go(Hop)` returns this; `.at` narrows to the exact
    // single-placement target it landed on (every kick-startable nav implements
    // KickstartPlacement). Switch it exhaustively.
    if (hasKickstart) {
      b.writeln('sealed class KickstartPlacement {}');
      b.writeln('final class KickstartNav extends AnyNav {');
      b.writeln('  const KickstartNav._() : super._();');
      b.writeln('  KickstartPlacement get at => Screen.at as KickstartPlacement;');
      b.writeln('}');
    }

    // Shared-widget id unions: one sealed family per id-ambiguous widget, a
    // case per screen carrying that screen's typed id.
    for (final u in widgetUnions) {
      b.writeln('sealed class ${u.sealed} { const ${u.sealed}(); }');
      for (final r in u.members) {
        b.writeln('final class ${_cap(r.name)}Id extends ${u.sealed} {');
        b.writeln('  const ${_cap(r.name)}Id(this.id);');
        b.writeln('  final ${r.idType ?? 'Object?'} id;');
        b.writeln('}');
      }
    }

    // forget()'s gated target table — only when there are 2+ keeps (a single
    // keep gets the named forget<Keep>() verb instead, so it needs no handle).
    if (kept.length >= 2) {
      b.writeln('final class Keep {');
      b.writeln('  const Keep._(this.spec);');
      b.writeln('  final Enum spec;');
      for (final name in kept) {
        b.writeln('  static const $name = Keep._(${sv(name)});');
      }
      b.writeln('}');
    }

    for (final r in rows) {
      final nodes = placements[r.name]!;
      if (isSingle(r.name)) {
        // One class, exact edges (union == placement).
        final n = nodes.isEmpty ? null : nodes.first;
        final anc = n == null ? const <String, String>{} : ancestorsOf(n);
        navClass(
          unionName(r.name),
          n == null ? const [] : goVerbs(n.children, childType, n.path),
          pops: {
            ...anc,
            // Cycle members (incl. self) as throwing pops; see leaf loop below.
            for (final m in cycleMembers(r.name))
              if (!anc.containsKey(m)) m: unionName(m),
          },
          edges: n == null
              ? const {}
              : {for (final c in n.children) if (c.inheritSource == null) c.screen: childType(c)},
          markers: [if (viewScreens.containsKey(r.name)) '${_cap(r.name)}View'],
          parentScreen: n?.parent?.screen,
          path: n?.path,
          extra: () {
            final parts = [
              if (viewScreens.containsKey(r.name)) viewGetters(r.name),
              if (cyclic.contains(r.name))
                '  int get depth => $spec.graph.countOf(${sv(r.name)});',
            ];
            return parts.isEmpty ? null : parts.join('\n');
          }(),
        );
        continue;
      }

      // Multi-placement: a recursive narrowing trie. The phantom carries the
      // global intersection; `.placement` flat-resolves to a leaf; `.under`
      // (emitted only where it differs — a subgroup is itself a partial) steps
      // one ancestor outward into partials/leaves. Empty sealed markers (always
      // implemented, never extended) are the switch targets; every nav carries
      // its FULL level actions (re-providing the shared ones for completeness).

      // Shared (intersection) forward children over a placement group. Includes
      // inherited edges — they get a named no-id verb just like single
      // placements; only the ternary go(Hop) form (sharedEdges) drops them.
      Set<String> sharedFwd(List<PlacementNode> group) => [
            for (final n in group) {for (final c in n.children) c.screen}
          ].reduce((a, b) => a.intersection(b));
      List<String> sharedVerbs(List<PlacementNode> group, List<String> path) {
        final fwdShared = sharedFwd(group);
        final seen = <String>{};
        return [
          for (final n in group)
            for (final c in n.children)
              if (fwdShared.contains(c.screen) && seen.add(c.screen))
                goVerb(c.screen, unionName(c.screen), path, c.inheritSource?.screen)
        ];
      }
      // Edge-gated go over the group's shared forward edges, excluding inherited
      // ones (their id can't be supplied statically through a Hop).
      Map<String, String> sharedEdges(List<PlacementNode> group) {
        final inh = {
          for (final n in group)
            for (final c in n.children)
              if (c.inheritSource != null) c.screen
        };
        return {
          for (final s in sharedFwd(group))
            if (!inh.contains(s)) s: unionName(s)
        };
      }
      // Guaranteed pops common to the whole group: a screen that's an ancestor
      // of every placement is always in the live chain regardless of which one
      // you're at. Union-typed where the ancestor itself is multi-placement.
      Map<String, String> sharedPops(List<PlacementNode> group) {
        final per = [for (final n in group) ancestorsOf(n)];
        final common =
            per.map((m) => m.keys.toSet()).reduce((a, b) => a.intersection(b));
        final pops = <String, String>{};
        for (final m in per) {
          for (final e in m.entries) {
            if (!common.contains(e.key)) continue;
            final prev = pops[e.key];
            pops[e.key] =
                (prev == null || prev == e.value) ? e.value : unionName(e.key);
          }
        }
        return pops;
      }

      final leafMarkers = {for (final n in nodes) n: <String>{}};
      final markersToEmit = <String>{};

      // Emits the nav for a group (suffixLen ancestors pinned), records the
      // markers its leaves implement, recurses for `.under`. Returns its type.
      String walk(List<PlacementNode> group, int suffixLen, List<String> impl) {
        if (group.length == 1) {
          leafMarkers[group.single]!.addAll(impl);
          return placementName(group.single);
        }
        final suffix =
            group.first.path.sublist(group.first.path.length - suffixLen);
        final navName =
            suffixLen == 1 ? unionName(r.name) : '${suffix.map(_cap).join()}Nav';
        final stem = navName.substring(0, navName.length - 3);

        // .placement — flat to this group's leaves.
        final placementMarker = '${stem}Placement';
        markersToEmit.add(placementMarker);
        for (final n in group) {
          leafMarkers[n]!.add(placementMarker);
        }
        final pg = StringBuffer();
        pg.writeln('  $placementMarker get at {');
        pg.writeln('    final c = $spec.graph.currentChain;');
        for (final n in group) {
          final p = n.path.map((s) => '${sv(s)}').join(', ');
          pg.writeln('    if (_chainIs(c, const [$p])) return const ${placementName(n)}._();');
        }
        pg.writeln("    throw StateError('unresolved ${r.name} placement: \$c');");
        pg.write('  }');

        // .under — one step outward, grouped by next ancestor.
        final subgroups = <String?, List<PlacementNode>>{};
        for (final n in group) {
          final i = n.path.length - 1 - suffixLen;
          subgroups.putIfAbsent(i >= 0 ? n.path[i] : null, () => []).add(n);
        }
        final pgUnder = StringBuffer();
        if (subgroups.values.any((g) => g.length > 1)) {
          final underMarker = '${stem}Under';
          markersToEmit.add(underMarker);
          pgUnder.writeln('  $underMarker get under {');
          pgUnder.writeln('    final c = $spec.graph.currentChain;');
          for (final sub in subgroups.values) {
            final subType = walk(sub, suffixLen + 1, [underMarker]);
            final subSuffix = sub.first.path
                .sublist(sub.first.path.length - (suffixLen + 1))
                .map((s) => '${sv(s)}')
                .join(', ');
            usesEndsWith = true;
            pgUnder.writeln('    if (_endsWith(c, const [$subSuffix])) return const $subType._();');
          }
          pgUnder.writeln("    throw StateError('unresolved ${r.name} under: \$c');");
          pgUnder.write('  }');
        }

        var extra = pgUnder.isEmpty ? pg.toString() : '$pg\n$pgUnder';
        if (cyclic.contains(r.name)) {
          extra = '$extra\n  int get depth => $spec.graph.countOf(${sv(r.name)});';
        }
        if (viewScreens.containsKey(r.name)) {
          extra = '${viewGetters(r.name)}\n$extra';
        }
        final sp = sharedPops(group);
        navClass(navName, sharedVerbs(group, suffix),
            // Cycle members (incl. self) so chains like popToProfile().popToProfile()
            // keep returning a handle that still exposes the cycle pops.
            pops: {
              ...sp,
              for (final m in cycleMembers(r.name))
                if (!sp.containsKey(m)) m: unionName(m),
            },
            edges: sharedEdges(group),
            extra: extra,
            path: suffix,
            markers: [
              ...impl,
              if (viewScreens.containsKey(r.name)) '${_cap(r.name)}View',
            ],
            parentScreen: suffix.length >= 2 ? suffix[suffix.length - 2] : null);
        return navName;
      }

      walk(nodes, 1, const []);

      for (final m in markersToEmit) {
        b.writeln('sealed class $m {}');
      }
      for (final n in nodes) {
        final anc = ancestorsOf(n);
        navClass(
          placementName(n),
          goVerbs(n.children, childType, n.path),
          pops: {
            ...anc,
            // Cycle members (incl. the screen itself — self-pop to the previous
            // occurrence, since resolvePop skips the current top). Throwing.
            for (final m in cycleMembers(n.screen))
              if (!anc.containsKey(m)) m: unionName(m),
          },
          edges: {for (final c in n.children) c.screen: childType(c)},
          parentScreen: n.parent?.screen,
          markers: [
            ...leafMarkers[n]!,
            if (viewScreens.containsKey(n.screen)) '${_cap(n.screen)}View',
          ],
          path: n.path,
          extra: () {
            final parts = [
              if (viewScreens.containsKey(n.screen)) viewGetters(n.screen),
              if (cyclic.contains(n.screen))
                '  int get depth => $spec.graph.countOf(${sv(n.screen)});',
            ];
            return parts.isEmpty ? null : parts.join('\n');
          }(),
        );
      }
    }

    // A typed key for ONLY the id-bearing screens, so `context.idOf(.x)` can't
    // be asked for a screen that has no id (it wouldn't compile).
    final idRows = [for (final r in rows) if (r.idType != null) r];
    if (idRows.isNotEmpty) {
      b.writeln('extension type const ScreenId<I>._(Enum spec) {');
      for (final r in idRows) {
        b.writeln(
            '  static const ${r.name} = ScreenId<${r.idType}>._(${sv(r.name)});');
      }
      b.writeln('}');
    }

    b.writeln('extension ScreenIdOf on BuildContext {');
    if (idRows.isNotEmpty) {
      b.writeln(
          '  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);');
    }
    b.writeln('  /// The screen this widget belongs to (its enclosing scope).');
    b.writeln('  Screen<Object?> get screen => Screen.forSpec(ScreenScope.of(this));');
    b.writeln('}');

    b.writeln('void verifyScreens() {');
    b.writeln('  assert(() {');
    for (final r in rows) {
      // An all-id-free enum declares no `id` field — nothing to assert.
      if (!specsWithId.contains(r.spec)) continue;
      // `.id` is now the screen's Codec (or null when id-free). Assert its
      // presence matches the generated tier — codec added/removed without a
      // rebuild is caught here; the structure signature catches shape drift.
      if (r.idType == null) {
        b.writeln("    assert(${sv(r.name)}.id == null, '${r.name} has an unexpected id codec — rerun build_runner');");
      } else {
        b.writeln("    assert(${sv(r.name)}.id != null, '${r.name} is missing its id codec — rerun build_runner');");
      }
    }
    b.writeln('    return true;');
    b.writeln('  }());');
    b.writeln('}');

    if (usesEndsWith) {
      b.writeln('bool _endsWith(List<Enum> chain, List<Enum> suffix) {');
      b.writeln('  if (chain.length < suffix.length) return false;');
      b.writeln('  final off = chain.length - suffix.length;');
      b.writeln('  for (var i = 0; i < suffix.length; i++) {');
      b.writeln('    if (chain[off + i] != suffix[i]) return false;');
      b.writeln('  }');
      b.writeln('  return true;');
      b.writeln('}');
    }

    // ── Link surface — typed `Link` classes from the tree's `.links` branches.
    // Domain-agnostic; parse (C3b) is path-only — the platform verifies the host.
    final endpoints =
        linkEndpoints(model.links, element, {for (final r in rows) r.name}, idOf);
    if (endpoints.isNotEmpty) {
      b.writeln('');
      // One concrete `Link` class per case (k = a union branch, or null for a
      // single-slot endpoint). Phase A: a `.link` branch seeds no widget, so every
      // case is `WidgetlessLink`; the `WidgetLink` family rides the placement form.
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
        // The injected screen-id branch is renderable from the URL → WidgetLink;
        // every other branch needs resolution → WidgetlessLink.
        final widget = k != null && e.slots[ui!].codecs[k].isWidgetId;
        return (
          name: k == null ? e.className : _siblingName(entity, e.slots[ui!].codecs[k]),
          marker: ui == null ? null : e.className,
          family: widget ? 'WidgetLink' : 'WidgetlessLink',
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

      b.writeln('/// A strict URL -> typed Link, from the tree\'s `.link` branches.');
      b.writeln('sealed class Link { const Link(); }');
      b.writeln('sealed class WidgetLink extends Link { const WidgetLink(); }');
      b.writeln('sealed class WidgetlessLink extends Link { const WidgetlessLink(); }');
      // per-entity marker (rule 14): the union cases IMPLEMENT it, cross-cutting
      // the widget families, so `case UserLink()` catches any branch of that entity.
      for (final e in endpoints) {
        if (_unionSlot(e) != null) {
          b.writeln('sealed class ${e.className} implements Link {}');
        }
      }
      for (final c in cases) {
        final d = caseOf(c.e, c.k);
        final impl = d.marker != null ? ' implements ${d.marker}' : '';
        final params = [for (final f in d.fields) 'this.${f.$1}'];
        if (params.isEmpty) {
          b.writeln('final class ${d.name} extends ${d.family}$impl '
              '{ const ${d.name}(); }');
        } else {
          b.writeln('final class ${d.name} extends ${d.family}$impl {');
          b.writeln('  const ${d.name}(${params.join(', ')});');
          for (final f in d.fields) {
            b.writeln('  final ${f.$2} ${f.$1};');
          }
          b.writeln('}');
        }
      }

      // parse: runtime path match (host-agnostic) → typed Link + the URL's origin.
      b.writeln('');
      b.writeln('/// A parsed [Link] plus the URL\'s origin (the host is reported,');
      b.writeln('/// not matched — the platform already verified it is ours).');
      b.writeln('final class ParsedLink {');
      b.writeln('  const ParsedLink(this.link, this.domain);');
      b.writeln('  final Link link;');
      b.writeln('  final String domain;');
      b.writeln('}');
      b.writeln('');
      b.writeln('/// Parses [url] into a typed [Link] + origin, or null if not a link.');
      b.writeln('ParsedLink? parseLink(String url) {');
      b.writeln('  final m = $spec.graph.parseLink(url);');
      b.writeln('  if (m == null) return null;');
      b.writeln('  final uri = Uri.parse(url);');
      b.writeln('  final link = switch (m.template) {');
      for (final e in endpoints) {
        final ui = _unionSlot(e);
        if (ui == null) {
          final d = caseOf(e, null);
          b.writeln("    '${e.template}' => ${d.name}(${d.ctorArgs.join(', ')}),");
        } else {
          final arms = [
            for (var k = 0; k < e.slots[ui].codecs.length; k++)
              '$k => ${() {
                final d = caseOf(e, k);
                return '${d.name}(${d.ctorArgs.join(', ')})';
              }()}'
          ];
          b.writeln("    '${e.template}' => switch (m.branches[$ui]) "
              "{ ${arms.join(', ')}, _ => throw StateError('bad union branch') },");
        }
      }
      b.writeln('    _ => null,');
      b.writeln('  };');
      b.writeln('  if (link == null) return null;');
      b.writeln('  return ParsedLink(link, \'\${uri.scheme}://\${uri.host}\');');
      b.writeln('}');

      // encode: typed Link → full URL under the (default) domain.
      final linkDomain = annotation.peek('domain')?.stringValue;
      final sig = linkDomain != null
          ? "Link link, [String domain = '$linkDomain']"
          : 'Link link, String domain';
      b.writeln('');
      b.writeln('/// Encodes a [Link] to a full URL under [domain].');
      b.writeln('String toUri($sig) {');
      b.writeln('  switch (link) {');
      for (final c in cases) {
        final d = caseOf(c.e, c.k);
        final pats = [for (final f in d.fields) ':final ${f.$1}'];
        final pat = pats.isEmpty ? '${d.name}()' : '${d.name}(${pats.join(', ')})';
        b.writeln('    case $pat:');
        b.writeln("      return $spec.graph.encodeLink(domain, '${c.e.template}', "
            '<Object?>[${d.pathVals.join(', ')}], <int>[${d.branchVals.join(', ')}]);');
      }
      b.writeln('  }');
      b.writeln('}');
    }

    // ── View-state data types: `<Screen>Query` (read getters) + `<Screen>QueryMut`
    // (adds setters), same for fragment. Everything nullable; a flag is `bool`
    // (set false ⟹ cleared). Backed by the runtime's view store.
    void emitViewType(String screen, String part, List<ViewKey> keys) {
      if (keys.isEmpty) return;
      final base = '${_cap(screen)}${part == 'f' ? 'Fragment' : 'Query'}';
      String getOf(ViewKey k) => k.flag
          ? "$spec.graph.viewGet(${sv(screen)}, '${k.name}') == true"
          : "$spec.graph.viewGet(${sv(screen)}, '${k.name}') as ${k.type}?";
      b.writeln('/// Screen-local ${part == 'f' ? 'fragment' : 'query'} '
          'view-state for `$screen` (read-only).');
      b.writeln('class $base {');
      b.writeln('  const $base._();');
      for (final k in keys) {
        final t = k.flag ? 'bool' : '${k.type}?';
        b.writeln('  $t get ${k.name} => ${getOf(k)};');
      }
      b.writeln('}');
      b.writeln('');
      b.writeln('/// Mutable [$base] — a setter per key (null clears / removes from URL).');
      b.writeln('final class ${base}Mut extends $base {');
      b.writeln('  const ${base}Mut._() : super._();');
      for (final k in keys) {
        if (k.flag) {
          b.writeln('  set ${k.name}(bool v) => '
              "$spec.graph.viewSet(${sv(screen)}, '${k.name}', v ? true : null);");
        } else {
          b.writeln('  set ${k.name}(${k.type}? v) => '
              "$spec.graph.viewSet(${sv(screen)}, '${k.name}', v);");
        }
      }
      b.writeln('}');
      b.writeln('');
    }

    if (viewScreens.isNotEmpty) {
      // Sealed read-only base (named AnyView, mirroring AnyNav — `View` would
      // collide with Flutter's View widget). `Screen.of(context)`/`context.on`
      // return these; pattern-match `case FeedView()` to render per current screen.
      b.writeln('/// Read-only placement view — the reactive reads return these.');
      b.writeln('sealed class AnyView {}');
      b.writeln('');
    }
    // Condition vocabulary for the selector grammar: `FeedQueryCond.category('x')`
    // (equals), `.byFav` (flag true), and a `.not` mirror (not-equals / false). Each
    // is a `ViewCond` carrying its key (the reactive aspect) + the test.
    void emitCond(String screen, String part, List<ViewKey> keys) {
      if (keys.isEmpty) return;
      final base = '${_cap(screen)}${part == 'f' ? 'Fragment' : 'Query'}Cond';
      final not = '${_cap(screen)}${part == 'f' ? 'Fragment' : 'Query'}Not';
      // static factory on the cond type (positive); instance member on `.not`.
      String pos(ViewKey k) => k.flag
          ? "static const $base ${k.name} = $base._('${k.name}', true);"
          : "static $base ${k.name}(${k.type} v) => $base._('${k.name}', v);";
      String neg(ViewKey k) => k.flag
          ? "$base get ${k.name} => const $base._('${k.name}', true, negate: true);"
          : "$base ${k.name}(${k.type} v) => $base._('${k.name}', v, negate: true);";
      b.writeln('/// Condition terms for `$screen`\'s ${part == 'f' ? 'fragment' : 'query'}'
          ' — `.key(v)` equals, `.byFlag` true, `.not.…` negates.');
      b.writeln('final class $base implements ViewCond {');
      b.writeln('  const $base._(this.key, this.expected, {this.negate = false});');
      b.writeln('  @override\n  final String key;');
      b.writeln('  final Object? expected;');
      b.writeln('  final bool negate;');
      b.writeln('  @override');
      b.writeln('  bool test(Object? v) { final eq = v == expected; return negate ? !eq : eq; }');
      for (final k in keys) {
        b.writeln('  ${pos(k)}');
      }
      b.writeln('  static const $not not = $not._();');
      b.writeln('}');
      b.writeln('final class $not {');
      b.writeln('  const $not._();');
      for (final k in keys) {
        b.writeln('  ${neg(k)}');
      }
      b.writeln('}');
      b.writeln('');
    }

    for (final e in viewScreens.entries) {
      emitViewType(e.key, 'q', e.value.query);
      emitViewType(e.key, 'f', e.value.fragment);
      emitCond(e.key, 'q', e.value.query);
      emitCond(e.key, 'f', e.value.fragment);
      // The read-only view the nav implements: getters return the READ models,
      // while the nav's own getters return the mutable `…Mut` subtypes (covariant).
      final v = '${_cap(e.key)}View';
      b.writeln('/// Read-only view-state of `${e.key}` — the reactive reads return');
      b.writeln('/// this; the navigable `${_cap(e.key)}Nav` adds the setters.');
      b.writeln('abstract interface class $v implements AnyView {');
      if (e.value.query.isNotEmpty) b.writeln('  ${_cap(e.key)}Query get query;');
      if (e.value.fragment.isNotEmpty) {
        b.writeln('  ${_cap(e.key)}Fragment get fragment;');
      }
      b.writeln('}');
      b.writeln('');
    }

    if (viewScreens.isNotEmpty) {
      // Current/self screen → its read-only view (or null). Shared by Screen.of
      // and the context reads.
      b.writeln('AnyView? _viewOf(Enum? screen) => switch (screen) {');
      for (final s in viewScreens.keys) {
        b.writeln('      ${sv(s)} => const ${unionName(s)}._(),');
      }
      b.writeln('      _ => null,');
      b.writeln('    };');
      b.writeln('');
      // Reactive, read-only context reads. `context.on` = the widget's OWN
      // placement (ignores screens above it); `context.current` = the foreground.
      // Both rebuild on the selector's referenced view-state keys; `.current` also
      // on placement. Read-only — navigate/write via the imperative `Screen.on`.
      b.writeln('/// Reactive read-only view reads scoped to this BuildContext.');
      b.writeln('extension ScreenViewContext on BuildContext {');
      b.writeln('  /// SELF: is this widget\'s own placement [sel] (+ its conditions)?');
      b.writeln('  AnyView? on<N extends AnyNav>(On<N> sel) =>');
      b.writeln('      ScreenScope.of(this) == sel.specs.last &&');
      b.writeln('              ViewMatch.conds(this, sel.specs.last, sel.conds)');
      b.writeln('          ? _viewOf(sel.specs.last)');
      b.writeln('          : null;');
      b.writeln('  /// CURRENT foreground: does it match [sel] (+ conditions)?');
      b.writeln('  AnyView? current<N extends AnyNav>(On<N> sel) =>');
      b.writeln('      Placement.current(this) == sel.specs.last &&');
      b.writeln('              ViewMatch.conds(this, sel.specs.last, sel.conds)');
      b.writeln('          ? _viewOf(sel.specs.last)');
      b.writeln('          : null;');
      b.writeln('}');
      b.writeln('');
    }

    return b.toString();
  }
}
