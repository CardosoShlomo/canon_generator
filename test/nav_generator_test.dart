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
  S inherit(S a, [S? b, S? c]) => this as S;
  S links([Set<Object?> children = const {}]) => this as S;
  S link([Set<Object?> children = const {}]) => this as S;
  S query(Set<Object?> terms) => this as S;
  S fragment(Set<Object?> terms) => this as S;
}

mixin QueryKeyBase on Enum {
  QueryTerm call(Object? codec) => const QueryTerm();
}

class QueryTerm {
  const QueryTerm();
  QueryTerm operator &(QueryTerm other) => this;
  QueryTerm operator |(QueryTerm other) => this;
}

extension CodecUnion<T> on Codec<T> {
  Codec<T> operator |(Codec<T> other) => this;
}

Object? slot(Object? codec) => null;

class NavGraph<S> {
  NavGraph(Set<S> roots,
      {required S initial,
      required Object Function(S, Object?, Object?) pageOf});
}

class Codec<T> {
  const Codec();
  T? decode(String token) => null;
  String encode(T value) => '';
  static const Codec<String> string = _StrCodec();
  static const Codec<String> uuid = _StrCodec();
  static const Codec<String> username = _StrCodec();
  static const Codec<int> integer = _IntCodec();
  static Codec<String> literal(String value) => const _StrCodec();
}
class _StrCodec extends Codec<String> { const _StrCodec(); }
class _IntCodec extends Codec<int> { const _IntCodec(); }
class Record2Codec<A, B> extends Codec<(A, B)> {
  const Record2Codec(this.a, this.b, [this.sep = '~']);
  final Codec<A> a;
  final Codec<B> b;
  final String sep;
}

