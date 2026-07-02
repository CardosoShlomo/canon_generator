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

    // The @entities space: entity TYPE name → its row info (node + ownedness).
    final entityByType = await _entitiesByType(element, buildStep);

    // The screen↔registry association is DERIVED, not declared: a screen and a
    // registry that bind the SAME @ids node are about the same identity, so the
    // registry is "the data for" that screen. Map id-node → the screens on it.
    final screensByNode = _screensByNode(element);

    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final held = field.computeConstantValue()?.getField('store')?.type;
      final s = _matched(held);
      if (s == null) {
        throw InvalidGenerationSourceError(
            'store "${field.name}" must hold a Store<K,E,M> as its `store` field.',
            element: element);
      }
      final name = field.name!;
      var args = [for (final a in s.typeArguments) a.getDisplayString()];
      // A store keyed by a GENERATED type (`Store<AdId, …>`) resolves to
      // InvalidType inside this builder's own phase (its outputs are hidden
      // from its resolver) — recover the args syntactically from the store
      // class's `extends` clause.
      if (args.contains('InvalidType')) {
        final syntactic = await _syntacticStoreArgs(held, buildStep);
        if (syntactic != null) args = syntactic;
      }
      final superT = 'Store<${args.join(', ')}>';
      final ref = '$enumName.$name.store as $superT';

      // Derivation through E: the store's entity type finds its @entities row,
      // which carries the key node — nothing is declared twice, so the trees
      // can never disagree.
      final entityType = args[1];
      final info = entityByType[entityType];
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
      for (final (scrEnum, scr) in screens) {
        reads.add('  /// $name on screen `$scr` — the entry at its live nav id.');
        reads.add('  static $state? ${name}On${_cap(scr)}() {');
        reads.add('    for (final e in $scrEnum.graph.stack) {');
        reads.add('      if (e.screen == $scrEnum.$scr) return ${name}Store[e.id as $key];');
        reads.add('    }');
        reads.add('    return null;');
        reads.add('  }');
      }
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
    final map = <String, _EntityInfo>{};
    for (final f in entitiesEnum.fields) {
      if (!f.isEnumConstant) continue;
      final v = f.computeConstantValue();
      final typeName = v?.getField('type')?.toTypeValue()?.getDisplayString();
      if (typeName == null) continue;
      map[typeName] = _EntityInfo(f.name!, v?.getField('key'),
          owned: owned.contains(f.name));
    }
    return map;
  }

  /// The row names the entity graph declares as OWNED — every name appearing
  /// as a CHILD in the `static final graph = EntityGraph({...})` tree literal.
  /// Read syntactically (the graph is a non-const `final`).
  Future<Set<String>> _ownedRows(
      EnumElement entitiesEnum, BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(entitiesEnum.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) return const {};
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
    if (tree is! SetOrMapLiteral) return const {};

    final owned = <String>{};
    void walk(Expression node, {required bool asChild}) {
      switch (node) {
        // `row` — a bare leaf.
        case SimpleIdentifier(:final name):
          if (asChild) owned.add(name);
        // `row({children})` — a branch.
        case MethodInvocation(
            methodName: SimpleIdentifier(:final name),
            :final argumentList,
          ):
          if (asChild) owned.add(name);
          final children = argumentList.arguments.firstOrNull?.argumentExpression;
          if (children is SetOrMapLiteral) {
            for (final c in children.elements) {
              if (c is Expression) walk(c, asChild: true);
            }
          }
        default:
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
