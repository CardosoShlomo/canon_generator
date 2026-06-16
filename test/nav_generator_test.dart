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

Future<void> _expectGenerated(Matcher content, {String spec = _spec}) =>
    testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'canon|lib/src/screens_annotation.dart': _annotation,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': spec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      outputs: {'pkg|lib/spec.nav.dart': decodedMatches(content)},
    );

// A flat tree — every screen is a root, nothing can ever be popped.
const _flatSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Type? id;

  static final graph = NavGraph<_Screens>(
    {home(), feed()},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// Two screens share ChatScreen with DIFFERENT id types — the id-ambiguous case.
const _sharedSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

class ChatScreen { const ChatScreen(); }
class HomeScreen { const HomeScreen(); }

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(HomeScreen()),
  adChat(ChatScreen(), String),
  loopChat(ChatScreen(), int);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Type? id;

  static final graph = NavGraph<_Screens>(
    {home({adChat, loopChat})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

void main() {
  test('emits the typed Screen surface', () => _expectGenerated(allOf(
        contains('final class Screen<I>'),
        contains('goItem(String id)'), // typed id verb
        contains('isCodegenFresh'), // stale-codegen guard
        contains('_treeSignature'),
      )));

  test('emits the on-chain suffix selector + steps', () => _expectGenerated(allOf([
        contains('final class On<'),
        contains('final List<_Screens> specs'), // suffix selector
        contains('final class OnHome'), // step: home has child item
        contains('final class OnItem'), // step: item cyclic, child about
        contains('final class OnAbout'), // step: about cyclic leaf
        contains('final class OnDepth<'), // terminal depth field
        contains('static OnItem item(String id)'), // entry with id
        contains('OnAbout get about'), // chain: item -> about
        contains('OnDepth<ItemNav> depth(int d)'), // depth method on cyclic step
      ])));

  test('emits depth getters and cycle-member pops on cyclic navs', () =>
      _expectGenerated(allOf(
        contains('int get depth => _Screens.graph.countOf(_Screens.item)'),
        contains('int get depth => _Screens.graph.countOf(_Screens.about)'),
        contains('popToAbout'), // item can pop to the cycle member below
      )));

  test('non-cyclic screens get no depth surface', () => _expectGenerated(
        isNot(contains('countOf(_Screens.home)')), // home never recurs
      ));

  test('no unprovable pop surface (compile-safe pops only)', () =>
      _expectGenerated(allOf(
        isNot(contains('maybePop')), // dropped: bool pop defeats compile safety
        isNot(contains('enum Pop')), // its token is gone too
      )));

  test('emits the global canPop / Screen.pop sugar surface', () =>
      _expectGenerated(allOf([
        contains('sealed class CanPopPlacement {}'),
        contains('sealed class PopDestPlacement {}'),
        contains('final class CanPopNav extends AnyNav'),
        contains('final class PopDestNav extends AnyNav'),
        contains('static CanPopNav? get canPop'),
        contains('currentChain.length > 1'), // null at root
        contains('static PopDestNav? pop() => canPop?.pop()'), // documented sugar
        contains('PopDestNav pop()'), // CanPopNav executes the guaranteed pop
        // non-root placements implement the poppable marker
        contains('implements CanPopPlacement'),
      ])));

  test('emits the commit-phase observe() forwarder', () => _expectGenerated(allOf(
        contains('static void Function() observe('),
        contains('_Screens.graph.observe((f, t) => fn(of(f), of(t)))'),
      )));

  test('shared widget with distinct id types gets a sealed id union', () =>
      _expectGenerated(
        allOf([
          contains('sealed class ChatScreenId {}'),
          contains('final class AdChatId extends ChatScreenId'),
          contains('final class LoopChatId extends ChatScreenId'),
          contains('static ChatScreenId chatScreenId(BuildContext context)'),
          contains('_Screens.adChat => AdChatId(e.id as String)'),
          contains('_Screens.loopChat => LoopChatId(e.id as int)'),
          isNot(contains('HomeScreenId')), // single-use widget: no union
        ]),
        spec: _sharedSpec,
      ));

  test('a flat (all-roots) tree generates no pop surface at all', () =>
      _expectGenerated(
        allOf(
          isNot(contains('canPop')),
          isNot(contains('CanPopNav')),
          isNot(contains('PopDestNav')),
          isNot(contains('static PopDestNav? pop')),
        ),
        spec: _flatSpec,
      ));

  test('cycle bare-pop returns a predecessor union with .at', () =>
      _expectGenerated(allOf(
        contains('sealed class AboutHomePopPlacement {}'),
        contains('final class AboutHomePopNav extends AnyNav'),
        contains('AboutHomePopPlacement get at'),
        contains('AboutHomePopNav pop()'), // item pops into the union
        // predecessors implement the marker -> exhaustive switch(x.pop().at)
        matches(RegExp(r'class HomeNav extends AnyNav\s+implements[^{]*AboutHomePopPlacement')),
        matches(RegExp(r'class AboutNav extends AnyNav\s+implements[^{]*AboutHomePopPlacement')),
      )));
}
