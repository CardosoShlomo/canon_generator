import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:canon_generator/canon_generator.dart';
import 'package:test/test.dart';

// Flutter-free stub of canon so the spec input resolves under the test resolver.
const _annotation = '''
class Screens { const Screens(); }
const screens = Screens();
''';

const _canonStub = '''
export 'src/screens_annotation.dart';

mixin ScreenNode<I, S extends ScreenNode<Object?, S>> on Enum {
  S call([Set<S> children = const {}]) => this as S;
  S keep([Set<S> children = const {}]) => this as S;
  S get cycled => this as S;
  S get stacked => this as S;
}

class NavGraph<S> {
  NavGraph(Set<S> roots,
      {required S initial,
      required Object Function(S, Object?, Object?) pageOf});
}
''';

// home -> item(String) -> about -> item.stacked  (item & about form a cycle).
const _spec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  item(0, String),
  about(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Type? id;

  static final graph = NavGraph<_Screens>(
    {
      home({item({about({item.stacked})})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

Future<void> _expectGenerated(Matcher content) => testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'canon|lib/src/screens_annotation.dart': _annotation,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': _spec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      outputs: {'pkg|lib/spec.nav.dart': decodedMatches(content)},
    );

void main() {
  test('emits the typed Screen surface', () => _expectGenerated(allOf(
        contains('final class Screen<I>'),
        contains('goItem(String id)'), // typed id verb
        contains('isCodegenFresh'), // stale-codegen guard
        contains('_treeSignature'),
      )));

  test('emits the cyclic on-token machine', () => _expectGenerated(allOf(
        contains('final class On<'),
        contains('final class OnId<'),
        contains('final class OnCyclic<'), // about: cyclic, no id
        contains('final class OnIdCyclic<'), // item: cyclic, with id
        contains('final class OnDepth<'), // terminal
        contains('OnDepth<N> depth(int d)'), // depth method on cyclic only
      )));

  test('emits depth getters and cycle-member pops on cyclic navs', () =>
      _expectGenerated(allOf(
        contains('int get depth => _Screens.graph.countOf(_Screens.item)'),
        contains('int get depth => _Screens.graph.countOf(_Screens.about)'),
        contains('popToAbout'), // item can pop to the cycle member below
      )));

  test('non-cyclic screens get no depth surface', () => _expectGenerated(
        isNot(contains('countOf(_Screens.home)')), // home never recurs
      ));

  test('cycle bare-pop returns a predecessor union with .at', () =>
      _expectGenerated(allOf(
        contains('sealed class AboutHomePopPlacement {}'),
        contains('final class AboutHomePopNav extends AnyNav'),
        contains('AboutHomePopPlacement get at'),
        contains('AboutHomePopNav pop()'), // item pops into the union
        // predecessors implement the marker -> exhaustive switch(x.pop().at)
        contains('class HomeNav extends AnyNav implements AboutHomePopPlacement'),
        contains('class AboutNav extends AnyNav implements AboutHomePopPlacement'),
      )));
}
