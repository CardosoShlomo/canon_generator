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
    final fields = <String>[]; // store field decls
    final binds = <String>[]; // bind() body lines
    final reads = <String>[]; // typed accessors
    // Door 2 — scope-entry asks: (screens enum, screen, store name, spec
    // ref, key type) per screen↔store association; emitted as ONE committed-
    // navigation listener consulting each spec's `surface`.
    final triggers = <(String, String, String, String, String)>[];
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
      binds.add('    $scrEnum.graph.routeOps(dispatch);');
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
    return b.toString();
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
