import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// identifiable owns the @IDs grammar; pure Dart, so the builder stays flutter-free.
import 'package:canon_codec/canon_codec.dart' show IDs;

/// Reads an `@IDs` enum and emits one zero-cost EXTENSION TYPE per atomic node
/// (`ad` → `extension type AdId(String _) implements String {}`) and one typed
/// record alias per composite (`adChat.compose(ad, user)` → `typedef AdChatId =
/// (AdId, UserId);`). Nominal identity extends from the grammar into the value
/// space: passing a `UserId` where an `AdId` belongs is a compile error, while
/// everything erases to the codec's value type at runtime.
class IdsGenerator extends GeneratorForAnnotation<IDs> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@IDs must annotate an enum',
          element: element);
    }
    final atomics = <String, String>{}; // node name -> representation type
    final composites = <String, List<String>>{}; // name -> component node names

    void read(String name, DartObject? value) {
      final parts = _compositeParts(value);
      if (parts != null) {
        final names = [for (final p in parts) _enumName(p)];
        if (names.contains(null)) {
          throw InvalidGenerationSourceError(
              'composite id "$name" has a component that is not an @ids node.',
              element: element);
        }
        composites[name] = names.cast<String>();
        return;
      }
      final rep = _codecValueType(value);
      if (rep == null) {
        throw InvalidGenerationSourceError(
            'id node "$name" carries no resolvable Codec<T> — the codec\'s '
            'value type is the id\'s representation type.',
            element: element);
      }
      atomics[name] = rep;
    }

    for (final f in element.fields) {
      if (f.isEnumConstant) read(f.name!, f.computeConstantValue());
    }
    // `static const IdNode x = .compose(a, b);` — the static-const composite form.
    for (final f in element.fields) {
      if (f.isEnumConstant || !f.isStatic || !f.isConst) continue;
      final v = f.computeConstantValue();
      if (_compositeParts(v) != null) read(f.name!, v);
    }

    final b = StringBuffer();
    final enumName = element.name;
    b.writeln('// Typed ids — nominal identity in the value space, generated');
    b.writeln('// from the @ids grammar. Zero-cost: each erases to its codec\'s');
    b.writeln('// value type at runtime. `node` links back to the grammar');
    b.writeln('// (`${_idName('x')}.node.codec` reaches the codec).');
    for (final e in atomics.entries) {
      b.writeln('extension type const ${_idName(e.key)}(${e.value} _) '
          'implements ${e.value} {');
      b.writeln('  static const $enumName node = $enumName.${e.key};');
      b.writeln('}');
    }
    for (final e in composites.entries) {
      // Composites are extension types like the atomics: NAMED component
      // access (`key.ad`, never `.$1`) over the positional record the codecs
      // and the engine already speak — zero-cost, nominal, erased.
      final rec = [for (final n in e.value) _idName(n)].join(', ');
      final ctorParams =
          [for (final n in e.value) '${_idName(n)} ${n}'].join(', ');
      final ctorArgs = e.value.join(', ');
      b.writeln('extension type const ${_idName(e.key)}(($rec) _) {');
      b.writeln('  const ${_idName(e.key)}.of($ctorParams) '
          ': this(($ctorArgs));');
      for (var i = 0; i < e.value.length; i++) {
        b.writeln('  ${_idName(e.value[i])} get ${e.value[i]} => _.\$${i + 1};');
      }
      b.writeln('  static const $enumName node = $enumName.${e.key};');
      b.writeln('}');
    }
    return b.toString();
  }

  String _idName(String node) =>
      '${node[0].toUpperCase()}${node.substring(1)}Id';

  /// A composite's `n1`…`n16` component values (individual fields — a const
  /// constructor can't build a list). Null when the value isn't a composite.
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

  /// The enum-constant name of an @ids node value, or null.
  String? _enumName(DartObject o) => o.getField('_name')?.toStringValue();

  /// The `T` of the node's inner `Codec<T>` (`codec` field, or the `_codec`
  /// backing when the enum hosts composite rows).
  String? _codecValueType(DartObject? node) {
    var codec = node?.getField('codec');
    if (codec == null || codec.isNull) codec = node?.getField('_codec');
    final t = (codec != null && !codec.isNull) ? codec.type : null;
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      if (s.element.name == 'Codec' && s.typeArguments.length == 1) {
        final arg = s.typeArguments.first.getDisplayString();
        if (arg != 'Object?' && arg != 'dynamic') return arg;
      }
    }
    return null;
  }
}