mixin IdNode on Enum implements Codec<Object?> {
  Codec get codec;
  Object? decode(String token) => codec.decode(token);
  String encode(Object? value) => codec.encode(value);
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
      home({user}),
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
      home({user}),
      user.links({slot(Codec.uuid | Codec.username)}),
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
      home({user}),
      user.links({slot(Codec.literal('me') | Codec.uuid | Codec.username)}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// The WIDGET form: a bare `slots` directly in a real placement's children. The
// screen's own id (uuid) is injected as a Place branch; me/username resolve.
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
      home,
      user({slot(Codec.literal('me') | Codec.username)}),
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
      home,
      feed.query({_Keys.category(Codec.string), _Keys.radius(Codec.integer)}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// Same union as _unionSpec, but spelled with the `|` codec operator inside a
// single `slot` — proving `slot(a | b)` collapses what `slots({a, b})` did.
const _slotUnionOpSpec = '''
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
      home({user}),
      user.links({slot(Codec.uuid | Codec.username)}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// Query view-state in the codec algebra: `a & (b | c)`. `&`=allOf, `|`=oneOf,
// the brackets override `&`-tighter-than-`|` precedence; the flattened view keys
// are the same three regardless of grouping.
const _viewOpSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum _Keys with QueryKeyBase { category, radius, size }
enum _Frag with QueryKeyBase { tab, pane }

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0);

  const _Screens(this.widget);
  final Object widget;

  static final graph = NavGraph<_Screens>(
    {
      home,
      feed.query({_Keys.category(Codec.string) & (_Keys.radius(Codec.integer) | _Keys.size(Codec.integer))})
          .fragment({_Frag.tab(Codec.string) | _Frag.pane(Codec.string)}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A screen with BOTH query and fragment view-state → the link chain stages them
// (`.query…` then `.fragment…`; fragment is terminal).
const _viewBothSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum _Q with QueryKeyBase { category }
enum _F with QueryKeyBase { tab }

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0);

  const _Screens(this.widget);
  final Object widget;

  static final graph = NavGraph<_Screens>(
    {
      home,
      feed.query({_Q.category(Codec.string)}).fragment({_F.tab(Codec.string)}),
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
  profile(0),
  account(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      // `account` is link-only under home (a widgetless branch point — its id is
      // ignored), and a real screen under profile (so it has a nav placement).
      home({account.link({slot(Codec.string)})}),
      profile({account}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// The SAME leaf screen linked under two parents → its minimal address (`account`)
// is ambiguous, so the Link chain keeps the disambiguating full path.
const _ambiguousLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  profile(0),
  settings(0),
  account(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      // `account` is link-only under BOTH home and profile (two endpoints with
      // the same leaf → ambiguous minimal address), plus a screen under settings.
      home({account.link({slot(Codec.string)})}),
      profile({account.link({slot(Codec.uuid)})}),
      settings({account}),
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
      home({item.query({_Keys.tag(Codec.string)})}),
      feed({item}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// An empty call `user()` for a childless leaf — needless; the bare `user` says
// it. The call form's set is required and must be non-empty → throw.
const _emptyCallSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  user(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({user()}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// `account` beside `account.link(...)` in one set — the widget form written
// the long way (a node is a screen XOR a link branch at one position) → throw.
const _redundantLinkSpec = '''
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
      home({account, account.link({slot(Codec.string)})}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// home/account/* is a widgetless-only `.link`; settings/detail/* a mixed widget
// form (renderable id + a username resolver). Exercises Place subtree prune.
const _probeSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  account(0, Codec.string),
  settings(0),
  detail(0, Codec.uuid);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({account({slot(Codec.string)})}),
      settings({detail({slot(Codec.username)})}),
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
    {home, feed},
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

// COMPOSITE inherit: chat's record id (String, int) is sourced component-by-
// component from two ancestors — the String from ad, the int from user. Both
// components inherited → the chained verb shrinks to no args.
const _compositeSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  ad(0, Codec.string),
  user(0, Codec.integer),
  chat(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({ad({user({chat.inherit(ad, user)})})})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// PARTIAL composite: only the String component is inherited (from ad); the int
// component has no matching ancestor, so it stays a required arg on the verb.
const _compositePartialSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  ad(0, Codec.string),
  chat(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({ad({chat.inherit(ad)})})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A composite-id screen with NO inherit: the verb takes the ATOMIC record id,
// never the destructured components.
const _compositeNoneSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  chat(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({chat})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// ARITY OVERFLOW: 3 inherit sources but a 2-component id → a build error.
const _compositeOverflowSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  a(0, Codec.string),
  b(0, Codec.integer),
  c(0, Codec.string),
  chat(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({a({b({c({chat.inherit(a, b, c)})})})})},
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

// A spec that must FAIL generation: source_gen logs the InvalidGenerationSource
// error (severe) rather than rethrowing, so assert the captured log mentions
// [needle] and that NO output file is written.
Future<void> _expectBuildError(String spec, String needle) async {
  final logs = <String>[];
  await testBuilder(
    navBuilder(BuilderOptions.empty),
    {
      'canon|lib/src/screens_annotation.dart': _annotation,
      'canon|lib/canon.dart': _canonStub,
      'pkg|lib/spec.dart': spec,
    },
    rootPackage: 'pkg',
    generateFor: {'pkg|lib/spec.dart'},
    outputs: const {},
    onLog: (r) => logs.add('${r.message}${r.error ?? ''}'),
  );
  expect(logs.any((l) => l.contains(needle)), isTrue,
      reason: 'no build error mentioning "$needle"; logs: $logs');
}

// A screen binds an @ids NODE (`id: .user`) instead of a Codec directly. The
// node IS-A Codec (erased to Object?) but carries Codec.uuid (Codec<String>) in
// its `codec` field — the generator must unwrap that to the SPECIFIC type.
const _idsNodeSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum Ids with IdNode {
  user(Codec.uuid);
  const Ids(this.codec);
  @override
  final Codec codec;
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  profile(0, Ids.user);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({profile}),
    },
    initial: home,
    pageOf: (s, c, k) => 0,
  );
}
''';

void main() {
  test('screen bound to an @ids node uses the node codec specific id type',
      () => _expectGenerated(
            allOf([
              // unwrapped Codec.uuid -> String, not the erased node Object?
              contains('static const profile = Screen<String>._(_Screens.profile);'),
              isNot(contains('profile = Screen<Object?>')),
            ]),
            spec: _idsNodeSpec,
          ));

  test('composite inherit: both components inherited -> no-arg verb', () =>
      _expectGenerated(
        allOf([
          contains('ChatNav goChat() {'), // both components inherited -> no args
          contains('_Screens.graph.go(_Screens.chat, ('),
          contains('_idOf(_Screens.ad)'),
          contains('_idOf(_Screens.user)'),
          contains('Object? _idOf(Enum s)'),
        ]),
        spec: _compositeSpec,
      ));

  test('composite inherit: partial -> verb requires only the missing component',
      () => _expectGenerated(
            allOf([
              contains('ChatNav goChat(int id) {'),
              contains(
                  '_Screens.graph.go(_Screens.chat, (_idOf(_Screens.ad), id), true)'),
              isNot(contains('goChat((String, int) id)')),
            ]),
            spec: _compositePartialSpec,
          ));

  test('composite id with no inherit: verb takes the atomic record id', () =>
      _expectGenerated(
        allOf([
          contains('goChat((String, int) id)'),
          isNot(contains('goChat(String')), // never destructured
        ]),
        spec: _compositeNoneSpec,
      ));

  test('composite inherit: arity overflow is a build error', () =>
      _expectBuildError(_compositeOverflowSpec, 'id component'));

  test('single-arg inherit output is unchanged (regression)', () =>
      _expectGenerated(
        allOf([
          contains('EditAdNav goEditAd() {'),
          contains(
              '_Screens.graph.go(_Screens.editAd, _idOf(_Screens.ad), true)'),
          isNot(contains('goEditAd(String id) {\n'
              '    _Screens.graph.go(_Screens.editAd')), // still the no-arg edge
        ]),
        spec: _inheritSpec,
      ));

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
          // Not in the single-go Hop KICK-START class (needs the multi-step chain);
          // it IS navigable as a chain-carrying Place Hop, which is fine.
          isNot(contains('Hop<EditAdNav>._(')),
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
          contains('goChatProfile()'),
          contains('_Screens.graph.go(_Screens.chatProfile, _idOf(_Screens.profile), true)'),
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

  test('emits the Initial boot placement (no chain surface, no goRoot)', () =>
      _expectGenerated(
        allOf([
          // the boot placement, matched via `Screen.current case Initial()`
          contains('final class Root extends AnyPlacement'),
          contains('BootScreen.root => const Root._()'), // _atOf maps it
          contains('BootScreen.root: Screen<Never>._(BootScreen.root)'), // of() safe
          // the old InitialScreen-chain mechanism is gone (name freed for the consumer)
          isNot(contains('sealed class RootScreen')),
          isNot(contains('goRoot')),
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
        // Screen.current is the sealed AnyPlacement → exhaustive switch. Placements
        // EXTEND it (so cross-screen ternaries LUB to AnyPlacement, not AnyNav).
        contains('sealed class AnyPlacement extends AnyNav'),
        contains('static AnyPlacement get current'),
        matches(RegExp(r'class \w+ extends AnyPlacement')),
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
          contains('sealed class Url'), // …and emitted the typed Link surface
          contains('sealed class Link extends Url'), // the families
          // single-slot endpoint → one concrete widgetless class, no marker
          contains('final class UserLink extends Link'),
          contains('final String value0'), // the slot's typed field
          isNot(contains('class ParsedUrl')), // parse returns a Url directly now
          contains('Url? parseUrl(String url)'),
          contains('final String? domain;'), // the inbound origin rides on Url
          contains("'user/*' => UserLink(m.path[0] as String, origin)"), // typed map + origin
          // …and an instance toUri per class (no @Screens domain → domain required)
          contains('Uri toUri(String domain);'), // base declares it abstract
          contains('Uri toUri(String domain) => Uri.parse('), // each class implements
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
          contains('sealed class UserLink implements Url'), // the per-entity marker
          contains(
              'final class UserByUuidLink extends Link implements UserLink'),
          contains('class UserByNameLink'), // username → entity-prefix stripped → ByName
          contains('final String uuid;'), // semantic codec → field name
          contains('final String username;'),
          contains('switch (m.branches[0])'), // parse picks the branch…
          contains('0 => UserByUuidLink(m.path[0] as String, origin)'),
          contains('1 => UserByNameLink(m.path[0] as String, origin)'),
          contains('Uri toUri(String domain) =>'), // …an instance toUri per sibling
          contains('<Object?>[uuid]'),
        ]),
        spec: _unionSpec,
      ));

  test('slot(a | b) is the same union as slots({a, b})', () =>
      _expectGenerated(
        allOf([
          contains('sealed class UserLink implements Url'),
          contains(
              'final class UserByUuidLink extends Link implements UserLink'),
          contains('class UserByNameLink'),
          contains('0 => UserByUuidLink(m.path[0] as String, origin)'),
          contains('1 => UserByNameLink(m.path[0] as String, origin)'),
        ]),
        spec: _slotUnionOpSpec,
      ));

  test('query & fragment use the same `&`/`|` algebra (brackets ok), keys flow',
      () => _expectGenerated(
            allOf([
              contains('FeedQuery'), // the view model emitted — no parse error
              contains('category'),
              contains('radius'),
              contains('size'), // the bracketed `(radius | size)` branch survived
              contains('FeedFragment'), // fragment uses operators identically
              contains('tab'),
              contains('pane'), // the `tab | pane` oneOf fragment survived
            ]),
            spec: _viewOpSpec,
          ));

  test('a literal in a union slot becomes a payload-less widgetless sibling', () =>
      _expectGenerated(
        allOf([
          contains('sealed class UserLink implements Url'),
          contains(
              'final class UserMeLink extends Link implements UserLink'),
          contains('const UserMeLink([super.domain]);'), // payload-less, no field
          contains(
              'final class UserByUuidLink extends Link implements UserLink'),
          contains('0 => UserMeLink(origin)'), // parse: branch 0 reads no path token
          contains("<Object?>['me']"), // encode threads the literal back in toUri
        ]),
        spec: _literalUnionSpec,
      ));

  test('the widget form injects the screen id as a Place sibling', () =>
      _expectGenerated(
        allOf([
          contains('sealed class UserLink implements Url'),
          // injected id branch → Place, field `<screen>Id`, class `…ByIdLink`
          contains('final class UserByIdLink extends Place'),
          contains('final String userId;'),
          // declared branches stay widgetless
          contains('final class UserMeLink extends Link'),
          contains('class UserByNameLink'),
          contains('final String username;'),
          // order: the canonical id leads, declared resolvers follow ⇒
          // userId=0, me=1, username=2
          contains('0 => UserByIdLink(m.path[0] as String, origin)'),
          contains('1 => UserMeLink(origin)'),
          contains('2 => UserByNameLink(m.path[0] as String, origin)'),
        ]),
        spec: _widgetFormSpec,
      ));

  test('Link.<route> is the superset; a name clash resolves to the nav target',
      () => _expectGenerated(
            allOf([
              // Link carries the nav-tree roots…
              contains('static _WLHome get home =>'),
              // …and `user` (a nav root with widget-form resolvers) clashes with
              // its own widgetless leaf — the nav-target METHOD wins on Link
              contains('static _WLUser user(String id) =>'),
              // the widgetless resolvers stay reachable via Link.user
              contains('static _LXUser get user =>'),
              contains("me() => _LXUserSlot([..._p, 'me'], [..._b, 1]);"),
              contains('byName(String username) =>'),
              // the leaf step builds its URL off the accumulators
              contains("_Screens.graph.encodeLink(domain, 'user/*', _p, _b)"),
            ]),
            spec: _widgetFormSpec,
          ));

  test('the Place surface emits even with no `.link` declared', () =>
      _expectGenerated(
        allOf([
          // `_spec` declares no link at all, yet every screen is a deep link
          contains('sealed class Place extends Url'),
          contains('static _WLHome get home =>'),
          contains('_WLHomeItem item(String id) =>'),
          contains('_Screens.graph.encodeNavUrl('),
          // `item` sits under home alone → a direct kick-start static jumps to it
          contains('static _WLHomeItem item(String id) =>\n'
              '      _WLHomeItem._([_Screens.home, _Screens.item], [null, id]);'),
        ]),
        spec: _spec,
      ));

  test('a view-state screen takes an On-shape build term set on its link',
      () => _expectGenerated(
            allOf([
              // `.query({…})` takes a dot-shorthand build-term set (no .not)
              contains('_WLFeedQ query(Set<FeedQueryArg> q) =>'),
              contains('class _WLFeedQ {'),
              // the build vocabulary mirrors the match `Cond` set, ASSIGNING
              contains('final class FeedQueryArg {'),
              contains("static FeedQueryArg category(String v) => "
                  "FeedQueryArg._('category', v);"),
              contains("static FeedQueryArg radius(int v) =>"),
              // the set collapses to a map; the terminal builds the URL with it
              contains('{for (final t in q) t.key: t.value}'),
              contains('encodeNavUrl(domain, _s, _i, _q, _f)'),
            ]),
            spec: _viewSpec,
          ));

  test('query and fragment are staged: query→fragment, fragment is terminal', () =>
      _expectGenerated(
        allOf([
          // the screen step opens either stage (fragment without a query first)
          contains('_WLFeedQ query(Set<FeedQueryArg> q) =>'),
          contains('_WLFeedF fragment(Set<FeedFragmentArg> f) =>'),
          // the query stage transitions INTO fragment…
          contains('class _WLFeedQ {'),
          contains('  _WLFeedF fragment(Set<FeedFragmentArg> f) =>'),
          // …and the fragment stage is terminal — a build + toUri, no way back
          contains('class _WLFeedF {'),
          // (no `query(Set` inside _WLFeedF — it has only toUri)
        ]),
        spec: _viewBothSpec,
      ));

  test('Place mirrors the nav tree root-down (id screens are methods)',
      () => _expectGenerated(
            allOf([
              contains('sealed class Place extends Url'),
              // id-free root → a getter; id-bearing root → a method (id mandatory
              // before `.toUri()`, no bare `.user`)
              contains('static _WLHome get home => _WLHome._([_Screens.home]'),
              contains('static _WLUser user(String id) =>'),
              isNot(contains('static _WLUser get user')),
              contains('final class _WLUser implements Hop<'),
              // every nav-target node prints its full path via the nav-mirror
              contains('_Screens.graph.encodeNavUrl('),
              // the widgetless resolver branches (me/username) live on the
              // SEPARATE Link surface, not the Place nav tree
              contains('static _LXUser get user =>'),
              contains("me() => _LXUserSlot([..._p, 'me']"),
              isNot(contains('me() => _WL')),
            ]),
            spec: _widgetFormSpec,
          ));

  test('an empty call `user()` is rejected (write the bare leaf)', () async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'canon|lib/src/screens_annotation.dart': _annotation,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': _emptyCallSpec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      onLog: (r) => logs.add(r.message),
    );
    expect(logs.join('\n'), contains('has an empty call'));
  });

  test('`X()` beside `X.link(...)` in one set is rejected (redundant)', () async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'canon|lib/src/screens_annotation.dart': _annotation,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': _redundantLinkSpec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      onLog: (r) => logs.add(r.message),
    );
    expect(logs.join('\n'),
        contains('both as a placement and a `.link` branch in the same set'));
  });

  test('Place nav tree spans nav screens; link branches stay widgetless',
      () => _expectGenerated(
        allOf([
          // the nav tree, root-down: a nested id-bearing screen is a method
          contains('static _WLHome get home =>'),
          contains('_WLHomeAccount account(String id) =>'),
          contains('static _WLSettings get settings =>'),
          contains('_WLSettingsDetail detail(String id) =>'),
          // `account.link` is a link branch, NOT a nav child → its widgetless
          // resolver stays on the Link surface, off the nav tree, and
          // smart-addressed by its leaf (the redundant `home` parent dropped)
          contains('static _LXAccount get account =>'),
          isNot(contains('static _LXHome get home =>')),
          isNot(contains('account(String id) => _LX')),
        ]),
        spec: _probeSpec,
      ));

  test('Link drops a redundant static parent (smart minimal address)',
      () => _expectGenerated(
            allOf([
              // `home/account/*` resolve-link is reachable as `.account`, the
              // redundant `home` parent dropped; the URL still uses the full path
              contains('static _LXAccount get account =>'),
              isNot(contains('static _LXHome get home =>')),
              contains("encodeLink(domain, 'home/account/*'"),
            ]),
            spec: _nestedLinkSpec,
          ));

  test('Link keeps the full path when the leaf is ambiguous', () =>
      _expectGenerated(
        allOf([
          // `account` is linked under home AND profile → minimal address clashes,
          // so both keep their disambiguating parent
          contains('static _LXHome get home =>'),
          contains('static _LXProfile get profile =>'),
          contains('class _LXHomeAccount {'),
          contains('class _LXProfileAccount {'),
          isNot(contains('static _LXAccount get account =>')),
        ]),
        spec: _ambiguousLinkSpec,
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
          contains('FeedView'), // the nav implements the read-only view
          contains('FeedQueryMut get query => const FeedQueryMut._();'),
          // …and the conditioned selector: a FeedQueryCond vocabulary + On.query
          contains('class FeedQueryCond<T> implements ViewCond'),
          contains('static FeedQueryCond<String> get category =>'), // present getter
          contains('FeedQueryCond<T> call(T v) =>'), // narrow to equals
          contains('presence: true'), // the present/absent path
          contains('class FeedQueryNot'), // the .not mirror
          contains('OnFeed query(Set<FeedQueryCond> cs) =>'),
          // …evaluated by Screen.on against the live view store
          contains('if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) return null;'),
          // the selector carries the typed read-only view, so context.on returns it
          contains('OnFeed extends On<FeedNav, FeedView>'),
          contains('V? on<N extends AnyNav, V>(On<N, V> sel)'), // typed reactive read
        ]),
        spec: _viewSpec,
      ));

  test('a multi-placement view-state screen: every placement nav is its View', () =>
      _expectGenerated(
        allOf([
          contains('abstract interface class ItemView'),
          contains('class ItemQuery'),
          contains('String? get tag =>'),
          matches(RegExp(r'implements[^{]*ItemView')), // placement navs implement it
          contains('ItemQueryMut get query'), // …with the mutable getter
          contains('OnItem extends On<ItemPlacement, ItemView>'), // typed selector
        ]),
        spec: _multiViewSpec,
      ));

  test('emits the single RouterDelegate host as Screen.manager',
      () => _expectGenerated(allOf([
            contains('static NavDelegate get manager'),
            contains('return _Screens.graph.delegate;'),
            isNot(contains('get routerConfig')),
            isNot(contains('static Widget manager(')),
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

  test('Screen.go(Hop) returns the Hop\'s typed nav (N), not a union', () =>
      _expectGenerated(allOf([
        contains('static N go<N extends AnyNav>(Hop<N> hop)'),
        contains('return hop.nav;'),
        // the old KickstartNav narrowing surface is gone
        isNot(contains('KickstartNav')),
        isNot(contains('KickstartPlacement')),
      ])));

  test('emits the global canPop / Screen.pop sugar surface', () =>
      _expectGenerated(allOf([
        contains('sealed class PopDestPlacement {}'),
        contains('final class CanPopNav extends AnyNav'),
        contains('static CanPopNav? get canPop'),
        contains('currentChain.length > 1'), // null at root
        // pop() returns the sealed destination placement
        contains('static PopDestPlacement? pop() => canPop?.pop()'),
        contains('PopDestPlacement pop()'), // CanPopNav executes the guaranteed pop
        contains('PopDestPlacement _resolvePopDest()'),
      ])));

  test('drops the old observe() forwarder — navigations replaces it', () =>
      _expectGenerated(allOf(
        isNot(contains('static void Function() observe(')),
        contains('static Stream<ScreenNavigation> get navigations'),
      )));

  test('emits the Screen.resolver setter + eager initialUrl (links present)',
      () => _expectGenerated(
            allOf(
              contains('static set resolver(void Function(Url? url) fn) =>'),
              contains('graph.setResolver((url) => fn(parseUrl(url)))'),
              contains('get rootUrl'),
              contains('platformDispatcher.defaultRouteName'),
            ),
            spec: _linksSpec,
          ));

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

  test('cycle bare-pop returns the sealed predecessor placement directly', () =>
      _expectGenerated(allOf(
        contains('sealed class AboutHomePopPlacement {}'),
        // pop() returns the resolved sealed predecessor placement
        contains('AboutHomePopPlacement _resolveAboutHomePopPlacement()'),
        contains('AboutHomePopPlacement pop()'), // item pops into the sealed union
        // predecessors implement the marker -> exhaustive switch(x.pop())
        matches(RegExp(r'class HomeNav extends AnyPlacement\s+implements[^{]*AboutHomePopPlacement')),
        matches(RegExp(r'class AboutNav extends AnyPlacement\s+implements[^{]*AboutHomePopPlacement')),
      )));
}
