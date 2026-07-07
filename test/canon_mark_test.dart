import 'package:build_test/build_test.dart';
import 'package:canon_generator/canon_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

// Minimal stubs — just enough surface for the resolver. The annotation sits
// at its REAL path so source_gen's TypeChecker matches it.
const _annotationStub = '''
class Canon { const Canon(); }
const canon = Canon();
''';

const _canonStub = '''
export 'src/screens_annotation.dart';

class IDs { const IDs(); }

abstract class Codec<T> {
  const Codec();
  static const Codec<String> uuid = _C();
  static const _C2 integer = _C2();
}
class _C extends Codec<String> { const _C(); }
class _C2 extends Codec<int> {
  const _C2();
  Codec<int> call(Symbol name) => this;
}

abstract mixin class IdNode implements Codec<Object?> {
  const IdNode();
}

mixin SegBase on Enum {}
class Domain {
  Domain(this.url);
  final String url;
  Object call(Set<Object?> children) => this;
}
class Slot {
  Slot call(Set<Object?> children) => this;
}
Slot slot(Codec<Object?> codec, {String? suffix}) => Slot();
Object tree(Set<Object?> domains) => Object();
class LinkMatcher {
  const LinkMatcher(Object spec);
}
''';

const _cdnSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@IDs()
enum Ids with IdNode {
  ad(Codec.uuid),
  user(Codec.uuid);

  const Ids(this._codec);
  final Codec _codec;
}

@canon
enum _Cdn with SegBase {
  ads, profiles, avatar, thumb;

  static final routes = tree({
    Domain('https://cdn.example.com')({
      ads({
        slot(Ids.ad)({
          thumb,
          slot(Codec.integer(#image), suffix: '_thumb'),
          slot(Codec.integer(#image)),
        }),
      }),
      profiles({
        slot(Ids.user)({
          avatar,
        }),
      }),
    }),
  });
}
''';

Future<void> _expect(Matcher matcher) => testBuilder(
      PartBuilder([CanonGenerator()], '.canon.dart'),
      {
        'canon|lib/src/screens_annotation.dart': _annotationStub,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': _cdnSpec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      outputs: {'pkg|lib/spec.canon.dart': decodedMatches(matcher)},
      onLog: (r) => r.level.value >= 900 ? print(r) : null,
    );

void main() {
  test('@canon on a SegBase enum emits the typed address face', () =>
      _expect(allOf([
        contains('abstract final class Cdn {'),
        contains('LinkMatcher(_Cdn.routes)'),
        // fused seg+slot steps, typed values
        contains('ads(AdId v)'),
        contains('profiles(UserId v)'),
        // static seg children as getters, slot steps named by #symbol + suffix
        contains('get thumb'),
        contains('imageThumb(int v)'),
        contains('image(int v)'),
        contains('get avatar'),
        // endpoints print through the runtime spec
        contains("template: 'ads/*/thumb'"),
        contains("template: 'ads/*/*_thumb'"),
        contains("template: 'ads/*/*'"),
        contains("template: 'profiles/*/avatar'"),
        contains('String get url'),
        contains('Uri toUri()'),
      ])));
}
