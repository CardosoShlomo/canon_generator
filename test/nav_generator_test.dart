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
  S links([Set<Object?> children = const {}]) => this as S;
  S link([Set<Object?> children = const {}]) => this as S;
  S query(Set<Object?> terms) => this as S;
  S fragment(Set<Object?> terms) => this as S;
}

mixin QueryKeyBase on Enum {
  Object? call(Object? codec) => null;
}

Object? slot(Object? codec) => null;
Object? slots(Set<Object?> codecs) => null;

class NavGraph<S> {
  NavGraph(Set<S> roots,
      {required S initial,
      required Object Function(S, Object?, Object?) pageOf});
}

class Codec<T> {
  const Codec();
  static const Codec<String> string = _StrCodec();
  static const Codec<String> uuid = _StrCodec();
  static const Codec<String> username = _StrCodec();
  static const Codec<int> integer = _IntCodec();
  static Codec<String> literal(String value) => const _StrCodec();
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

// home -> user, plus a `user.links({slot})` branch (link-world; generator-collected,
// kept out of the nav tree).
const _linksSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  user(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({user()}),
      user.links({slot(Codec.string)}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// Same shape, but the link slot is a UNION of two codecs → a sealed variant type.
const _unionSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  user(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({user()}),
      user.links({slots({Codec.uuid, Codec.username})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A union whose first branch is a fixed literal segment → a payload-less variant.
const _literalUnionSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  user(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({user()}),
      user.links({slots({Codec.literal('me'), Codec.uuid, Codec.username})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// The WIDGET form: a bare `slots` directly in a real placement's children. The
// screen's own id (uuid) is injected as a WidgetLink branch; me/username resolve.
const _widgetFormSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  user(0, Codec.uuid);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home(),
      user({slots({Codec.literal('me'), Codec.username})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A placement with view-state keys (query) → a typed `FeedView` handle.
const _viewSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum _Keys with QueryKeyBase { category, radius }

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0);

  const _Screens(this.widget);
  final Object widget;

  static final graph = NavGraph<_Screens>(
    {
      home(),
      feed().query({_Keys.category(Codec.string), _Keys.radius(Codec.integer)}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A link nested under a placement: the URL keeps the full path, the class is
// named by the LEAF screen (no `HomeAccount…` stutter).
const _nestedLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  account(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({account(), account.link({slot(Codec.string)})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A multi-placement screen (item under home AND feed) that declares view-state —
// every one of its placement navs must implement the screen's `View`.
const _multiViewSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum _Keys with QueryKeyBase { tag }

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0),
  item(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({item().query({_Keys.tag(Codec.string)})}),
      feed({item()}),
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

// A 3-deep inherit chain with an id-free intermediate (section): every ancestor
// ABOVE the id source (ad) can reach editAd with the one id; the intermediate is
// stamped null, the source and target with the id.
const _deepInheritSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  section(0),
  ad(0, Codec.string),
  editAd(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({section({ad({editAd.inherit(ad)})})})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A chain of inherited id-screens: itemPreview inherits item, editItem inherits
// itemPreview — all three share item's one id. From item's parent (home) you can
// reach either with that single id; the chain flattens to the ultimate source.
const _chainInheritSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  item(0, Codec.string),
  itemPreview(0, Codec.string),
  editItem(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({item({itemPreview({editItem.inherit(itemPreview)}).inherit(item)})})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// chatProfile inherits profile, but chat (its OWN id) sits between them. No
// single id can reach chatProfile from above chat (you'd need profile's AND
// chat's ids), so there is no goChatProfile(id) reach verb anywhere; at chat the
// id is already live, so it's the no-arg goChatProfile().
const _interposedIdSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  profile(0, Codec.string),
  chat(0, Codec.string),
  chatProfile(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({profile({chat({chatProfile.inherit(profile)})})})},
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

  test('inherit ancestor-reach: parent gets goEdit(id), pushing both levels', () =>
      _expectGenerated(
        allOf([
          contains('EditAdNav goEditAd(String id) {'), // on the ancestor handle (home)
          // edge-required source push — distinguishes this from the kick-start,
          // which pushes the source with a plain (non-edge) go.
          contains('_Screens.graph.go(_Screens.ad, id, true)'),
          contains('_Screens.graph.go(_Screens.editAd, id, true)'),
        ]),
        spec: _inheritSpec,
      ));

  test('inherit ancestor-reach reaches every ancestor above the source', () =>
      _expectGenerated(
        allOf([
          // direct parent of the source (section): push source + target.
          contains('EditAdNav goEditAd(String id) {\n'
              '    _Screens.graph.go(_Screens.ad, id, true);\n'
              '    _Screens.graph.go(_Screens.editAd, id, true);'),
          // two levels up (home): the id-free intermediate is stamped null.
          contains('EditAdNav goEditAd(String id) {\n'
              '    _Screens.graph.go(_Screens.section, null, true);\n'
              '    _Screens.graph.go(_Screens.ad, id, true);\n'
              '    _Screens.graph.go(_Screens.editAd, id, true);'),
        ]),
        spec: _deepInheritSpec,
      ));

  test('inherit chain: one id reaches every inherited screen in the chain', () =>
      _expectGenerated(
        allOf([
          // from item's parent: reach the mid-chain inherited screen with the id.
          contains('ItemPreviewNav goItemPreview(String id) {\n'
              '    _Screens.graph.go(_Screens.item, id, true);\n'
              '    _Screens.graph.go(_Screens.itemPreview, id, true);'),
          // ...and the end-of-chain one, the single id stamped at every level.
          contains('EditItemNav goEditItem(String id) {\n'
              '    _Screens.graph.go(_Screens.item, id, true);\n'
              '    _Screens.graph.go(_Screens.itemPreview, id, true);\n'
              '    _Screens.graph.go(_Screens.editItem, id, true);'),
        ]),
        spec: _chainInheritSpec,
      ));

  test('inherit blocked by an interposed id: no single-id reach, no-arg at chat', () =>
      _expectGenerated(
        allOf([
          // at chat the source id is live → no-arg verb reading it.
          contains('goChatProfile() {\n'
              '    _Screens.graph.go(_Screens.chatProfile, _idOf(_Screens.profile), true)'),
          // chat's id sits between profile and chatProfile → no single-id reach.
          isNot(contains('goChatProfile(String id)')),
        ]),
        spec: _interposedIdSpec,
      ));

  test('broad reach: a plain id screen is reachable through id-free intermediates', () =>
      _expectGenerated(
        // home reaches ad with just ad's id — section (id-free) is stamped null.
        contains('AdNav goAd(String id) {\n'
            '    _Screens.graph.go(_Screens.section, null, true);\n'
            '    _Screens.graph.go(_Screens.ad, id, true);'),
        spec: _deepInheritSpec,
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

  test('emits the Initial boot placement (no chain surface, no goInitial)', () =>
      _expectGenerated(
        allOf([
          // the boot placement: a plain AnyNav, matched via `Screen.at case Initial()`
          contains('final class Initial extends AnyNav'),
          contains('BootScreen.initial => const Initial._()'), // Screen.at maps it
          contains('BootScreen.initial: Screen<Never>._(BootScreen.initial)'), // of() safe
          // the old InitialScreen-chain mechanism is gone (name freed for the consumer)
          isNot(contains('sealed class InitialScreen')),
          isNot(contains('goInitial')),
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

  test('emits the typed ScreenEntry stack + navigations surface', () =>
      _expectGenerated(allOf([
        contains('sealed class ScreenEntry'),
        contains('final class ItemEntry extends ScreenEntry'),
        contains('final String id;'), // item carries a TYPED id (not Object?)
        contains('final class HomeEntry extends ScreenEntry'), // id-free variant
        contains('ScreenEntry _entryOf(Enum s, Object? id)'),
        contains('_Screens.item => ItemEntry(id as String)'), // cast at the seam
        contains('_Screens.home => const HomeEntry()'),
        contains('static NavStack<Screen<Object?>> get stack'),
        contains('static Stream<ScreenNavigation> get navigations'),
        contains('final class ScreenNavigation'),
        contains('ScreenEntry get destination'),
      ])));

  test('a .links branch generates the Link surface; nav stays intact', () =>
      _expectGenerated(
        allOf([
          contains('HomeEntry'), // home + user nav generation succeeded…
          contains('UserEntry'),
          isNot(contains('LinksEntry')), // …and .links added no phantom screen
          contains('sealed class Link'), // …and emitted the typed Link surface
          contains('sealed class WidgetlessLink extends Link'), // the families
          // single-slot endpoint → one concrete widgetless class, no marker
          contains('final class UserLink extends WidgetlessLink'),
          contains('final String value0'), // the slot's typed field
          contains('final class ParsedLink'), // …and the parse surface
          contains('ParsedLink? parseLink(String url)'),
          contains("'user/*' => UserLink(m.path[0] as String)"), // the typed map
          // …and toUri (no @Screens domain → domain is required)
          contains('String toUri(Link link, String domain)'),
          contains('case UserLink(:final value0):'),
          contains('encodeLink('),
          contains("'user/*'"),
          contains('<Object?>[value0]'),
          contains('<int>[0]'),
        ]),
        spec: _linksSpec,
      ));

  test('a union slot generates sibling Link classes under a per-entity marker', () =>
      _expectGenerated(
        allOf([
          contains('sealed class UserLink implements Link'), // the per-entity marker
          contains(
              'final class UserByUuidLink extends WidgetlessLink implements UserLink'),
          contains('class UserByNameLink'), // username → entity-prefix stripped → ByName
          contains('final String uuid;'), // semantic codec → field name
          contains('final String username;'),
          contains('switch (m.branches[0])'), // parse picks the branch…
          contains('0 => UserByUuidLink(m.path[0] as String)'),
          contains('1 => UserByNameLink(m.path[0] as String)'),
          contains('case UserByUuidLink(:final uuid):'), // …toUri per sibling
          contains('<Object?>[uuid]'),
        ]),
        spec: _unionSpec,
      ));

  test('a literal in a union slot becomes a payload-less widgetless sibling', () =>
      _expectGenerated(
        allOf([
          contains('sealed class UserLink implements Link'),
          contains(
              'final class UserMeLink extends WidgetlessLink implements UserLink'),
          contains('const UserMeLink();'), // payload-less, no field
          contains(
              'final class UserByUuidLink extends WidgetlessLink implements UserLink'),
          contains('0 => UserMeLink()'), // parse: branch 0 reads no path token
          contains('case UserMeLink():'), // encode: threads the literal back…
          contains("<Object?>['me']"),
        ]),
        spec: _literalUnionSpec,
      ));

  test('the widget form injects the screen id as a WidgetLink sibling', () =>
      _expectGenerated(
        allOf([
          contains('sealed class UserLink implements Link'),
          // injected id branch → WidgetLink, field `<screen>Id`, class `…ByIdLink`
          contains('final class UserByIdLink extends WidgetLink'),
          contains('final String userId;'),
          // declared branches stay widgetless
          contains('final class UserMeLink extends WidgetlessLink'),
          contains('class UserByNameLink'),
          contains('final String username;'),
          // order: literals → id → values  ⇒  me=0, uuid=1, username=2
          contains('0 => UserMeLink()'),
          contains('1 => UserByIdLink(m.path[0] as String)'),
          contains('2 => UserByNameLink(m.path[0] as String)'),
        ]),
        spec: _widgetFormSpec,
      ));

  test('a nested link is named by its leaf screen, path stays in the template',
      () => _expectGenerated(
            allOf([
              contains('final class AccountLink'), // leaf name, not HomeAccountLink
              isNot(contains('HomeAccountLink')),
              contains("'home/account/*' => AccountLink("), // full path in the URL
            ]),
            spec: _nestedLinkSpec,
          ));

  test('placement .query emits typed FeedQuery (read) + FeedQueryMut (write)', () =>
      _expectGenerated(
        allOf([
          contains('FeedNav'), // nav generation still succeeded…
          contains('class FeedQuery {'), // read model
          contains('String? get category =>'),
          contains('int? get radius =>'),
          contains('final class FeedQueryMut extends FeedQuery'), // mutable subtype
          contains('set category(String? v) =>'),
          contains("viewSet(_Screens.feed, 'category', v)"),
          // …and the nav implements the read-only view, exposing the MUTABLE getter
          contains('abstract interface class FeedView'),
          contains('FeedQuery get query;'),
          contains('implements FeedView'),
          contains('FeedQueryMut get query => const FeedQueryMut._();'),
        ]),
        spec: _viewSpec,
      ));

  test('a multi-placement view-state screen: every placement nav is its View', () =>
      _expectGenerated(
        allOf([
          contains('abstract interface class ItemView'),
          contains('class ItemQuery'),
          contains('String? get tag =>'),
          contains('implements ItemView'), // the placement navs implement it
          contains('ItemQueryMut get query'), // …with the mutable getter
        ]),
        spec: _multiViewSpec,
      ));

  test('emits the URL-driven routerConfig host', () => _expectGenerated(allOf([
        contains('static RouterConfig<Object> get routerConfig'),
        contains('routeInformationParser: const CanonRouteParser()'),
        contains('routerDelegate: _Screens.graph.delegate'),
      ])));

  test('emits the Screen.replace redirect facade', () => _expectGenerated(allOf([
        contains('static const replace = Replace._();'),
        contains('final class Replace {'),
        contains('graph.markReplace();'), // each verb flags replace…
        contains('return Screen.go'), // …then delegates to the normal commit
      ])));

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

  test('Screen.go(Hop) returns a KickstartNav union narrowable via .at', () =>
      _expectGenerated(allOf([
        contains('sealed class KickstartPlacement {}'),
        contains('final class KickstartNav extends AnyNav'),
        contains('static KickstartNav go<N extends AnyNav>(Hop<N> hop)'),
        contains('return const KickstartNav._();'),
        contains('KickstartPlacement get at => Screen.at as KickstartPlacement'),
        // kick-startable navs implement the marker
        matches(RegExp(r'implements[^{\n]*KickstartPlacement')),
      ])));

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
        contains('_Screens.graph.observe((f, t) => fn(forSpec(f), forSpec(t)))'),
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
