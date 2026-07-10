import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// ledger owns the @regents grammar and is pure Dart, so the builder stays flutter-free.
import 'package:regent/regent.dart' show Regents;

/// One `@entities` row as the generator sees it: the row's name, its id-node
/// value, and whether the graph declares it OWNED (state lives in its root's
/// store — no store of its own).
enum _RowKind { store, unit, guard }

class _EntityInfo {
  _EntityInfo(this.row, this.node, {required this.owned});
  final String row;
  final DartObject? node;
  final bool owned;
}

/// Reads a `@regents` enum — the CITIZENS of the ledger — and emits the typed
/// DATA surface. A row declares the two things no grammar derives: that the
/// citizen exists, and its spec (`ads(Ads())`, `cachedChatsGate(CachedChatsGate())`).
/// ROW ORDER IS TRAVERSAL ORDER: bind() registers citizens top to bottom, so a
/// guard row protects exactly the rows below it. Merge edges live in the
/// enum's static `merges` set (`users.from(viewer, const P())`) — STORE rows
/// only, both ends. Everything else derives from the `@entities` graph through
/// each store's entity type: key node, key type, screen associations, and
/// store LEGALITY (roots only).
class RegistryGenerator extends GeneratorForAnnotation<Regents> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@regents must annotate an enum',
          element: element);
    }

    final enumName = element.name;
    // The identity faces mention BuildContext — emit them only where the
    // Flutter binding is imported, so pure-Dart consumers stay pure.
    final flutterBound = element.library.firstFragment.libraryImports.any((i) =>
        i.importedLibrary?.uri.toString().contains('canon_flutter') ?? false);
    final fields = <String>[]; // store field decls
    final binds = <String>[]; // bind() body lines
    final reads = <String>[]; // typed accessors
    // Door 2 — scope-entry asks: (screens enum, screen, store name, spec
    // ref, key type) per screen↔store association; emitted as ONE committed-
    // navigation listener consulting each spec's `surface`.
    final triggers = <(String, String, String, String, String)>[];
    // Deictic item navigation — per id NODE (every store on the node shares
    // one verb set): node identity → (typed key, node name, own screens,
    // component projections (enum, screen, component)).
    final idNavs = <String,
        (String, String, List<(String, String)>, List<(String, String, String)>)>{};
    // Reverse (gated-direction) verbs, keyed by the COMPONENT node:
    // (typed key, node name, emitted verb lines).
    final reverseNavs = <String, (String, String, List<String>)>{};
    // Each node's enum TYPE text (`Ids`) — the faces pass the node value.
    final nodeTypeOf = <String, String>{};
    String? navUnitRow;

    // Every `read(const X())` in an enrolled guard must name a citizen of
    // THIS enum — checked at build, so an unknown class or a missing `const`
    // fails codegen instead of throwing at the first judge.
    await _validateReadCitizenship(element, buildStep);

    // The @entities space: entity TYPE name → its row info (node + ownedness).
    final entityByType = await _entitiesByType(element, buildStep);
    // Merge edges from the enum's static `merges` set:
    // (target row, source row, projection source text).
    final mergeEdges = await _regentMerges(element, buildStep);
    // Row name → kind, for merge-edge legality and facade emission.
    final rowKind = <String, _RowKind>{};
    // Facade getters — one per store/unit row.

    // The screen↔registry association is DERIVED, not declared: a screen and a
    // registry that bind the SAME @ids node are about the same identity, so the
    // registry is "the data for" that screen. Map id-node → the screens on it.
    final screensByNode = _screensByNode(element);

    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final held = field.computeConstantValue()?.getField('regent')?.type;
      // A UNIT row: holds a Unit<S, M> (cardinality one, keyless facts).
      final v = _matchedValue(held);
      if (v != null) {
        final name = field.name!;
        var vArgs = [for (final a in v.typeArguments) a.getDisplayString()];
        // Generated id types are hidden from this builder's own phase — a
        // `Unit<Set<UserId>, …>` resolves as Set<InvalidType>. Recover the
        // args AS WRITTEN in the unit class's extends clause; the entity
        // row's written type matches by the same fallback.
        if (vArgs.any((a) => a.contains('InvalidType'))) {
          vArgs = await _syntacticUnitArgs(held, buildStep) ?? vArgs;
        }
        // S may be nullable (Unit<ViewerState?, …>) — the entity row is
        // the base type.
        var stateKey = vArgs[0].contains('InvalidType') || v.typeArguments[0].getDisplayString() != vArgs[0]
            ? vArgs[0]
            : _expandedName(v.typeArguments[0]);
        if (stateKey.endsWith('?')) {
          stateKey = stateKey.substring(0, stateKey.length - 1);
        }
        final info = entityByType[stateKey];
        // NavState is the ENGINE's own unit entity — auto-admitted, never a
        // consumer declaration.
        if (info == null && stateKey != 'NavState') {
          throw InvalidGenerationSourceError(
              'unit store "$name" holds a Unit of `${vArgs[0]}`, which '
              'is not a row of the @entities enum — declare the UNIT entity '
              '(type, no key) there.',
              element: element);
        }
        if (info != null && info.node != null && !info.node!.isNull) {
          throw InvalidGenerationSourceError(
              'unit store "$name": `${vArgs[0]}` is a KEYED entity (it has an '
              'id node) — a Unit may only hold a UNIT entity (a row '
              'declared without a key).',
              element: element);
        }
        final mType = v.typeArguments.last;
        final mEl = mType is InterfaceType ? mType.element : null;
        // The root `Msg` is admitted unsealed: a SHADOW reduces the whole
        // space and delegates, so its default arm is the design.
        if (mEl is! ClassElement || !(mEl.isSealed || mEl.name == 'Msg')) {
          throw InvalidGenerationSourceError(
              'unit store "$name" reduces `${mType.getDisplayString()}`, which '
              'must be a `sealed` class so its reduce is exhaustively '
              'pattern-matched.',
              element: element);
        }
        final superT = 'Unit<${vArgs.join(', ')}>';
        fields.add(
            '  static late final UnitMemory<${vArgs.join(', ')}> ${name}Store;');
        binds.add('    ${name}Store = _ledger.unit($enumName.$name.regent as $superT);');
        rowKind[name] = _RowKind.unit;
        // A NavUnit row makes the LEDGER own navigation: verbs route their
        // ops through the queue (gates may judge them), the unit folds, and
        // the graph mirrors the folded state back.
        if (held?.getDisplayString().startsWith('NavUnit') ?? false) {
          navUnitRow = name;
        }
        continue;
      }
      // A GUARD row: judged at its position — protects the rows below it.
      // The judge reads the ledger's OWN state ([LedgerReads]) — no facade.
      final g = _matchedGuard(held);
      if (g != null) {
        final name = field.name!;
        var gArgs = [for (final a in g.typeArguments) a.getDisplayString()];
        if (gArgs.any((a) => a.contains('InvalidType'))) {
          gArgs = await _syntacticGuardArgs(held, buildStep) ?? gArgs;
        }
        final superT = 'Guard<${gArgs.join(', ')}>';
        binds.add('    _ledger.guard($enumName.$name.regent as $superT);');
        rowKind[name] = _RowKind.guard;
        continue;
      }
      final s = _matched(held);
      if (s == null) {
        throw InvalidGenerationSourceError(
            'row "${field.name}" must hold a Regent — a Store<K,E,M>, a '
            'Unit<S,M>, or a Guard/Veto — as its `regent` field.',
            element: element);
      }
      final name = field.name!;
      var args = [for (final a in s.typeArguments) a.getDisplayString()];
      // A store keyed by a GENERATED type (`Store<AdId, …>`) resolves to
      // InvalidType inside this builder's own phase (its outputs are hidden
      // from its resolver) — recover the args syntactically from the store
      // class's `extends` clause.
      var entityKey = _expandedName(s.typeArguments[1]);
      if (args.any((a) => a.contains('InvalidType'))) {
        final syntactic = await _syntacticStoreArgs(held, buildStep);
        if (syntactic != null) {
          args = syntactic;
          if (entityKey.contains('InvalidType')) entityKey = syntactic[1];
        }
      }
      final superT = 'Store<${args.join(', ')}>';
      final ref = '$enumName.$name.regent as $superT';

      // Derivation through E: the store's entity type finds its @entities row,
      // which carries the key node — nothing is declared twice, so the trees
      // can never disagree. Matched on the alias-EXPANDED type name: the
      // store's supertype keeps a typedef (`AdChatItem`) while the row's Type
      // constant expands it (`ChatItem<AdChatId>`).
      final entityType = args[1];
      final info = entityByType[entityKey];
      if (info == null) {
        throw InvalidGenerationSourceError(
            'store "$name" holds a Store of `$entityType`, which is not a row '
            'of the @entities enum — declare the entity (type + id node) there.',
            element: element);
      }
      // The ownership guard: stores attach to aggregate ROOTS only.
      if (info.owned) {
        throw InvalidGenerationSourceError(
            'store "$name": `$entityType` is OWNED in the entity graph — its '
            'state lives inside its root\'s store; declare the store on the '
            'root entity instead.',
            element: element);
      }
      // Key agreement: the node's value type (or its @IDs extension type) must
      // be the store's K.
      final keyType = args[0];
      final idValueType = _nodeValueType(info.node);
      final typedKey = _typedNodeName(info.node);
      if (idValueType != null &&
          idValueType != keyType &&
          typedKey != keyType) {
        final expected =
            typedKey != null ? '`$typedKey` (or `$idValueType`)' : '`$idValueType`';
        throw InvalidGenerationSourceError(
            'store "$name": `$entityType`\'s id-node keys as $expected, but the '
            'store\'s key type is `$keyType`.',
            element: element);
      }

      // Screens sharing this entity's id-node — the derived association.
      final keyNode = _nodeId(info.node);
      final screens = screensByNode[keyNode] ?? const <(String, String)>[];
      final nodeName = info.node?.getField('_name')?.toStringValue();
      if (keyNode != null && nodeName != null && !idNavs.containsKey(keyNode)) {
        // A composite node's components project: `id.user` reaches the
        // component's own screens (goUser from an adChat identity).
        final comps = [info.node?.getField('n1'), info.node?.getField('n2')];
        final compNames = [
          for (final c in comps) c?.getField('_name')?.toStringValue()
        ];
        final compVerbs = <(String, String, String)>[]; // enum, screen, component
        for (var i = 0; i < 2; i++) {
          if (compNames[i] == null) continue;
          for (final (en, scr)
              in screensByNode[_nodeId(comps[i])] ?? const <(String, String)>[]) {
            compVerbs.add((en, scr, compNames[i]!));
          }
        }
        if (screens.isNotEmpty || compVerbs.isNotEmpty) {
          idNavs[keyNode] =
              (typedKey ?? keyType, nodeName, screens, compVerbs);
          nodeTypeOf[keyNode] = info.node!.type!.getDisplayString();
        }
        // The REVERSE projection — the gated direction: from a COMPONENT's
        // identity to the composite's screens, the other component read
        // from the live chain (standing under an ad, a user item reaches
        // the ad chat: `UserID.navOf(context).goAdChat()`).
        if (screens.isNotEmpty && compNames[0] != null && compNames[1] != null) {
          final compositeKey = typedKey ?? keyType;
          final compositeSet =
              screens.map((s) => '${s.$1}.${s.$2}').join(', ');
          for (var i = 0; i < 2; i++) {
            final other = comps[1 - i]!;
            final otherName = compNames[1 - i]!;
            final otherKey =
                _typedNodeName(other) ?? _nodeValueType(other) ?? 'Object';
            final atomics =
                screensByNode[_nodeId(other)] ?? const <(String, String)>[];
            final sources = {
              for (final s in atomics) '${s.$1}.${s.$2}',
              for (final s in screens) '${s.$1}.${s.$2}',
            }.join(', ');
            final lines = <String>[];
            for (final (en, scr) in screens) {
              lines.add('  void go${_cap(scr)}() {');
              lines.add('    final e = $en.graph.stack.lastWhere(');
              lines.add('        (e) => const {$sources}.contains(e.screen));');
              lines.add(
                  '    final other = const {$compositeSet}.contains(e.screen)');
              lines.add('        ? (e.id as $compositeKey).$otherName');
              lines.add('        : e.id as $otherKey;');
              lines.add('    $en.graph.popTo(screen);');
              lines.add(
                  '    $en.graph.go($en.$scr, $compositeKey.of(${i == 0 ? 'id, other' : 'other, id'}), true);');
              lines.add('  }');
            }
            final compKey = _typedNodeName(comps[i]!) ??
                _nodeValueType(comps[i]!) ??
                'Object';
            reverseNavs.update(
                _nodeId(comps[i])!, (r) => (r.$1, r.$2, [...r.$3, ...lines]),
                ifAbsent: () => (compKey, compNames[i]!, lines));
            nodeTypeOf[_nodeId(comps[i])!] =
                comps[i]!.type!.getDisplayString();
          }
        }
      }

      // The reduce switches over M, so M MUST be sealed — else a new message
      // variant slips past the reduce with no compile error. Enforce it.
      final mType = s.typeArguments.last;
      final mEl = mType is InterfaceType ? mType.element : null;
      // The root `Msg` is admitted unsealed (shadow delegation).
      if (mEl is! ClassElement || !(mEl.isSealed || mEl.name == 'Msg')) {
        throw InvalidGenerationSourceError(
            'store "$name" reduces `${mType.getDisplayString()}`, which must '
            'be a `sealed` class so its reduce is exhaustively pattern-matched.',
            element: element);
      }
      // Store<K, E, M> → a keyed, optimistic store, exposed as the PUBLIC
      // `<row>Store` global: StoreMemory IS the consumer surface (`[key]`,
      // `entities`, `changes`, `consume`, `watchStatus`) — no read sugar
      // duplicates it. Only the nav-keyed reads are generated (the cross-tree
      // derivation a consumer can't write).
      final (state, key) = (args[1], args[0]);
      fields.add('  static late final StoreMemory<${args.join(', ')}> ${name}Store;');
      binds.add('    ${name}Store = _ledger.store($ref);');
      rowKind[name] = _RowKind.store;
      // Tag the store with its grammar node: every scope it plants carries
      // the node, so the typed ambient reads resolve by MATCH, not distance.
      if (flutterBound && keyNode != null && nodeName != null) {
        binds.add(
            '    IdScope.tag(${name}Store, ${info.node!.type!.getDisplayString()}.$nodeName);');
      }
      for (final (scrEnum, scr) in screens) {
        triggers.add((scrEnum, scr, name, ref, key));
        reads.add('  /// $name on screen `$scr` — the entry at its live nav id.');
        reads.add('  static $state? ${name}On${_cap(scr)}() {');
        reads.add('    for (final e in $scrEnum.graph.stack) {');
        reads.add('      if (e.screen == $scrEnum.$scr) return ${name}Store[e.id as $key];');
        reads.add('    }');
        reads.add('    return null;');
        reads.add('  }');
      }
    }

    // Door 2 — scope entry is a FACT: a COMMITTED navigation (never a
    // render) dispatches the screen's generated entry msg; ask/refetch
    // policy is a GUARD's business, judging the fact like any other.
    final entryScreens = <String, (String, String)>{};
    for (final (scrEnum, scr, _, _, key) in triggers) {
      entryScreens[scr] = (scrEnum, key);
    }
    if (entryScreens.isNotEmpty) {
      final scrEnum = entryScreens.values.first.$1;
      binds.add('    $scrEnum.graph.navigations.listen((n) {');
      binds.add('      final (screen, id) = n.destination;');
      for (final e in entryScreens.entries) {
        final cls = '${e.key[0].toUpperCase()}${e.key.substring(1)}EnteredMsg';
        binds.add('      if (screen == $scrEnum.${e.key}) {');
        binds.add('        dispatch($cls(id as ${e.value.$2}));');
        binds.add('      }');
      }
      binds.add('    });');
    }

    // A ledger WITHOUT a nav row keeps navigation on the local fold — a
    // legitimate choice, but make it conscious: the journal is complete
    // except for movement.
    if (navUnitRow == null && triggers.isNotEmpty) {
      log.info(
          'the regents ledger does not own navigation — add `nav(NavUnit())` '
          'as the LAST row for whole-session replay and nav-judging gates.');
    }
    // The ledger OWNS navigation: verbs route through the queue, the
    // NavUnit row folds, the graph mirrors the folded state back — and is
    // (re)seeded so restores and system pops stay truth.
    if (navUnitRow != null && triggers.isNotEmpty) {
      final scrEnum = triggers.first.$1;
      // Verb-routed ops mirror SYNCHRONOUSLY — dispatch folds the NavUnit on
      // the spine, so the folded state is readable on return and the verbs'
      // placement returns (pop's destination) stay truthful. The async
      // events tap mirrors NavOps from every other door (gates, restores).
      binds.add('    $scrEnum.graph.routeOps((op) {');
      binds.add('      dispatch(op);');
      binds.add('      final s = ${navUnitRow}Store.value;');
      binds.add('      if (s != null) $scrEnum.graph.applyState(s);');
      binds.add('    });');
      binds.add('    ${navUnitRow}Store.events.listen((e) {');
      binds.add('      final s = e.after;');
      binds.add('      if (s != null) $scrEnum.graph.applyState(s);');
      binds.add('    });');
      binds.add('    dispatch(SeedOp($scrEnum.graph.navState));');
    }

    // Merge wiring — after every memory is bound (an edge references two).
    // STORE rows only, both ends: a guard has no memory to merge (the one
    // queue orders them, but readers and judges are different citizens).
    for (final (target, source, projection) in mergeEdges) {
      final t = rowKind[target];
      final sk = rowKind[source];
      if (t == null || sk == null) {
        throw InvalidGenerationSourceError(
            'merge edge `$target.from($source, …)`: both ends must be rows '
            'of the @regents enum (missing: '
            '${[if (t == null) target, if (sk == null) source].join(', ')}).',
            element: element);
      }
      if (t == _RowKind.guard || sk == _RowKind.guard) {
        throw InvalidGenerationSourceError(
            'merge edge `$target.from($source, …)`: merges connect STORE '
            'rows only — a guard judges the flow, it holds no rows to read.',
            element: element);
      }
      if (t == _RowKind.unit && sk != _RowKind.unit) {
        throw InvalidGenerationSourceError(
            'merge edge `$target.from($source, …)`: a unit target takes a '
            'unit source — a store source has no single value to lend.',
            element: element);
      }
      // A unit source speaks at its state's own id (whole value on a unit
      // target); a store source lends its whole collection.
      binds.add(sk == _RowKind.unit
          ? '    ${target}Store.merge(${source}Store, $projection);'
          : '    ${target}Store.mergeStore(${source}Store, $projection);');
    }

    final b = StringBuffer();
    // The generated reads are public api; a consumer needn't call every one.
    b.writeln('// ignore_for_file: unused_element');
    b.writeln('/// The app-wide ledger — the single state + message api (from @regents).');
    b.writeln('/// `Screen.manager` binds it. `ledger.dispatch(msg)` · `ledger.on<…>(...)` ·');
    b.writeln('/// `ledger.command(...)`; entities live on the public `<row>Store`');
    b.writeln('/// globals. `Screen` is nav; `ledger` is state-and-messages.');
    b.writeln('final ledger = Ledger();');
    b.writeln();
    b.writeln('/// States a fact — dispatch is the ONLY verb, so it needs no prefix.');
    b.writeln('/// (`ledger.` keeps the rarer surfaces: `on`, `veto`, `guard`, `journal`.)');
    b.writeln('void dispatch(Msg msg) => ledger.dispatch(msg);');
    b.writeln('bool _bound = false;');
    // Scope-entry FACTS — one per id-keyed screen: a committed navigation
    // dispatches it; guards judge asks/refetches from it.
    for (final e in entryScreens.entries) {
      final cls = '${e.key[0].toUpperCase()}${e.key.substring(1)}EnteredMsg';
      b.writeln();
      b.writeln('/// The `${e.key}` screen was navigated to (never a render).');
      b.writeln('class $cls extends Msg {');
      b.writeln('  const $cls(this.id);');
      b.writeln('  final ${e.value.$2} id;');
      b.writeln('}');
    }
    // The live stores are top-level publics (an extension can hold no state);
    // StoreMemory is the designed consumer surface, so it IS the api.
    for (final f in fields) {
      b.writeln(f.replaceFirst('  static ', ''));
    }
    b.writeln();
    b.writeln('/// The generated data surface, hung on [Ledger] so `ledger.` is the one api.');
    b.writeln('extension on Ledger {');
    b.writeln('  /// Register the stores on the ledger. Idempotent — `Screen.manager` calls it.');
    b.writeln('  void bind() {');
    b.writeln('    if (_bound) return;');
    b.writeln('    _bound = true;');
    for (final bd in binds) {
      b.writeln(bd.replaceAll('_ledger.', '')); // _x = store(this.store as Store)
    }
    b.writeln('  }');
    for (final r in reads) {
      b.writeln(r.replaceFirst('  static ', '  ')); // reads → instance methods
    }
    b.writeln('}');
    // Deictic id-surgical navigation: forward verbs on `IdNav<K>`, one set
    // per id node, minted by `IdScope.of<K>(context)` (works under an
    // EntityScope too). Each verb anchors at the claiming widget's screen
    // (popTo = the deictic verification: a stale or parked context throws)
    // and takes the edge with edgeRequired enforcement — the id is the
    // scope's own, never passed at the call site.
    final navKeys = <String, String>{}; // typed key → node (collision guard)
    // A component node with no store of its own still gets its face and
    // reverse verbs (the identity exists in the grammar regardless).
    for (final r in reverseNavs.entries) {
      idNavs.putIfAbsent(
          r.key, () => (r.value.$1, r.value.$2, const [], const []));
    }
    for (final e in idNavs.entries) {
      final (key, nodeName, screens, compVerbs) = e.value;
      final reverse = reverseNavs[e.key]?.$3 ?? const <String>[];
      final prior = navKeys[key];
      if (prior != null) {
        throw InvalidGenerationSourceError(
            'id nodes `$prior` and `$nodeName` both key as `$key` — their '
            'IdNav verb sets would collide; give the nodes @IDs typed ids.',
            element: element);
      }
      navKeys[key] = nodeName;
      b.writeln();
      // The identity FACE: `ProductID.of(context)` — the capital-ID stamp
      // marks canon's generated identity beside the `ProductId` value type.
      // Flutter-only (BuildContext), so gated on the binding being imported.
      if (flutterBound) {
        b.writeln('/// Canon\'s `$nodeName` identity face: `of` reads the ambient');
        b.writeln('/// typed id, `navOf` mints the deictic handle for the verbs.');
        final node = '${nodeTypeOf[e.key]}.$nodeName';
        b.writeln('abstract final class ${_cap(nodeName)}ID {');
        b.writeln('  static $key of(BuildContext context) =>');
        b.writeln('      IdScope.of<$key>(context, $node);');
        b.writeln('  static IdNav<$key> navOf(BuildContext context) =>');
        b.writeln('      IdScope.navOf<$key>(context, $node);');
        b.writeln('  static $key screenOf(BuildContext context) =>');
        b.writeln('      IdScope.screenOf<$key>(context);');
        b.writeln('  static $key itemOf(BuildContext context) =>');
        b.writeln('      IdScope.itemOf<$key>(context);');
        if (reverseNavs.containsKey(e.key)) {
          b.writeln('  /// The CLAIMED handle — compile-gated: only chains that');
          b.writeln('  /// EVIDENCE this identity type-check (`${_cap(nodeName)}On`);');
          b.writeln('  /// null when the claim misses the live chain.');
          b.writeln('  static IdNav<$key>? on(BuildContext context, ${_cap(nodeName)}On which) =>');
          b.writeln('      Screen.on(which as On) == null');
          b.writeln('          ? null');
          b.writeln('          : IdScope.navOf<$key>(context, $node);');
        }
        b.writeln('}');
        b.writeln();
      }
      b.writeln('/// Deictic forward verbs for the `$nodeName` identity —');
      b.writeln('/// obtain via `${_cap(nodeName)}ID.navOf(context)`; the id is ambient.');
      b.writeln('extension ${_cap(nodeName)}IdNav on IdNav<$key> {');
      for (final (scrEnum, scr) in screens) {
        final verb = _entityVerb(scr, nodeName);
        b.writeln('  void $verb() {');
        b.writeln('    $scrEnum.graph.popTo(screen);');
        b.writeln('    $scrEnum.graph.go($scrEnum.$scr, id, true);');
        b.writeln('  }');
      }
      // Component projections keep the full screen name: the scope is the
      // COMPOSITE identity, so the component is worth saying (goUser from
      // an adChat identity).
      for (final (scrEnum, scr, comp) in compVerbs) {
        b.writeln('  void go${_cap(scr)}() {');
        b.writeln('    $scrEnum.graph.popTo(screen);');
        b.writeln('    $scrEnum.graph.go($scrEnum.$scr, id.$comp, true);');
        b.writeln('  }');
      }
      for (final line in reverse) {
        b.writeln(line);
      }
      b.writeln('}');
    }
    return b.toString();
  }

  /// The deictic verb name for screen [scr] presenting the [nodeName] node:
  /// the self screen is plain `go`; other screens strip the node's name
  /// (the scope already says it) — `userFeed` on node `user` → `goFeed`.
  String _entityVerb(String scr, String? nodeName) {
    if (nodeName == null) return 'go${_cap(scr)}';
    if (scr == nodeName) return 'go';
    if (scr.startsWith(nodeName)) return 'go${scr.substring(nodeName.length)}';
    final cap = _cap(nodeName);
    if (scr.endsWith(cap)) {
      return 'go${_cap(scr.substring(0, scr.length - cap.length))}';
    }
    return 'go${_cap(scr)}';
  }

  String _cap(String s) => s[0].toUpperCase() + s.substring(1);

  /// A stable identity for an `@ids` node value (`Ids.user`): its enum type plus
  /// ordinal. Null when the value is a plain key (no enum node) — those have no
  /// screen association.
  String? _nodeId(DartObject? o) {
    if (o == null || o.isNull) return null;
    final t = o.type?.getDisplayString();
    final i = o.getField('index')?.toIntValue();
    return (t != null && i != null) ? '$t#$i' : null;
  }

  /// Map each id-node to the `(enumName, screenName)` of every `@screens` row
  /// that binds it as its `id` — the screens a node-keyed registry feeds.
  Map<String, List<(String, String)>> _screensByNode(EnumElement registries) {
    final map = <String, List<(String, String)>>{};
    for (final en in registries.library.enums) {
      final isScreens = en.allSupertypes.any((t) =>
          const {'ScreenNodeBase', 'ScreenNode'}.contains(t.element.name));
      if (!isScreens) continue;
      for (final f in en.fields) {
        if (!f.isEnumConstant) continue;
        final node = _nodeId(f.computeConstantValue()?.getField('id'));
        if (node == null) continue;
        (map[node] ??= []).add((en.name!, f.name!));
      }
    }
    return map;
  }

  /// The `@entities` space, keyed by entity TYPE name: each row's id-node and
  /// whether the static graph declares it OWNED (appears as a child anywhere).
  Future<Map<String, _EntityInfo>> _entitiesByType(
      EnumElement stores, BuildStep buildStep) async {
    EnumElement? entitiesEnum;
    for (final en in stores.library.enums) {
      final annotated =
          en.allSupertypes.any((t) => t.element.name == 'EntityNode');
      if (annotated) {
        entitiesEnum = en;
        break;
      }
    }
    if (entitiesEnum == null) return const {};

    final owned = await _ownedRows(entitiesEnum, buildStep);
    // Generated id types are invisible to this builder's own phase, so a
    // row's Type constant may resolve to `ChatItem<InvalidType>` — collapsing
    // distinct instantiations. Fall back to the type name AS WRITTEN.
    final written = await _writtenRowTypes(entitiesEnum, buildStep);
    final map = <String, _EntityInfo>{};
    for (final f in entitiesEnum.fields) {
      if (!f.isEnumConstant) continue;
      final v = f.computeConstantValue();
      final type = v?.getField('type')?.toTypeValue();
      if (type == null) continue;
      final expanded = _expandedName(type);
      final key = expanded.contains('InvalidType')
          ? (written[f.name] ?? expanded)
          : expanded;
      map[key] = _EntityInfo(f.name!, v?.getField('key'),
          owned: owned.contains(f.name));
    }
    return map;
  }

  /// Each entity row's FIRST argument (the type literal) as source text —
  /// the syntactic identity that survives InvalidType.
  Future<Map<String, String>> _writtenRowTypes(
      EnumElement entitiesEnum, BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(entitiesEnum.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) return const {};
    final map = <String, String>{};
    for (final c in (ast.body as BlockEnumBody).constants) {
      final arg = c.arguments?.argumentList.arguments.firstOrNull;
      final expr = arg?.argumentExpression;
      if (expr != null) map[c.name.lexeme] = expr.toSource();
    }
    return map;
  }

  /// A type's name with every alias expanded — the normal form both sides of
  /// the entity lookup reduce to.
  String _expandedName(DartType t) {
    if (t is! InterfaceType) return t.getDisplayString();
    final args = t.typeArguments;
    return args.isEmpty
        ? '${t.element.name}'
        : '${t.element.name}<${args.map(_expandedName).join(', ')}>';
  }

  /// The `EntityGraph({...})` tree literal of [entitiesEnum]'s static `graph`,
  /// read syntactically (the graph is a non-const `final`).
  Future<SetOrMapLiteral?> _graphTree(
      EnumElement entitiesEnum, BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(entitiesEnum.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) return null;
    Expression? graphExpr;
    for (final member in (ast.body as BlockEnumBody).members) {
      if (member is FieldDeclaration) {
        for (final v in member.fields.variables) {
          if (v.name.lexeme == 'graph') graphExpr = v.initializer;
        }
      }
    }
    final args = switch (graphExpr) {
      MethodInvocation(:final argumentList) => argumentList,
      InstanceCreationExpression(:final argumentList) => argumentList,
      _ => null,
    };
    final tree = args?.arguments.firstOrNull?.argumentExpression;
    return tree is SetOrMapLiteral ? tree : null;
  }

  /// A graph node's ROW name, seen through the wrappers a node may wear:
  /// `row` · `row({children})` · `row.merge(src, proj)` (chainable) ·
  /// `row.merge(...)({children})`.
  String? _rowOf(Expression node) => switch (node) {
        SimpleIdentifier(:final name) => name,
        MethodInvocation(
          target: final Expression target,
          methodName: SimpleIdentifier(name: 'merge'),
        ) =>
          _rowOf(target),
        MethodInvocation(target: null, methodName: SimpleIdentifier(:final name)) =>
          name,
        FunctionExpressionInvocation(:final function) => _rowOf(function),
        _ => null,
      };

  /// A graph node's `{children}` literal, if it declares one.
  SetOrMapLiteral? _childrenOf(Expression node) {
    final lit = switch (node) {
      MethodInvocation(target: null, :final argumentList) =>
        argumentList.arguments.firstOrNull?.argumentExpression,
      FunctionExpressionInvocation(:final argumentList) =>
        argumentList.arguments.firstOrNull?.argumentExpression,
      _ => null,
    };
    return lit is SetOrMapLiteral ? lit : null;
  }

  /// The row names the entity graph declares as OWNED — every name appearing
  /// as a CHILD in the `static final graph = EntityGraph({...})` tree literal.
  Future<Set<String>> _ownedRows(
      EnumElement entitiesEnum, BuildStep buildStep) async {
    final tree = await _graphTree(entitiesEnum, buildStep);
    if (tree == null) return const {};

    final owned = <String>{};
    void walk(Expression node, {required bool asChild}) {
      final row = _rowOf(node);
      if (asChild && row != null) owned.add(row);
      final children = _childrenOf(node);
      if (children != null) {
        for (final c in children.elements) {
          if (c is Expression) walk(c, asChild: true);
        }
      }
    }

    for (final e in tree.elements) {
      if (e is Expression) walk(e, asChild: false);
    }
    return owned;
  }

  /// Every edge of the enum's static `merges` set, declaration order:
  /// (target row, source row, projection source text).
  /// `users.from(viewer, const P())` reads as "users' read surface consults
  /// viewer through P"; `.from` chains collect target-first.
  Future<List<(String, String, String)>> _regentMerges(
      EnumElement regentsEnum, BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(regentsEnum.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) return const [];
    Expression? mergesExpr;
    for (final member in (ast.body as BlockEnumBody).members) {
      if (member is FieldDeclaration) {
        for (final v in member.fields.variables) {
          if (v.name.lexeme == 'merges') mergesExpr = v.initializer;
        }
      }
    }
    if (mergesExpr is! SetOrMapLiteral) return const [];

    final edges = <(String, String, String)>[];
    void collect(Expression node) {
      if (node case MethodInvocation(
        target: final Expression target,
        methodName: SimpleIdentifier(name: 'from'),
        :final argumentList,
      )) {
        collect(target);
        final args = [
          for (final a in argumentList.arguments) a.argumentExpression
        ];
        final row = _fromRoot(target);
        final source = args.firstOrNull;
        if (row != null && args.length == 2 && source is SimpleIdentifier) {
          edges.add((row, source.name, args[1].toSource()));
        }
      }
    }

    for (final e in mergesExpr.elements) {
      if (e is Expression) collect(e);
    }
    return edges;
  }

  /// The row a `from` chain hangs off (`users.from(a, pa).from(b, pb)` → users).
  String? _fromRoot(Expression node) => switch (node) {
        SimpleIdentifier(:final name) => name,
        MethodInvocation(
          target: final Expression target,
          methodName: SimpleIdentifier(name: 'from'),
        ) =>
          _fromRoot(target),
        _ => null,
      };

  /// The value type an id-node decodes to: the `T` of the `Codec<T>` its
  /// `codec` (or `_codec` backing) field implements.
  String? _nodeValueType(DartObject? node) {
    var codecObj = node?.getField('codec');
    if (codecObj == null || codecObj.isNull) codecObj = node?.getField('_codec');
    final codecType =
        (codecObj != null && !codecObj.isNull) ? codecObj.type : null;
    if (codecType is! InterfaceType) return null;
    for (final s in [codecType, ...codecType.allSupertypes]) {
      if (s.element.name == 'Codec' && s.typeArguments.length == 1) {
        return s.typeArguments.first.getDisplayString();
      }
    }
    return null;
  }

  /// The generated extension-type name for an id-node, when its enum wears
  /// `@IDs` (`Ids.author` → `AuthorId`).
  String? _typedNodeName(DartObject? node) {
    final el = node?.type?.element;
    if (el is! EnumElement) return null;
    final annotated = el.metadata.annotations.any((a) => const {'IDs', 'Canon'}
        .contains(a.computeConstantValue()?.type?.element?.name));
    if (!annotated) return null;
    final raw = node?.getField('_name')?.toStringValue();
    if (raw == null) return null;
    return '${raw[0].toUpperCase()}${raw.substring(1)}Id';
  }

  /// The held object's `Guard<M>` supertype, or null. A [Veto] matches
  /// through its Guard supertype.
  InterfaceType? _matchedGuard(DartType? t) {
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      if (s.element.name == 'Guard' && s.typeArguments.length == 1) return s;
    }
    return null;
  }

  /// The held object's `Store<K,E,M>` (3 args) supertype, or null.
  InterfaceType? _matched(DartType? t) {
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      if (s.element.name == 'Store' && s.typeArguments.length == 3) return s;
    }
    return null;
  }

  InterfaceType? _matchedValue(DartType? t) {
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      if (s.element.name == 'Unit' && s.typeArguments.length == 2) {
        return s;
      }
    }
    return null;
  }

  /// The `Unit<S, M>` type args AS WRITTEN in the held unit class's
  /// `extends` clause — the fallback when the resolver reports InvalidType
  /// (generated id types are hidden from this builder's own phase).
  Future<List<String>?> _syntacticUnitArgs(
      DartType? held, BuildStep buildStep) async {
    final el = held is InterfaceType ? held.element : null;
    if (el == null) return null;
    final ast =
        await buildStep.resolver.astNodeFor(el.firstFragment, resolve: false);
    if (ast is! ClassDeclaration) return null;
    final sup = ast.extendsClause?.superclass;
    final args = sup?.typeArguments?.arguments;
    if (sup?.name.lexeme != 'Unit' || args == null || args.length != 2) {
      return null;
    }
    return [for (final a in args) a.toSource()];
  }

  /// The `Guard<M>` type arg AS WRITTEN in the held guard class's
  /// `extends` clause (`extends Veto<CachedChatsMsg>` counts — a Veto IS a
  /// Guard) — the fallback when the resolver reports InvalidType.
  Future<List<String>?> _syntacticGuardArgs(
      DartType? held, BuildStep buildStep) async {
    final el = held is InterfaceType ? held.element : null;
    if (el == null) return null;
    final ast =
        await buildStep.resolver.astNodeFor(el.firstFragment, resolve: false);
    if (ast is! ClassDeclaration) return null;
    final sup = ast.extendsClause?.superclass;
    final args = sup?.typeArguments?.arguments;
    final name = sup?.name.lexeme;
    if ((name != 'Guard' && name != 'Veto') ||
        args == null ||
        args.length != 1) {
      return null;
    }
    return [for (final a in args) a.toSource()];
  }

  /// The `Store<K, E, M>` type args AS WRITTEN in the held store class's
  /// `extends` clause — the fallback when the resolver reports InvalidType
  /// (generated id types are hidden from this builder's own phase).
  Future<List<String>?> _syntacticStoreArgs(
      DartType? held, BuildStep buildStep) async {
    final el = held is InterfaceType ? held.element : null;
    if (el == null) return null;
    final ast =
        await buildStep.resolver.astNodeFor(el.firstFragment, resolve: false);
    if (ast is! ClassDeclaration) return null;
    final sup = ast.extendsClause?.superclass;
    final args = sup?.typeArguments?.arguments;
    if (sup?.name.lexeme != 'Store' || args == null || args.length != 3) {
      return null;
    }
    return [for (final a in args) a.toSource()];
  }

  /// Build-time citizenship: every `read(…)` argument inside a guard class
  /// held by a row must be a `const` construction of a class some row holds.
  /// (Exact-args identity stays a runtime law; the class-level and
  /// missing-`const` mistakes fail HERE, with the guard and row named.)
  Future<void> _validateReadCitizenship(
      EnumElement element, BuildStep buildStep) async {
    final citizenTypes = <InterfaceElement>{};
    final guards = <InterfaceElement>[];
    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final held = field.computeConstantValue()?.getField('regent')?.type;
      final el = held is InterfaceType ? held.element : null;
      if (el == null) continue;
      citizenTypes.add(el);
      if (el.allSupertypes
          .any((s) => s.element.name == 'Guard' && s.typeArguments.length == 1)) {
        guards.add(el);
      }
    }
    for (final guard in guards) {
      final ast = await buildStep.resolver
          .astNodeFor(guard.firstFragment, resolve: true);
      if (ast is! ClassDeclaration) continue;
      final visitor = _ReadCallVisitor();
      ast.visitChildren(visitor);
      for (final arg in visitor.readArgs) {
        if (arg is! InstanceCreationExpression) {
          throw InvalidGenerationSourceError(
              'guard "${guard.name}" passes `${arg.toSource()}` to `read` — '
              'name the citizen with an inline `const <Class>(…)` so the '
              'build can check it against the regents enum.',
              element: element);
        }
        if (!arg.isConst && !arg.inConstantContext) {
          throw InvalidGenerationSourceError(
              'guard "${guard.name}" reads `${arg.toSource()}` without '
              '`const` — a non-const expression is a fresh instance, never '
              'the enrolled citizen.',
              element: element);
        }
        final target = arg.staticType;
        final targetEl = target is InterfaceType ? target.element : null;
        if (targetEl == null || !citizenTypes.contains(targetEl)) {
          throw InvalidGenerationSourceError(
              'guard "${guard.name}" reads `${arg.toSource()}`, but no row '
              'of $enumMark holds a ${targetEl?.name ?? arg.toSource()} — '
              'every read names a citizen of the regents enum.',
              element: element);
        }
      }
    }
  }

  static const enumMark = 'the regents enum';
}

/// Collects the argument of every call through a `ReadStore`-typed formal
/// parameter (`read(const X())` inside a judge/block body).
class _ReadCallVisitor extends RecursiveAstVisitor<void> {
  final List<Expression> readArgs = [];

  bool _isReadParam(Element? el) {
    if (el is! FormalParameterElement) return false;
    final t = el.type;
    if (t is! FunctionType || t.formalParameters.length != 1) return false;
    final p = t.formalParameters.single.type;
    return p is InterfaceType && p.element.name == 'AnyStore';
  }

  @override
  void visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    final fn = node.function;
    if (fn is SimpleIdentifier &&
        _isReadParam(fn.element) &&
        node.argumentList.arguments.length == 1) {
      readArgs.add(node.argumentList.arguments.single.argumentExpression);
    }
    super.visitFunctionExpressionInvocation(node);
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    if (node.target == null &&
        _isReadParam(node.methodName.element) &&
        node.argumentList.arguments.length == 1) {
      readArgs.add(node.argumentList.arguments.single.argumentExpression);
    }
    super.visitMethodInvocation(node);
  }
}
