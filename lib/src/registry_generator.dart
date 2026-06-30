import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// Deep import keeps the builder flutter-free.
// ignore: implementation_imports
import 'package:canon/src/registries_annotation.dart';

/// Reads an `@registries` enum and emits the typed DATA surface. For each row it
/// extracts the entity/state type from the held `Registry<S, M, K>` /
/// `ConnectionRegistry<T, …>` (read structurally off the held object's type —
/// canon never imports the data engine), and emits a typed accessor.
///
/// First slice: emits the typed `Data` surface (state types proven extractable).
/// The ledger wiring + nav-keyed injection land in the following slices.
class RegistryGenerator extends GeneratorForAnnotation<Registries> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@registries must annotate an enum',
          element: element);
    }

    final enumName = element.name;
    final fields = <String>[]; // store field decls
    final binds = <String>[]; // bind() body lines
    final reads = <String>[]; // typed accessors
    final surfaceCalls = <String>[]; // nav-keyed surface triggers to fire live
    final screenEnums = <String>{}; // screen enums to subscribe for commits

    // The screen↔registry association is DERIVED, not declared: a screen and a
    // registry that bind the SAME @ids node are about the same identity, so the
    // registry is "the data for" that screen. Map id-node → the screens on it.
    final screensByNode = _screensByNode(element);

    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final held = field.computeConstantValue()?.getField('registry')?.type;
      final s = _matched(held);
      if (s == null) {
        throw InvalidGenerationSourceError(
            'registry "${field.name}" must hold a Registry<S,M,K> or '
            'ConnectionRegistry<T,I,SK,M,K> as its `registry` field.',
            element: element);
      }
      final name = field.name!;
      final args = [for (final a in s.typeArguments) a.getDisplayString()];
      final superT = s.getDisplayString();
      final ref = '$enumName.$name.registry as $superT';

      // Cross-tree guard: a row binds an @ids node as its `key`; if that node
      // carries a codec, the value it decodes to MUST be the registry's key type
      // K. Read structurally (the id-node lives in the @ids enum, the K in the
      // held registry) so the two grammar trees can never silently disagree.
      final keyType = s.element.name == 'Registry' ? args[2] : args[4];
      final idValueType = _idValueType(field.computeConstantValue());
      if (idValueType != null && idValueType != keyType) {
        throw InvalidGenerationSourceError(
            'registry "$name" binds an @ids node whose codec yields `$idValueType`, '
            'but its registry key type is `$keyType`. The id-node and the '
            'registry key must agree.',
            element: element);
      }

      // Screens sharing this registry's id-node — the derived association.
      final keyNode = _nodeId(field.computeConstantValue()?.getField('key'));
      final screens = screensByNode[keyNode] ?? const <(String, String)>[];

      if (s.element.name == 'Registry') {
        // Registry<S, M, K> → a keyed, optimistic store; read is `S? name(K key)`.
        final (state, key) = (args[0], args[2]);
        fields.add('  static late final RegistryStore<${args.join(', ')}> _$name;');
        binds.add('    _$name = ledger.registry($ref);');
        reads.add('  /// $name — read the entry for [key].');
        reads.add('  static $state? $name($key key) => _$name[key];');
        reads.add('  /// Wire $name\'s transport (the Door 2 fetch); call once after [bind].');
        reads.add('  static void onFetch${_cap(name)}(Fetch<$key> f) => _$name.onFetch(f);');
        // Nav-keyed: read the entry at the screen's LIVE id off the nav stack,
        // plus a Door 2 `surface` trigger fired automatically on every commit.
        for (final (scrEnum, scr) in screens) {
          reads.add('  /// $name on screen `$scr` — the entry at its live nav id.');
          reads.add('  static $state? ${name}On${_cap(scr)}() {');
          reads.add('    for (final e in $scrEnum.graph.stack) {');
          reads.add('      if (e.screen == $scrEnum.$scr) return _$name[e.id as $key];');
          reads.add('    }');
          reads.add('    return null;');
          reads.add('  }');
          final trig = 'surface${_cap(name)}On${_cap(scr)}';
          reads.add('  /// surface $name for screen `$scr` — bring it up at the live nav id.');
          reads.add('  static void $trig() {');
          reads.add('    for (final e in $scrEnum.graph.stack) {');
          reads.add('      if (e.screen == $scrEnum.$scr) { _$name.surface(e.id as $key); return; }');
          reads.add('    }');
          reads.add('  }');
          surfaceCalls.add('$trig()');
          screenEnums.add(scrEnum);
        }
      } else {
        // ConnectionRegistry<T, I, SK, M, K> → a paginated connection family;
        // read is the reactive `(window, floating)` view per connection key.
        final (entity, sortKey, key) = (args[0], args[2], args[4]);
        fields.add('  static late final ConnectionStore<${args.join(', ')}> _$name;');
        binds.add('    _$name = ledger.connection($ref);');
        reads.add('  /// $name — watch the connection at [key].');
        reads.add(
            '  static Stream<ConnectionView<$entity, $sortKey>> $name($key key) => _$name.watch(key);');
        reads.add('  /// Wire $name\'s transport (the Door 2 initial-page fetch); call once after [bind].');
        reads.add('  static void onFetch${_cap(name)}(Fetch<$key> f) => _$name.onFetch(f);');
        for (final (scrEnum, scr) in screens) {
          reads.add('  /// $name on screen `$scr` — watch the connection at its live nav id.');
          reads.add(
              '  static Stream<ConnectionView<$entity, $sortKey>>? ${name}On${_cap(scr)}() {');
          reads.add('    for (final e in $scrEnum.graph.stack) {');
          reads.add('      if (e.screen == $scrEnum.$scr) return _$name.watch(e.id as $key);');
          reads.add('    }');
          reads.add('    return null;');
          reads.add('  }');
          final trig = 'surface${_cap(name)}On${_cap(scr)}';
          reads.add('  /// surface $name for screen `$scr` — load its initial page at the live nav id.');
          reads.add('  static void $trig() {');
          reads.add('    for (final e in $scrEnum.graph.stack) {');
          reads.add('      if (e.screen == $scrEnum.$scr) { _$name.surface(e.id as $key); return; }');
          reads.add('    }');
          reads.add('  }');
          surfaceCalls.add('$trig()');
          screenEnums.add(scrEnum);
        }
      }
    }

    // Door 2 aggregator: fire every nav-keyed surface trigger for the live stack.
    if (surfaceCalls.isNotEmpty) {
      reads.add('  /// Fire every nav-keyed `surface` for the CURRENT stack. [bind]');
      reads.add('  /// subscribes this to each commit; call it manually for a one-off.');
      reads.add('  static void surfaceLive() {');
      for (final c in surfaceCalls) {
        reads.add('    $c;');
      }
      reads.add('  }');
    }

    final b = StringBuffer();
    b.writeln('/// Generated data surface (from @registries). Call [Data.bind]');
    b.writeln('/// once at startup with your ledger.');
    b.writeln('abstract final class Data {');
    fields.forEach(b.writeln);
    b.writeln('  static void bind(Ledger ledger) {');
    binds.forEach(b.writeln);
    // Subscribe the Door 2 triggers to every nav commit, then surface the
    // cold-start stack once.
    for (final se in screenEnums) {
      b.writeln('    $se.graph.navigations.listen((_) => surfaceLive());');
    }
    if (surfaceCalls.isNotEmpty) b.writeln('    surfaceLive();');
    b.writeln('  }');
    reads.forEach(b.writeln);
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
  /// its `codec` field implements. Null when the key is a plain value (no codec),
  /// which simply skips the cross-tree check.
  String? _idValueType(DartObject? row) {
    final codecType = row?.getField('key')?.getField('codec')?.type;
    if (codecType is! InterfaceType) return null;
    for (final s in [codecType, ...codecType.allSupertypes]) {
      if (s.element.name == 'Codec' && s.typeArguments.length == 1) {
        return s.typeArguments.first.getDisplayString();
      }
    }
    return null;
  }

  /// The held object's `Registry<S,M,K>` (3 args) or `ConnectionRegistry`
  /// (5 args) supertype, or null if it holds neither.
  InterfaceType? _matched(DartType? t) {
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      final n = s.element.name;
      if ((n == 'Registry' && s.typeArguments.length == 3) ||
          (n == 'ConnectionRegistry' && s.typeArguments.length == 5)) {
        return s;
      }
    }
    return null;
  }
}
