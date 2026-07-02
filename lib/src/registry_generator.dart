import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// ledger owns the @stores grammar and is pure Dart, so the builder stays flutter-free.
import 'package:ledger/ledger.dart' show Stores;

/// Reads an `@stores` enum and emits the typed DATA surface. For each row it
/// extracts the entity/key types from the held `Store<K, E, M>` (read
/// canon never imports the data engine), and emits a typed accessor.
///
/// First slice: emits the typed `Data` surface (state types proven extractable).
/// The ledger wiring + nav-keyed injection land in the following slices.
class RegistryGenerator extends GeneratorForAnnotation<Stores> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@stores must annotate an enum',
          element: element);
    }

    final enumName = element.name;
    final fields = <String>[]; // store field decls
    final binds = <String>[]; // bind() body lines
    final reads = <String>[]; // typed accessors

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
      final args = [for (final a in s.typeArguments) a.getDisplayString()];
      final superT = s.getDisplayString();
      final ref = '$enumName.$name.store as $superT';

      // Cross-tree guard: a row binds an @ids node as its `key`; if that node
      // carries a codec, the value it decodes to MUST be the registry's key type
      // K. Read structurally (the id-node lives in the @ids enum, the K in the
      // held registry) so the two grammar trees can never silently disagree.
      final keyType = args[0];
      final idValueType = _idValueType(field.computeConstantValue());
      final typedKey = _typedKeyName(field.computeConstantValue());
      if (idValueType != null &&
          idValueType != keyType &&
          typedKey != keyType) {
        final expected =
            typedKey != null ? '`$typedKey` (or `$idValueType`)' : '`$idValueType`';
        throw InvalidGenerationSourceError(
            'registry "$name" binds an @ids node whose key type is $expected, '
            'but its registry key type is `$keyType`. The id-node and the '
            'registry key must agree.',
            element: element);
      }

      // Screens sharing this registry's id-node — the derived association.
      final keyNode = _nodeId(field.computeConstantValue()?.getField('key'));
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

  /// The value type the row's `key` id-node decodes to: the `T` of the `Codec<T>`
  /// its `codec` (or `_codec` backing, when the @ids enum hosts composite rows)
  /// field implements. Null when the key is a plain value (no codec), which
  /// simply skips the cross-tree check.
  String? _idValueType(DartObject? row) {
    final key = row?.getField('key');
    var codecObj = key?.getField('codec');
    if (codecObj == null || codecObj.isNull) codecObj = key?.getField('_codec');
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

  /// The generated extension-type name for the row's `key` node, when its enum
  /// wears `@IDs` (`Ids.author` → `AuthorId`) — the typed alternative the store
  /// key K may use instead of the raw codec type.
  String? _typedKeyName(DartObject? row) {
    final key = row?.getField('key');
    final el = key?.type?.element;
    if (el is! EnumElement) return null;
    final annotated = el.metadata.annotations
        .any((a) => a.computeConstantValue()?.type?.element?.name == 'IDs');
    if (!annotated) return null;
    final raw = key?.getField('_name')?.toStringValue();
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
}
