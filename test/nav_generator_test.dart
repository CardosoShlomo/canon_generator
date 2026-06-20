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
  S inherit(S ancestor) => this as S;
}

class NavGraph<S> {
  NavGraph(Set<S> roots,
      {required S initial,
      required Object Function(S, Object?, Object?) pageOf});
}

class Codec<T> {
  const Codec();
  static const Codec<String> string = _StrCodec();
  static const Codec<int> integer = _IntCodec();
}
class _StrCodec implements Codec<String> { const _StrCodec(); }
class _IntCodec implements Codec<int> { const _IntCodec(); }
class Record2Codec<A, B> implements Codec<(A, B)> {
  const Record2Codec(this.a, this.b, [this.sep = '~']);
  final Codec<A> a;
  final Codec<B> b;
  final String sep;
}
''';

// home -> item(String) -> about -> item.stacked  (item & about form a cycle).
const _spec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  item(0, Codec.string),
  about(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

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
  final Codec? id;

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
  adChat(ChatScreen(), Codec.string),
  loopChat(ChatScreen(), Codec.integer);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({adChat, loopChat})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// id types written as sample VALUES (no Type literals, no typedef): a record
// value `('', '')` -> (String, String), and a plain `0` -> int. Needs `Object? id`.
const _recordIdSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  editImage('w', Record2Codec(Codec.string, Codec.string)),
  page(true, Codec.integer);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({editImage, page})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// editAd inherits its ad parent's id: the chained push verb takes no id and
// reads the live ancestor id instead.
const _inheritSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  ad(0, Codec.string),
  editAd(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({ad({editAd.inherit(ad)})})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// item sits under TWO parents (home & feed) -> ambiguous -> gets parentOf.
// editItem sits under one parent (item) -> nameable -> no parentOf entry.
const _parentOfSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0),
  item(0, Codec.string),
  editItem(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({item({editItem.inherit(item)})}),
      feed({item({editItem.inherit(item)})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

void main() {
  test('inherited edge: no-arg chained verb reads the ancestor id', () =>
      _expectGenerated(
        allOf(
          contains('EditAdNav goEditAd() {'), // chained: no id parameter
          contains('_Screens.graph.go(_Screens.editAd, _idOf(_Screens.ad), true)'),
          contains('Object? _idOf(Enum s)'), // the live-ancestor reader
        ),
        spec: _inheritSpec,
      ));

  test('inherit kick-start rescue: one id fills the whole chain', () =>
      _expectGenerated(
        allOf([
          contains('static EditAdNav goEditAd(String id)'), // global kick-start
          contains('_Screens.graph.go(_Screens.ad, id);'), // stamp the source
          contains('_Screens.graph.go(_Screens.editAd, id, true)'), // ...then target
          isNot(contains('Hop<EditAdNav>')), // rescued kick-start is not a Hop
        ]),
        spec: _inheritSpec,
      ));

  test('parentOf includes back-edge parents (a .stacked self-recursion)', () =>
      // _spec: home -> item -> about -> item.stacked. item is pushable from home
      // (forward) AND from about (the back-edge), so parentOf.item must list both.
      _expectGenerated(
        allOf([
          contains('OnParentOf<ItemNavParent> get item'),
          contains('_Screens.about'), // back-edge parent included
          contains('_Screens.home'),
        ]),
      ));

  test('InitialScreen: typed initial heads mirror the kick-start surface', () =>
      _expectGenerated(
        allOf([
          contains('sealed class InitialScreen implements InitialScreenBase'),
          contains('static const HomeInitialScreen home ='), // id-free root -> const
          contains('static AdInitialScreen ad(String id)'), // id-bearing -> idMethod
          contains('static EditAdInitialScreen editAd(String id)'), // rescue head
          // the rescue head stamps the one id across the whole inherit chain:
          contains('(_Screens.ad, id)'),
          contains('(_Screens.editAd, id)'),
          contains('final class HomeInitialScreen extends InitialScreen'),
        ]),
        spec: _inheritSpec,
      ));

  test('parentOf: only for 2+-parent screens, resolved by membership', () =>
      _expectGenerated(
        allOf([
          contains('static _ParentSel get parentOf'),
          contains('final class OnParentOf<'),
          contains('final class _ParentSel {'), // a holder, NOT an On subtype
          isNot(contains('_ParentSel extends')), // so bare on(.parentOf) can't compile
          contains('OnParentOf<ItemNavParent> get item'), // item: 2 parents
          contains('final class ItemNavParent extends AnyNav'),
          contains('ItemNav goItem(String id)'), // pushes the target
          contains('parents.contains(_Screens.graph.current)'),
          isNot(contains('EditItemNavParent')), // editItem: single parent -> no parentOf
          isNot(contains('OnParentOf<EditItemNavParent>')),
        ]),
        spec: _parentOfSpec,
      ));

  test('emits the typed Screen surface', () => _expectGenerated(allOf(
        contains('final class Screen<I>'),
        contains('goItem(String id)'), // typed id verb
        contains('isCodegenFresh'), // stale-codegen guard
        contains('_treeSignature'),
      )));

  test('emits the on-chain suffix selector + steps', () => _expectGenerated(allOf([
        contains('final class On<'),
        contains('final List<Enum> specs'), // suffix selector
        contains('final class OnHome'), // step: home has child item
        contains('final class OnItem'), // step: item cyclic, child about
        contains('final class OnAbout'), // step: about cyclic leaf
        contains('final class OnDepth<'), // terminal depth field
        contains('static OnItem get item'), // id selector is a getter (any id)
        contains('OnItem call(String id)'), // ...callable to pin a specific id
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
          matches(RegExp(r'sealed class ChatScreenId \{\s*const ChatScreenId\(\);')),
          contains('final class AdChatId extends ChatScreenId'),
          contains('final class LoopChatId extends ChatScreenId'),
          contains('static ChatScreenId chatScreenId(BuildContext context)'),
          contains('ScreenScope.idOf<String>(context, _Screens.adChat)'),
          contains('ScreenScope.idOf<int>(context, _Screens.loopChat)'),
          isNot(contains('HomeScreenId')), // single-use widget: no union
        ]),
        spec: _sharedSpec,
      ));

  test('record id written directly is reconstructed (no typedef)', () =>
      _expectGenerated(
        allOf([
          contains('Screen<(String, String)>'),
          contains('goEditImage((String, String) id)'),
        ]),
        spec: _recordIdSpec,
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
