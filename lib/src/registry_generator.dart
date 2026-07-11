import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// One `@entities` row as the generator sees it: the row's name, its id-node
/// value, and whether the graph declares it OWNED (state lives in its root's
/// store — no store of its own).

class _EntityInfo {
  _EntityInfo(this.row, this.node, {required this.owned});
  final String row;
  final DartObject? node;
  final bool owned;
}

/// One row of the flattened graph: the spec expression as written (its
/// const re-spelling IS the instance, by canonicalization) and the held
/// type.
class _Row {
  _Row(this.source, this.type);
  final String source;
  final DartType type;
}

/// Reads the `@canon` REGENCY — the app as a const value:
///
/// ```dart
/// @canon
/// const app = Regency({
///   TodosCovered(),
///   CachedTodosGate(),   // order is the set's order — placement is protection
///   LocalTodos(),
///   Todos(),
/// }, merges: {LocalTodoSupports()});
/// ```
///
/// and emits the typed DATA surface. The RUNTIME owns the structure —
/// `Ledger.root(app)` splices rows (and nested regencies) in order
/// and wires the merge edges the projections carry — so the generated code
/// only names things: the `ledger` global, one `<row>Store` global per
/// reader row (looked up by instance identity), the id tags, the entry
/// facts, and the nav wiring. Getter names derive from the row CLASS
/// (`Todos()` → `ledger.todos`); a NAMED regency row is opaque — the
/// runtime mounts its rows, and consumers read its parts by instance
/// identity (`ledger.at(const MomentPaged().store)`). Everything else
/// derives from the `@entities` graph through each store's entity type.
class RegistryGenerator {
  Future<String> generateForGraph(
      TopLevelVariableElement element, BuildStep buildStep) async {
    final graphVar = element.name!;
    if (graphVar == 'ledger') {
      throw InvalidGenerationSourceError(
          'the @canon regency may not be named `ledger` — the generated '
          'Ledger global claims that name; call the graph `app` (or any '
          'other name).',
          element: element);
    }
    final library = element.library;
    // The identity faces mention BuildContext — emit them only where the
    // Flutter binding is imported, so pure-Dart consumers stay pure.
    final flutterBound = library.firstFragment.libraryImports.any((i) =>
        i.importedLibrary?.uri.toString().contains('canon_flutter') ?? false);

    final rows = await _flattenedRows(element, buildStep);

    // One `extension <Cls>Reads on <Cls>` per row CLASS — the generator
    // never invents a name: `users.of(context)` works because the CONSUMER
    // named the const global; the extension hangs the reads on the class.
    final extensions = <String>[];
    final seenClasses = <String>{};
    final binds = <String>[]; // bind() body lines (tags + nav wiring)
    // Door 2 — scope-entry asks: (screens enum, screen, key type) per
    // screen↔store association; emitted as ONE committed-navigation
    // listener consulting each spec's `surface`.
    final triggers = <(String, String, String)>[];
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
    String? navRowSource;

    // Every `read(const X())` in an enrolled guard must name a regent of
    // THIS graph — checked at build, so an unknown class or a missing
    // `const` fails codegen instead of throwing at the first judge.
    await _validateReadRegents(element, rows, buildStep);

    // The @entities space: entity TYPE name → its row info (node + ownedness).
    final entityByType = await _entitiesByType(library, buildStep);

    // The screen↔registry association is DERIVED, not declared: a screen and a
    // registry that bind the SAME @ids node are about the same identity, so the
    // registry is "the data for" that screen. Map id-node → the screens on it.
    final screensByNode = _screensByNode(library);

    for (final row in rows) {
      final held = row.type;
      final cls = held is InterfaceType ? held.element.name : null;
      if (cls == null) {
        throw InvalidGenerationSourceError(
            'row `${row.source}` has no resolvable class.',
            element: element);
      }

      // A UNIT row: holds a Unit<S, M> (cardinality one, keyless facts).
      final v = _matchedValue(held);
      if (v != null) {
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
        var stateKey = vArgs[0].contains('InvalidType') ||
                v.typeArguments[0].getDisplayString() != vArgs[0]
            ? vArgs[0]
            : _expandedName(v.typeArguments[0]);
        if (stateKey.endsWith('?')) {
          stateKey = stateKey.substring(0, stateKey.length - 1);
        }
        final info = entityByType[stateKey];
        // NavState is the ENGINE's own unit entity — auto-admitted, never a
        // consumer declaration.
        if (info == null && stateKey != 'NavState' && !_fromRegent(held)) {
          throw InvalidGenerationSourceError(
              'unit `$cls` holds a Unit of `${vArgs[0]}`, which '
              'is not a row of the @entities enum — declare the UNIT entity '
              '(type, no key) there.',
              element: element);
        }
        if (info != null && info.node != null && !info.node!.isNull) {
          throw InvalidGenerationSourceError(
              'unit `$cls`: `${vArgs[0]}` is a KEYED entity (it has an '
              'id node) — a Unit may only hold a UNIT entity (a row '
              'declared without a key).',
              element: element);
        }
        _checkSealedM(cls, held, v.typeArguments.last, element);
        if (seenClasses.add(cls)) {
          final b = StringBuffer();
          b.writeln('/// Reads for a `$cls` row — sugar over `ledger.at(this)`.');
          b.writeln('extension ${cls}Reads on $cls {');
          b.writeln('  UnitMemory<${vArgs.join(', ')}> get mem => ledger.at(this);');
          b.writeln();
          b.writeln('  /// The state, now — merge-resolved.');
          b.writeln('  ${vArgs[0]} get state => mem.state;');
          b.writeln();
          b.writeln('  Stream<void> get changes => mem.changes;');
          b.writeln('  Stream<UnitEvent<${vArgs.join(', ')}>> get events => mem.events;');
          final idKey =
              await _identityKeyOf(v.typeArguments[0], buildStep);
          final idNullable = vArgs[0].endsWith('?');
          if (idKey != null) {
            b.writeln();
            b.writeln('  /// The identity the state carries, now.');
            idNullable
                ? b.writeln('  $idKey? get id => state?.id;')
                : b.writeln('  $idKey get id => state.id;');
          }
          if (flutterBound) {
            b.writeln();
            b.writeln('  /// The value, reactively — rebuilds on every change.');
            b.writeln('  ${vArgs[0]} of(BuildContext context) => mem.of(context);');
            if (idKey != null) {
              b.writeln();
              b.writeln('  /// The identity, reactively — rebuilds only');
              b.writeln('  /// when the id changes, never on field churn.');
              idNullable
                  ? b.writeln(
                      '  $idKey? idOf(BuildContext context) => mem.idOf(context);')
                  : b.writeln(
                      '  $idKey idOf(BuildContext context) => mem.idOf(context)!;');
            }
            if (vArgs[0].startsWith('Set<')) {
              b.writeln();
              b.writeln('  /// Membership of the ambient id — the in-flight idiom.');
              b.writeln('  bool containsIdOf(BuildContext context) =>');
              b.writeln('      mem.containsIdOf(context);');
            }
          }
          b.writeln('}');
          extensions.add(b.toString());
        }
        // A NavUnit row makes the LEDGER own navigation: verbs route their
        // ops through the queue (gates may judge them), the unit folds, and
        // the graph mirrors the folded state back.
        if (held.getDisplayString().startsWith('NavUnit')) {
          navRowSource = row.source;
        }
        continue;
      }
      // A GUARD row: judged at its position — protects the rows below it.
      // The runtime mounts it; nothing is emitted, but its reads were
      // validated above.
      if (_matchedGuard(held) != null) continue;
      final s = _matched(held);
      if (s == null) {
        throw InvalidGenerationSourceError(
            'row `${row.source}` must hold a Regent — a Store<K,E,M>, a '
            'Unit<S,M>, a Guard/Veto, or a Regency (nested or named).',
            element: element);
      }
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

      // Derivation through E: the store's entity type finds its @entities row,
      // which carries the key node — nothing is declared twice, so the trees
      // can never disagree. Matched on the alias-EXPANDED type name: the
      // store's supertype keeps a typedef (`AdChatItem`) while the row's Type
      // constant expands it (`ChatItem<AdChatId>`).
      final info =
          _entityFor(cls, args[1], entityByType, element, key: entityKey);
      _checkKeyAgreement(cls, args[1], args[0], info, element);
      _checkSealedM(cls, held, s.typeArguments.last, element);

      final (state, key) = (args[1], args[0]);
      final onScreenReads = <String>[];
      _emitStoreDerivations(
        source: row.source,
        keyType: key,
        state: state,
        info: info,
        flutterBound: flutterBound,
        binds: binds,
        triggers: triggers,
        reads: onScreenReads,
        idNavs: idNavs,
        reverseNavs: reverseNavs,
        nodeTypeOf: nodeTypeOf,
        screensByNode: screensByNode,
      );
      if (seenClasses.add(cls)) {
        final b = StringBuffer();
        b.writeln('/// Reads for a `$cls` row — sugar over `ledger.at(this)`.');
        b.writeln('extension ${cls}Reads on $cls {');
        b.writeln('  StoreMemory<${args.join(', ')}> get mem => ledger.at(this);');
        b.writeln();
        b.writeln('  /// The keyed collection, merge-resolved.');
        b.writeln('  IdentifiableMap<$key, $state> get entities => mem.entities;');
        b.writeln('  Iterable<$state> get values => mem.values;');
        b.writeln('  List<$key> get ids => mem.ids;');
        b.writeln('  $state? operator []($key key) => mem[key];');
        b.writeln();
        b.writeln('  Stream<$key> get changes => mem.changes;');
        b.writeln('  Stream<void> get structure => mem.structure;');
        b.writeln('  Stream<StoreEvent<${args.join(', ')}>> get events => mem.events;');
        if (flutterBound) {
          b.writeln();
          b.writeln('  /// The key SEQUENCE, reactively — structural rebuilds only.');
          b.writeln('  List<$key> of(BuildContext context) => mem.of(context);');
          b.writeln();
          b.writeln('  /// One entity, reactively — id omitted reads the AMBIENT identity.');
          b.writeln('  $state? entityOf(BuildContext context, [$key? id]) =>');
          b.writeln('      mem.entityOf(context, id);');
          b.writeln();
          b.writeln('  /// Plants the item scope over [child] — the list-tile spelling.');
          b.writeln('  Widget item($key id, {required Widget child}) =>');
          b.writeln('      mem.item(id, child: child);');
          b.writeln();
          b.writeln('  /// The enclosing item scope\'s id, when planted from THIS row.');
          b.writeln('  $key? idOf(BuildContext context) => mem.idOf(context);');
        }
        for (final r in onScreenReads) {
          b.writeln(r);
        }
        b.writeln('}');
        extensions.add(b.toString());
      }
    }

    // Door 2 — scope entry is a FACT: a COMMITTED navigation (never a
    // render) dispatches the screen's generated entry msg; ask/refetch
    // policy is a GUARD's business, judging the fact like any other.
    final entryScreens = <String, (String, String)>{};
    for (final (scrEnum, scr, key) in triggers) {
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
    if (navRowSource == null && triggers.isNotEmpty) {
      log.info(
          'the regency does not own navigation — add `NavUnit()` as the '
          'LAST row for whole-session replay and nav-judging gates.');
    }
    // The ledger OWNS navigation: verbs route through the queue, the
    // NavUnit row folds, the graph mirrors the folded state back — and is
    // (re)seeded so restores and system pops stay truth.
    if (navRowSource != null && triggers.isNotEmpty) {
      final scrEnum = triggers.first.$1;
      // Verb-routed ops mirror SYNCHRONOUSLY — dispatch folds the NavUnit on
      // the spine, so the folded state is readable on return and the verbs'
      // placement returns (pop's destination) stay truthful. The async
      // events tap mirrors NavOps from every other door (gates, restores).
      binds.add('    $scrEnum.graph.routeOps((op) {');
      binds.add('      dispatch(op);');
      binds.add('      final s = ledger.at($navRowSource).state;');
      binds.add('      if (s != null) $scrEnum.graph.applyState(s);');
      binds.add('    });');
      binds.add('    ledger.at($navRowSource).events.listen((e) {');
      binds.add('      final s = e.after;');
      binds.add('      if (s != null) $scrEnum.graph.applyState(s);');
      binds.add('    });');
      binds.add('    dispatch(SeedOp($scrEnum.graph.navState));');
    }

    final b = StringBuffer();
    // The generated reads are public api; a consumer needn't call every one.
    b.writeln('// ignore_for_file: unused_element');
    b.writeln('/// The app-wide ledger, built from the `$graphVar` regency —');
    b.writeln('/// the runtime splices its rows in order and wires its merge');
    b.writeln('/// edges. `Screen.manager` binds the nav side. Reads hang on the');
    b.writeln('/// row CLASSES (`extension <Row>Reads`) — name your rows with const');
    b.writeln('/// globals (`const todos = Todos();`) and read `todos.of(context)`.');
    b.writeln('final ledger = Ledger.root($graphVar);');
    b.writeln();
    b.writeln('/// States a fact — dispatch is the ONLY verb, so it needs no prefix.');
    b.writeln('/// (`ledger.` keeps the rarer surfaces: `on`, `veto`, `guard`, `journal`.)');
    b.writeln('void dispatch(Msg msg) => ledger.dispatch(msg);');
    b.writeln('bool _bound = false;');
    // Scope-entry FACTS — one per id-keyed screen: a committed navigation
    // dispatches it; guards judge asks/refetches from it. When THIS library
    // declares `sealed class <Node>AskMsg` (the key type minus `Id`), the
    // entry fact joins it — a hand-written ask gate then types on the
    // sealed group, exhaustively, across every screen the identity keys.
    final sealedGroups = {
      for (final c in library.classes)
        if (c.isSealed) c.name,
    };
    for (final e in entryScreens.entries) {
      final cls = '${e.key[0].toUpperCase()}${e.key.substring(1)}EnteredMsg';
      final key = e.value.$2;
      final ask =
          '${key.endsWith('Id') ? key.substring(0, key.length - 2) : key}AskMsg';
      final joins = sealedGroups.contains(ask) ? ' implements $ask' : '';
      b.writeln();
      b.writeln('/// The `${e.key}` screen was navigated to (never a render).');
      b.writeln('class $cls extends Msg$joins {');
      b.writeln('  const $cls(this.id);');
      b.writeln('  final ${e.value.$2} id;');
      b.writeln('}');
    }
    b.writeln();
    // The per-CLASS read extensions — the generator never invents a name.
    for (final ext in extensions) {
      b.writeln(ext);
    }
    b.writeln('/// The nav-side wiring. Idempotent — `Screen.manager` calls it.');
    b.writeln('extension ${_cap(graphVar)}Ledger on Ledger {');
    b.writeln('  void bind() {');
    b.writeln('    if (_bound) return;');
    b.writeln('    _bound = true;');
    if (binds.isEmpty) b.writeln('    return;');
    for (final bd in binds) {
      b.writeln(bd);
    }
    b.writeln('  }');
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

  /// The screens/tags/idNav derivations one store row (or brick surface)
  /// contributes — shared by plain stores and bricks.
  void _emitStoreDerivations({
    required String source,
    required String keyType,
    required String state,
    required _EntityInfo info,
    required bool flutterBound,
    required List<String> binds,
    required List<(String, String, String)> triggers,
    required List<String> reads,
    required Map<String,
            (String, String, List<(String, String)>, List<(String, String, String)>)>
        idNavs,
    required Map<String, (String, String, List<String>)> reverseNavs,
    required Map<String, String> nodeTypeOf,
    required Map<String, List<(String, String)>> screensByNode,
  }) {
    // Screens sharing this entity's id-node — the derived association.
    final keyNode = _nodeId(info.node);
    final screens = screensByNode[keyNode] ?? const <(String, String)>[];
    final nodeName = info.node?.getField('_name')?.toStringValue();
    final typedKey = _typedNodeName(info.node);
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
        idNavs[keyNode] = (typedKey ?? keyType, nodeName, screens, compVerbs);
        nodeTypeOf[keyNode] = info.node!.type!.getDisplayString();
      }
      // The REVERSE projection — the gated direction: from a COMPONENT's
      // identity to the composite's screens, the other component read
      // from the live chain (standing under an ad, a user item reaches
      // the ad chat: `UserID.navOf(context).goAdChat()`).
      if (screens.isNotEmpty && compNames[0] != null && compNames[1] != null) {
        final compositeKey = typedKey ?? keyType;
        final compositeSet = screens.map((s) => '${s.$1}.${s.$2}').join(', ');
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
          nodeTypeOf[_nodeId(comps[i])!] = comps[i]!.type!.getDisplayString();
        }
      }
    }
    // Tag the store with its grammar node: every scope it plants carries
    // the node, so the typed ambient reads resolve by MATCH, not distance.
    if (flutterBound && keyNode != null && nodeName != null) {
      binds.add('    IdScope.tag(ledger.at($source), '
          '${info.node!.type!.getDisplayString()}.$nodeName);');
    }
    for (final (scrEnum, scr) in screens) {
      triggers.add((scrEnum, scr, keyType));
      reads.add('');
      reads.add('  /// The entry on screen `$scr`, at its live nav id.');
      reads.add('  $state? on${_cap(scr)}() {');
      reads.add('    for (final e in $scrEnum.graph.stack) {');
      reads.add(
          '      if (e.screen == $scrEnum.$scr) return mem[e.id as $keyType];');
      reads.add('    }');
      reads.add('    return null;');
      reads.add('  }');
    }
  }

  // ── The graph walk ────────────────────────────────────────────────────

  /// The regency's rows FLATTENED: nested graphs splice (recursively, both
  /// inline `Regency({...})` and identifier references to other const
  /// regencies); a NAMED regency is opaque and contributes nothing. Each
  /// row keeps its source text — the const re-spelling of that expression
  /// is the row's identity.
  Future<List<_Row>> _flattenedRows(
      TopLevelVariableElement element, BuildStep buildStep) async {
    final rows = <_Row>[];
    await _walkGraphVar(element, rows, buildStep);
    return rows;
  }

  Future<void> _walkGraphVar(TopLevelVariableElement variable, List<_Row> rows,
      BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(variable.firstFragment, resolve: true);
    if (ast is! VariableDeclaration || ast.initializer == null) {
      throw InvalidGenerationSourceError(
          'the @canon regency must be a const variable with a '
          '`Regency({...})` initializer.',
          element: variable);
    }
    await _walkGraphExpr(ast.initializer!, variable, rows, buildStep);
  }

  Future<void> _walkGraphExpr(Expression expr, Element context, List<_Row> rows,
      BuildStep buildStep) async {
    final creation = switch (expr) {
      InstanceCreationExpression() => expr,
      _ => null,
    };
    if (creation == null || !_wears(expr.staticType, 'Regency')) {
      throw InvalidGenerationSourceError(
          'expected an inline `Regency({...})` here, got '
          '`${expr.toSource()}` — a named regency subclass is not readable; '
          'nest graphs as const variables instead.',
          element: context);
    }
    final rowsArg =
        creation.argumentList.arguments.firstOrNull?.argumentExpression;
    if (rowsArg is! SetOrMapLiteral) {
      throw InvalidGenerationSourceError(
          '`${expr.toSource()}` carries no row set literal.',
          element: context);
    }
    for (final e in rowsArg.elements) {
      if (e is! Expression) continue;
      await _walkRow(e, context, rows, buildStep);
    }
  }

  Future<void> _walkRow(Expression e, Element context, List<_Row> rows,
      BuildStep buildStep) async {
    final t = e.staticType;
    if (_wears(t, 'Regency')) {
      // A nested graph: inline creation recurses in place; an identifier
      // resolves to its const variable and recurses there. A named REGENCY
      // subclass is OPAQUE: the runtime mounts its rows; consumers read its
      // parts by instance identity (`ledger.at(const MomentPaged().store)`),
      // so nothing is emitted.
      if (e is InstanceCreationExpression) {
        final el = t is InterfaceType ? t.element.name : null;
        if (el != 'Regency') return; // an opaque named regency
        await _walkGraphExpr(e, context, rows, buildStep);
        return;
      }
      final name = switch (e) {
        SimpleIdentifier(:final name) => name,
        PrefixedIdentifier(:final identifier) => identifier.name,
        _ => null,
      };
      final lib = context.library;
      final target = name == null || lib == null
          ? null
          : lib.topLevelVariables
              .where((v) => v.name == name)
              .firstOrNull;
      if (target == null) {
        throw InvalidGenerationSourceError(
            'nested regency `${e.toSource()}` does not resolve to a top-level '
            'const variable of this library.',
            element: context);
      }
      await _walkGraphVar(target, rows, buildStep);
      return;
    }
    if (t == null) {
      throw InvalidGenerationSourceError(
          'row `${e.toSource()}` does not resolve — is it a const Regent?',
          element: context);
    }
    rows.add(_Row(_constSource(e), t));
  }

  /// The row expression re-spelled as an explicit const — inside the graph
  /// literal it was implicitly const, so this spelling canonicalizes to the
  /// SAME instance the ledger enrolled. A const-GLOBAL reference (the
  /// consumer's named row — `localProducts`) is already the instance and
  /// takes no keyword.
  String _constSource(Expression e) {
    if (e is Identifier) return e.toSource();
    final src = e.toSource();
    return src.startsWith('const ') ? src : 'const $src';
  }

  /// The `K` of `Identifiable<K>` on a unit's state type (nullability
  /// stripped), or null when the state carries no identity. Generated key
  /// types (UserId) are hidden from this builder's own resolver, so the
  /// resolved walk falls back to the arg AS WRITTEN in the state class's
  /// `with`/`implements` clause.
  Future<String?> _identityKeyOf(DartType t, BuildStep buildStep) async {
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      if (s.element.name == 'Identifiable' && s.typeArguments.length == 1) {
        final k = s.typeArguments.single;
        if (k is! InvalidType) return k.getDisplayString();
        final ast = await buildStep.resolver
            .astNodeFor(t.element.firstFragment, resolve: false);
        if (ast is! ClassDeclaration) return null;
        for (final n in [
          ...?ast.withClause?.mixinTypes,
          ...?ast.implementsClause?.interfaces,
        ]) {
          final args = n.typeArguments?.arguments;
          if (n.name.lexeme == 'Identifiable' && args?.length == 1) {
            return args!.single.toSource();
          }
        }
        return null;
      }
    }
    return null;
  }

  bool _wears(DartType? t, String name) {
    if (t is! InterfaceType) return false;
    return t.element.name == name ||
        t.allSupertypes.any((s) => s.element.name == name);
  }

  /// Whether the row class ships in package:regent — its citizens fold
  /// role-typed slots over `Msg` by design, so the sealed-group law is
  /// theirs to prove in their own suite.
  bool _fromRegent(DartType? t) =>
      t is InterfaceType &&
      t.element.library.uri.toString().startsWith('package:regent/');

  _EntityInfo _entityFor(String name, String entityType,
      Map<String, _EntityInfo> entityByType, Element element,
      {String? key, String owner = 'store'}) {
    final info = entityByType[key ?? entityType];
    if (info == null) {
      throw InvalidGenerationSourceError(
          '$owner "$name" holds `$entityType`, which is not a row '
          'of the @entities enum — declare the entity (type + id node) there.',
          element: element);
    }
    // The ownership guard: stores attach to aggregate ROOTS only.
    if (info.owned) {
      throw InvalidGenerationSourceError(
          '$owner "$name": `$entityType` is OWNED in the entity graph — its '
          'state lives inside its root\'s store; declare the store on the '
          'root entity instead.',
          element: element);
    }
    return info;
  }

  /// Key agreement: the node's value type (or its @IDs extension type) must
  /// be the store's K.
  void _checkKeyAgreement(String name, String entityType, String keyType,
      _EntityInfo info, Element element) {
    final idValueType = _nodeValueType(info.node);
    final typedKey = _typedNodeName(info.node);
    if (idValueType != null && idValueType != keyType && typedKey != keyType) {
      final expected =
          typedKey != null ? '`$typedKey` (or `$idValueType`)' : '`$idValueType`';
      throw InvalidGenerationSourceError(
          'store "$name": `$entityType`\'s id-node keys as $expected, but the '
          'store\'s key type is `$keyType`.',
          element: element);
    }
  }

  /// The SHADOW LAW: no row reduces the unsealed root `Msg` — a
  /// cross-family row declares a sealed GROUP its facts implement. Rows
  /// shipped by package:regent are the engine's own and exempt.
  void _checkSealedM(
      String name, DartType? held, DartType mType, Element element) {
    if (_fromRegent(held)) return;
    final mEl = mType is InterfaceType ? mType.element : null;
    if (mEl is! ClassElement || !mEl.isSealed) {
      throw InvalidGenerationSourceError(
          'row "$name" reduces `${mType.getDisplayString()}`, which must '
          'be a `sealed` class (a sealed GROUP for cross-family rows) so '
          'its reduce is exhaustively pattern-matched.',
          element: element);
    }
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
  Map<String, List<(String, String)>> _screensByNode(LibraryElement library) {
    final map = <String, List<(String, String)>>{};
    for (final en in library.enums) {
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
      LibraryElement library, BuildStep buildStep) async {
    EnumElement? entitiesEnum;
    for (final en in library.enums) {
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

  /// The build-time regent check: every `read(…)` argument inside a guard class
  /// held by a row must be a `const` construction of a class some row holds —
  /// or a part read on a named regency (`read(const BlockedCrud().covered)`).
  /// (Exact-args identity stays a runtime law; the class-level and
  /// missing-`const` mistakes fail HERE, with the guard and row named.)
  Future<void> _validateReadRegents(TopLevelVariableElement element,
      List<_Row> rows, BuildStep buildStep) async {
    final regentTypes = <InterfaceElement>{};
    final guards = <InterfaceElement>[];
    for (final row in rows) {
      final el = row.type is InterfaceType
          ? (row.type as InterfaceType).element
          : null;
      if (el == null) continue;
      regentTypes.add(el);
      if (el.allSupertypes.any(
          (s) => s.element.name == 'Guard' && s.typeArguments.length == 1)) {
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
        // A part read on a named regency — resolves through the regency's
        // memoized identity; trusted here.
        if (arg is PropertyAccess || arg is PrefixedIdentifier) continue;
        // A CONST-GLOBAL row name (`read(todosCovered)`) — the consumer's
        // own name for the canonical instance; the class must still be a
        // row of the graph.
        if (arg is SimpleIdentifier) {
          final target = arg.staticType;
          final targetEl = target is InterfaceType ? target.element : null;
          if (targetEl == null || !regentTypes.contains(targetEl)) {
            throw InvalidGenerationSourceError(
                'guard "${guard.name}" reads `${arg.toSource()}`, but no row '
                'of the regency holds a ${targetEl?.name ?? arg.toSource()} — '
                'every read names a regent of the graph.',
                element: element);
          }
          continue;
        }
        if (arg is! InstanceCreationExpression) {
          throw InvalidGenerationSourceError(
              'guard "${guard.name}" passes `${arg.toSource()}` to `read` — '
              'name the regent with an inline `const <Class>(…)` or a const '
              'global so the build can check it against the regency.',
              element: element);
        }
        if (!arg.isConst && !arg.inConstantContext) {
          throw InvalidGenerationSourceError(
              'guard "${guard.name}" reads `${arg.toSource()}` without '
              '`const` — a non-const expression is a fresh instance, never '
              'the enrolled regent.',
              element: element);
        }
        final target = arg.staticType;
        final targetEl = target is InterfaceType ? target.element : null;
        if (targetEl == null || !regentTypes.contains(targetEl)) {
          throw InvalidGenerationSourceError(
              'guard "${guard.name}" reads `${arg.toSource()}`, but no row '
              'of the regency holds a ${targetEl?.name ?? arg.toSource()} — '
              'every read names a regent of the graph.',
              element: element);
        }
      }
    }
  }
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
