import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// ledger owns the @stores grammar and is pure Dart, so the builder stays flutter-free.
import 'package:ledger/ledger.dart' show Stores;

/// One `@entities` row as the generator sees it: the row's name, its id-node
/// value, and whether the graph declares it OWNED (state lives in its root's
/// store — no store of its own).
class _EntityInfo {
  _EntityInfo(this.row, this.node, {required this.owned});
  final String row;
  final DartObject? node;
  final bool owned;
}

/// Reads an `@stores` enum and emits the typed DATA surface. A row declares the
/// two things no grammar derives — that the collection exists, and its reduce
/// (`ads(Ads())`). Everything else derives from the `@entities` graph through
/// the held `Store<K, E, M>`'s entity type: the key node (and so the key type
/// and screen associations), and store LEGALITY (roots only — an owned entity's
/// state lives inside its root's store).
class RegistryGenerator extends GeneratorForAnnotation<Stores> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@stores must annotate an enum',
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

    // The @entities space: entity TYPE name → its row info (node + ownedness).
    final entityByType = await _entitiesByType(element, buildStep);
    // Merge edges declared in the graph: (target row, source row, projection).
    final mergeEdges = await _mergeEdges(element, buildStep);
    // Entity ROW name → (store field name, unit?) — resolves edges to memories.
    final storeByEntityRow = <String, (String, bool)>{};

    // The screen↔registry association is DERIVED, not declared: a screen and a
    // registry that bind the SAME @ids node are about the same identity, so the
    // registry is "the data for" that screen. Map id-node → the screens on it.
    final screensByNode = _screensByNode(element);

    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final held = field.computeConstantValue()?.getField('store')?.type;
      // A UNIT row: holds a ValueStore<S, M> (cardinality one, keyless facts).
      final v = _matchedValue(held);
      if (v != null) {
        final name = field.name!;
        final vArgs = [for (final a in v.typeArguments) a.getDisplayString()];
        // S may be nullable (ValueStore<ViewerState?, …>) — the entity row is
        // the base type.
        var stateKey = _expandedName(v.typeArguments[0]);
        if (stateKey.endsWith('?')) {
          stateKey = stateKey.substring(0, stateKey.length - 1);
        }
        final info = entityByType[stateKey];
        if (info == null) {
          throw InvalidGenerationSourceError(
              'unit store "$name" holds a ValueStore of `${vArgs[0]}`, which '
              'is not a row of the @entities enum — declare the UNIT entity '
              '(type, no key) there.',
              element: element);
        }
        if (info.node != null && !info.node!.isNull) {
          throw InvalidGenerationSourceError(
              'unit store "$name": `${vArgs[0]}` is a KEYED entity (it has an '
              'id node) — a ValueStore may only hold a UNIT entity (a row '
              'declared without a key).',
              element: element);
        }
        final mType = v.typeArguments.last;
        final mEl = mType is InterfaceType ? mType.element : null;
        if (mEl is! ClassElement || !mEl.isSealed) {
          throw InvalidGenerationSourceError(
              'unit store "$name" reduces `${mType.getDisplayString()}`, which '
              'must be a `sealed` class so its reduce is exhaustively '
              'pattern-matched.',
              element: element);
        }
        final superT = 'ValueStore<${vArgs.join(', ')}>';
        fields.add(
            '  static late final ValueMemory<${vArgs.join(', ')}> ${name}Store;');
        binds.add('    ${name}Store = _ledger.value($enumName.$name.store as $superT);');
        storeByEntityRow[info.row] = (name, true);
        continue;
      }
      final s = _matched(held);
      if (s == null) {
        throw InvalidGenerationSourceError(
            'store "${field.name}" must hold a Store<K,E,M> (or a '
            'ValueStore<S,M> for a unit) as its `store` field.',
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
      final ref = '$enumName.$name.store as $superT';

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
      if (mEl is! ClassElement || !mEl.isSealed) {
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
      storeByEntityRow[info.row] = (name, false);
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

    // Door 2 — the nav trigger: on a COMMITTED navigation (never a render),
    // each associated spec judges the landed key via `surface(key, row,
    // flags)` on the RAW store state; a non-null answer dispatches. In-flight
    // keys are skipped (the Awaits twin marked them on the last ask).
    if (triggers.isNotEmpty) {
      final scrEnum = triggers.first.$1;
      binds.add('    $scrEnum.graph.navigations.listen((n) {');
      binds.add('      final (screen, id) = n.destination;');
      for (final (_, scr, name, ref, key) in triggers) {
        binds.add('      if (screen == $scrEnum.$scr) {');
        binds.add('        final key = id as $key;');
        binds.add('        if (!${name}Store.inFlight(key)) {');
        binds.add('          final msg = ($ref).surface(');
        binds.add('              key, ${name}Store.entities[key], ${name}Store.flagsOf(key));');
        binds.add('          if (msg != null) dispatch(msg);');
        binds.add('        }');
        binds.add('      }');
      }
      binds.add('    });');
    }

    // Merge wiring — after every memory is bound (an edge references two).
    for (final (target, source, projection) in mergeEdges) {
      final t = storeByEntityRow[target];
      final s = storeByEntityRow[source];
      if (t == null || s == null) {
        throw InvalidGenerationSourceError(
            'merge edge `$target.merge($source, …)`: both rows need a @stores '
            'entry (missing: ${[if (t == null) target, if (s == null) source].join(', ')}).',
            element: element);
      }
      if (t.$2) {
        throw InvalidGenerationSourceError(
            'merge edge `$target.merge($source, …)`: the TARGET must be a '
            'keyed store — a unit has no per-key read surface to route.',
            element: element);
      }
      if (!s.$2) {
        throw InvalidGenerationSourceError(
            'merge edge `$target.merge($source, …)`: the SOURCE must be a '
            'unit store (it speaks at its state\'s own Identifiable id).',
            element: element);
      }
      binds.add('    ${t.$1}Store.merge(${s.$1}Store, $projection);');
    }

    final b = StringBuffer();
    // The generated reads are public api; a consumer needn't call every one.
    b.writeln('// ignore_for_file: unused_element');
    b.writeln('/// The app-wide ledger — the single state + message api (from @stores).');
    b.writeln('/// `Screen.manager` binds it. `ledger.dispatch(msg)` · `ledger.on<…>(...)` ·');
    b.writeln('/// `ledger.command(...)`; entities live on the public `<row>Store`');
    b.writeln('/// globals. `Screen` is nav; `ledger` is state-and-messages.');
    b.writeln('final ledger = Ledger();');
    b.writeln('bool _bound = false;');
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
      final isScreens = en.metadata.annotations.any((a) =>
          a.computeConstantValue()?.type?.element?.name == 'Screens');
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
      final annotated = en.metadata.annotations.any((a) =>
          a.computeConstantValue()?.type?.element?.name == 'Entities');
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

  /// Every merge edge in the graph, declaration order: (target row, source
  /// row, projection source text). `user.merge(viewer, const P())` reads as
  /// "user's read surface consults viewer through P".
  Future<List<(String, String, String)>> _mergeEdges(
      EnumElement stores, BuildStep buildStep) async {
    EnumElement? entitiesEnum;
    for (final en in stores.library.enums) {
      final annotated = en.metadata.annotations.any((a) =>
          a.computeConstantValue()?.type?.element?.name == 'Entities');
      if (annotated) {
        entitiesEnum = en;
        break;
      }
    }
    if (entitiesEnum == null) return const [];
    final tree = await _graphTree(entitiesEnum, buildStep);
    if (tree == null) return const [];

    final edges = <(String, String, String)>[];
    void collect(Expression node) {
      switch (node) {
        case MethodInvocation(
            target: final Expression target,
            methodName: SimpleIdentifier(name: 'merge'),
            :final argumentList,
          ):
          collect(target);
          final args = [
            for (final a in argumentList.arguments) a.argumentExpression
          ];
          final row = _rowOf(target);
          final source = args.firstOrNull;
          if (row != null && args.length == 2 && source is SimpleIdentifier) {
            // Chained edges collect target-first — declaration order.
            edges.add((row, source.name, args[1].toSource()));
          }
        case FunctionExpressionInvocation(:final function):
          collect(function);
        default:
      }
      final children = _childrenOf(node);
      if (children != null) {
        for (final c in children.elements) {
          if (c is Expression) collect(c);
        }
      }
    }

    for (final e in tree.elements) {
      if (e is Expression) collect(e);
    }
    return edges;
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
    final annotated = el.metadata.annotations
        .any((a) => a.computeConstantValue()?.type?.element?.name == 'IDs');
    if (!annotated) return null;
    final raw = node?.getField('_name')?.toStringValue();
    if (raw == null) return null;
    return '${raw[0].toUpperCase()}${raw.substring(1)}Id';
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
      if (s.element.name == 'ValueStore' && s.typeArguments.length == 2) {
        return s;
      }
    }
    return null;
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
}
