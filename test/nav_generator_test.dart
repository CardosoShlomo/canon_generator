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
  NavGraph(Set<S> roots);
}

class Codec<T> {
  const Codec();
  T? decode(String token) => null;
  String encode(T value) => '';
  static const Codec<String> string = _StrCodec();
  static const Codec<String> uuid = _StrCodec();
  static const Codec<String> username = _StrCodec();
  static const Codec<int> integer = _IntCodec();
  // custom-named codec — its link value type must come from the analyzer,
  // not the battery name table.
  static const Codec<int> sku = _IntCodec();
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

abstract mixin class IdNode implements Codec<Object?> {
  const IdNode();
  Codec get codec;
  Object? decode(String token) => codec.decode(token);
  String encode(Object? value) => codec.encode(value);
  const factory IdNode.compose(IdNode n1, IdNode n2, [IdNode? n3, IdNode? n4]) =
      CompositeId;
}
class CompositeId with IdNode {
  const CompositeId(this.n1, this.n2, [this.n3, this.n4]);
  final IdNode n1, n2;
  final IdNode? n3, n4;
  @override
  Codec get codec => Record2Codec(n1.codec, n2.codec);
}
class IDs { const IDs(); }
mixin Identifiable<I> {
  I get id;
}
''';

// home -> item(String) -> about -> item.again  (item & about form a cycle).
const _spec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
      home({item({about({item.again})})}),
    },
  );
}
''';

// home -> author, plus a `author.links({slot})` branch (link-world; generator-collected,
// kept out of the nav tree).
const _linksSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({author}),
      author.links({slot(Codec.string)}),
    },
  );
}
''';

// Same shape, but the link slot is a UNION of two codecs → a sealed variant type.
const _unionSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({author}),
      author.links({slot(Codec.uuid | Codec.username)}),
    },
  );
}
''';

// A union whose first branch is a fixed literal segment → a payload-less variant.
const _literalUnionSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({author}),
      author.links({slot(Codec.literal('me') | Codec.uuid | Codec.username)}),
    },
  );
}
''';

// The WIDGET form: a bare `slots` directly in a real placement's children. The
// screen's own id (uuid) is injected as a Place branch; me/username resolve.
const _widgetFormSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, Codec.uuid);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home,
      author({slot(Codec.literal('me') | Codec.username)}),
    },
  );
}
''';

// A placement with view-state keys (query) → a typed `FeedView` handle.
const _viewSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// Same union as _unionSpec, but spelled with the `|` codec operator inside a
// single `slot` — proving `slot(a | b)` collapses what `slots({a, b})` did.
const _slotUnionOpSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({author}),
      author.links({slot(Codec.uuid | Codec.username)}),
    },
  );
}
''';

// Query view-state in the codec algebra: `a & (b | c)`. `&`=allOf, `|`=oneOf,
// the brackets override `&`-tighter-than-`|` precedence; the flattened view keys
// are the same three regardless of grouping.
const _viewOpSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// A link nested under a placement: the URL keeps the full path, the class is
// named by the LEAF screen (no `HomeAccount…` stutter).
const _nestedLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// The SAME leaf screen linked under two parents → its minimal address (`account`)
// is ambiguous, so the Link chain keeps the disambiguating full path.
const _ambiguousLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// A multi-placement screen (item under home AND feed) that declares view-state —
// every one of its placement navs must implement the screen's `View`.
const _multiViewSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// An empty call `author()` for a childless leaf — needless; the bare `author` says
// it. The call form's set is required and must be non-empty → throw.
const _emptyCallSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({author()}),
    },
  );
}
''';

// `account` beside `account.link(...)` in one set — the widget form written
// the long way (a node is a screen XOR a link branch at one position) → throw.
const _redundantLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// home/account/* is a widgetless-only `.link`; settings/detail/* a mixed widget
// form (renderable id + a username resolver). Exercises Place subtree prune.
const _probeSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
      outputs: {'pkg|lib/spec.canon.dart': decodedMatches(content)},
    );

// A flat tree — every screen is a root, nothing can ever be popped.
const _flatSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home, feed},
  );
}
''';

// id types written as sample VALUES (no Type literals, no typedef): a record
// value `('', '')` -> (String, String), and a plain `0` -> int. Needs `Object? id`.
const _recordIdSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// editProduct inherits its product parent's id: the chained push verb takes no id and
// reads the live ancestor id instead.
const _inheritSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  product(0, Codec.string),
  editProduct(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({product({editProduct.inherit(product)})})},
  );
}
''';

// A 3-deep inherit chain with an id-free intermediate (section): every ancestor
// ABOVE the id source (product) can reach editProduct with the one id; the intermediate is
// stamped null, the source and target with the id.
const _deepInheritSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  section(0),
  product(0, Codec.string),
  editProduct(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({section({product({editProduct.inherit(product)})})})},
  );
}
''';

// orderProfile inherits profile, but order (its OWN id) sits between them; at
// order the id is already live, so it's the no-arg goOrderProfile().
const _interposedIdSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  profile(0, Codec.string),
  order(0, Codec.string),
  orderProfile(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({profile({order({orderProfile.inherit(profile)})})})},
  );
}
''';

// item sits under TWO parents (home & feed) -> ambiguous -> gets parentOf.
// editItem sits under one parent (item) -> nameable -> no parentOf entry.
const _parentOfSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

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
  );
}
''';

// COMPOSITE inherit: order's record id (String, int) is sourced component-by-
// component from two ancestors — the String from product, the int from author. Both
// components inherited → the chained verb shrinks to no args.
const _compositeSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  product(0, Codec.string),
  author(0, Codec.integer),
  order(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({product({author({order.inherit(product, author)})})})},
  );
}
''';

// PARTIAL composite: only the String component is inherited (from product); the int
// component has no matching ancestor, so it stays a required arg on the verb.
const _compositePartialSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  product(0, Codec.string),
  order(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({product({order.inherit(product)})})},
  );
}
''';

// The same partial composite, with product seated at TWO positions: the shared
// ProductPlacement interface must declare the verb the leaves actually
// implement — the shrunk component, never the whole record.
const _compositePartialTwicespec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  shop(0),
  product(0, Codec.string),
  order(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static _Screens _prod() => product({order.inherit(product)});

  static final graph = NavGraph<_Screens>(
    {home({_prod()}), shop({_prod()})},
  );
}
''';

// A composite-id screen with NO inherit: the verb takes the ATOMIC record id,
// never the destructured components.
const _compositeNoneSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  order(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({order})},
  );
}
''';

// ARITY OVERFLOW: 3 inherit sources but a 2-component id → a build error.
const _compositeOverflowSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  a(0, Codec.string),
  b(0, Codec.integer),
  c(0, Codec.string),
  order(0, Record2Codec(Codec.string, Codec.integer));

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home({a({b({c({order.inherit(a, b, c)})})})})},
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
  expect(
    logs.any((l) => l.contains(needle)),
    isTrue,
    reason: 'no build error mentioning "$needle"; logs: $logs',
  );
}

// A screen binds an @ids NODE (`id: .author`) instead of a Codec directly. The
// node IS-A Codec (erased to Object?) but carries Codec.uuid (Codec<String>) in
// its `codec` field — the generator must unwrap that to the SPECIFIC type.
const _idsNodeSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  author(Codec.uuid);
  const Ids(this.codec);
  @override
  final Codec codec;
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  profile(0, Ids.author);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({profile}),
    },
  );
}
''';

// A `review` is keyed by a COMPOSITE node (product, author); `author` (keyed by
// the `author` node) inherits ONE component out of it — matched by node identity,
// not type (both components are String, so only the node disambiguates).
const _projectionSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  product(Codec.uuid),
  author(Codec.username);
  const Ids(this.codec);
  @override
  final Codec codec;
  static const IdNode review = .compose(product, author);
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, Ids.author),
  review(0, Ids.review);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({review({author.inherit(review)})}),
    },
  );
}
''';

// Same projection, but the composite is a ROW of the @ids enum itself
// (`review.compose(product, author)`) — codec is a getter over a `_codec`
// backing field, so the generator must read `_codec`/`n*` on enum rows.
// A projection UNDER an inherited composite: `review.inherit(product)` gives
// the review placement its own source, and `author.inherit(review)` must
// anchor at the COMPOSITE — the tree reader once eagerly flattened it to
// `product`, silently wiring the WRONG id (a productId as the author's id;
// with untyped Strings this passed the guard and shipped).
const _nestedProjectionSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@IDs()
enum Ids with IdNode {
  product(Codec.uuid),
  author(Codec.username),
  review.compose(product, author);

  const Ids(Codec this._codec) : n1 = null, n2 = null;
  const Ids.compose(IdNode this.n1, IdNode this.n2) : _codec = null;

  final Codec? _codec;
  final IdNode? n1, n2;

  @override
  Codec get codec => _codec ?? Record2Codec(n1!.codec, n2!.codec);
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  product(0, .product),
  author(0, .author),
  review(0, .review);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Ids? id;

  static final graph = NavGraph<_Screens>(
    {
      home({
        product({
          review.inherit(product)({author.inherit(review)}),
        }),
      }),
    },
  );
}
''';

const _rowCompositeSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  product(Codec.uuid),
  author(Codec.username),
  review.compose(product, author);

  const Ids(Codec this._codec) : n1 = null, n2 = null;
  const Ids.compose(IdNode this.n1, IdNode this.n2) : _codec = null;

  final Codec? _codec;
  final IdNode? n1, n2;

  @override
  Codec get codec => _codec ?? Record2Codec(n1!.codec, n2!.codec);
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, .author),
  review(0, .review);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Ids? id;

  static final graph = NavGraph<_Screens>(
    {
      home({review({author.inherit(review)})}),
    },
  );
}
''';

// author is a DIRECT child of catalog AND an inheriting grandchild (via reply),
// and author↔reply is a mutual-inherit cycle with author multi-placement — the
// shape that once emitted duplicate chain members and a phantom `AuthorNav`
// pop into a class that only exists for single-placement screens.
const _cycleKickstartSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  catalog(0),
  author(0, Codec.string),
  reply(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static _Screens _thread() =>
      reply.inherit(author)({author.inherit(reply).again});
  static _Screens _author() => author({author.again, _thread()});

  static final graph = NavGraph<_Screens>(
    {
      home({_author()}),
      catalog({
        author,
        reply({
          author.inherit(reply)({author.again, reply.inherit(author).again}),
        }),
      }),
    },
  );
}
''';

// A CUSTOM-named codec in a link slot — the value type must resolve through
// the analyzer (`Codec<int>` → int), not degrade to Object via the name table.
const _customCodecLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  product(0, Codec.string);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {
      home({product}),
      product.links({slot(Codec.sku)}),
    },
  );
}
''';

// The @IDs-ANNOTATED twin: generated extension types exist, so verbs, reads
// and casts use the typed ids (`AuthorId`, `(ProductId, AuthorId)`).
const _typedIdsSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@IDs()
enum Ids with IdNode {
  product(Codec.uuid),
  author(Codec.username),
  review.compose(product, author);

  const Ids(Codec this._codec) : n1 = null, n2 = null;
  const Ids.compose(IdNode this.n1, IdNode this.n2) : _codec = null;

  final Codec? _codec;
  final IdNode? n1, n2;

  @override
  Codec get codec => _codec ?? Record2Codec(n1!.codec, n2!.codec);
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  author(0, .author),
  review(0, .review);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Ids? id;

  static final graph = NavGraph<_Screens>(
    {
      home({review({author.inherit(review)})}),
    },
  );
}
''';

// A link slot holding an @IDs node keeps the node's typed id.
const _idSlotLinkSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@IDs()
enum Ids with IdNode {
  product(Codec.uuid);

  const Ids(this.codec);

  @override
  final Codec codec;
}

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  product(0, .product);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Ids? id;

  static final graph = NavGraph<_Screens>(
    {
      home({product}),
      product.links({slot(Ids.product)}),
    },
  );
}
''';

void main() {
  test(
    'projection under an inherited composite anchors at the composite',
    () => _expectGenerated(
      allOf([
        // author's id = component 2 of the COMPOSITE — never product's id
        contains('ReviewId?)?.author'),
        isNot(contains('goAuthor(ProductId')),
      ]),
      spec: _nestedProjectionSpec,
    ),
  );

  test(
    '@IDs id-space → typed verbs, reads and projections',
    () => _expectGenerated(
      allOf([
        contains('goReview(ReviewId id)'), // typed composite verb
        contains('Screen<AuthorId>'), // typed screen surface
        contains('ReviewId?)?.author'), // typed projection cast
        isNot(contains('goReview((String, String) id)')),
      ]),
      spec: _typedIdsSpec,
    ),
  );

  test(
    'a custom codec\'s link value type resolves via the analyzer',
    () => _expectGenerated(
      allOf([
        contains('final int value0'), // Codec<int> sku → int, not Object
        isNot(contains('final Object value0')),
      ]),
      spec: _customCodecLinkSpec,
    ),
  );

  test(
    'a multi-placement screen: ordinal-named navs under one sealed placement',
    () => _expectGenerated(
      allOf([
        contains('sealed class AuthorPlacement implements AnyPlacement'),
        matches(RegExp(r'class const AuthorNav1\._\(\)\s+extends AnyPlacement')),
        matches(RegExp(r'class const AuthorNav2\._\(\)\s+extends AnyPlacement')),
        contains('AuthorPlacement _resolveAuthorPlacement(List<Enum> c)'),
        // no pop surface on a nav, no path-joined names
        isNot(contains('popTo<')),
        isNot(contains('popToHome')),
        isNot(contains('PopPlacement')),
        isNot(contains('HomeAuthorNav')),
      ]),
      spec: _cycleKickstartSpec,
    ),
  );

  test(
    'composite as an @ids enum row: same projection, dot-shorthand ids',
    () => _expectGenerated(
      allOf([
        contains('(String, String)?)?.\$2'), // author = component 2 of review
        contains('goReview((String, String) id)'), // record type from _codec
        contains('goAuthor(String id)'), // atomic type through _codec backing
      ]),
      spec: _rowCompositeSpec,
    ),
  );

  test(
    'inherit projects one composite component by node identity',
    () => _expectGenerated(
      // author's id is component 1 (author) of review's (String, String) record.
      contains('(String, String)?)?.\$2'),
      spec: _projectionSpec,
    ),
  );

  test(
    'screen bound to an @ids node uses the node codec specific id type',
    () => _expectGenerated(
      allOf([
        // unwrapped Codec.uuid -> String, not the erased node Object?
        contains('static const profile = Screen<String>._(_Screens.profile);'),
        isNot(contains('profile = Screen<Object?>')),
      ]),
      spec: _idsNodeSpec,
    ),
  );

  test(
    'composite inherit: both components inherited -> no-arg verb',
    () => _expectGenerated(
      allOf([
        contains(
          'OrderNav goOrder() {',
        ), // both components inherited -> no args
        contains(', _Screens.order, ('),
        contains('_idOf(.product)'),
        contains('_idOf(.author)'),
        contains('Object? _idOf(_Screens s)'),
      ]),
      spec: _compositeSpec,
    ),
  );

  test(
    'composite inherit: partial -> verb requires only the missing component',
    () => _expectGenerated(
      allOf([
        contains('OrderNav goOrder(int id) {'),
        contains(
          '_Screens.graph.goFrom(_Screens.product, _Screens.order, (\n'
          '      _idOf(.product),\n'
          '      id,\n',
        ),
        isNot(contains('goOrder((String, int) id)')),
      ]),
      spec: _compositePartialSpec,
    ),
  );

  test(
    'composite inherit at two positions: the placement declares the shrunk verb',
    () => _expectGenerated(
      allOf([
        contains('sealed class ProductPlacement'),
        contains('goOrder(int id);'), // the interface, shrunk like its leaves
        isNot(contains('goOrder((String, int) id);')),
      ]),
      spec: _compositePartialTwicespec,
    ),
  );

  test(
    'composite id with no inherit: verb takes the atomic record id',
    () => _expectGenerated(
      allOf([
        contains('goOrder((String, int) id)'),
        isNot(contains('goOrder(String')), // never destructured
      ]),
      spec: _compositeNoneSpec,
    ),
  );

  test(
    'composite inherit: arity overflow is a build error',
    () => _expectBuildError(_compositeOverflowSpec, 'id component'),
  );

  test(
    'inherited edge: no-arg chained verb reads the ancestor id',
    () => _expectGenerated(
      allOf(
        contains(
          'EditProductNav goEditProduct() {',
        ), // chained: no id parameter
        contains('_Screens.editProduct,\n'),
        contains('_idOf(.product),'),
        contains('Object? _idOf(_Screens s)'), // the live-ancestor reader
      ),
      spec: _inheritSpec,
    ),
  );

  test(
    'a placement verb goes FROM its placement (goFrom), not a bare push',
    () => _expectGenerated(
      allOf([
        contains('_Screens.graph.goFrom(_Screens.home, _Screens.product, id);'),
        // an inherited edge: from product, reading product's live id
        contains('    _Screens.graph.goFrom(\n      _Screens.product,\n'),
      ]),
      spec: _inheritSpec,
    ),
  );

  test(
    'inherit kick-start rescue: one id fills the whole chain',
    () => _expectGenerated(
      allOf([
        contains(
          'static EditProductNav goEditProduct(String id)',
        ), // global kick-start
        contains(
          '_Screens.graph.go(_Screens.product, id);',
        ), // stamp the source
        contains(
          '_Screens.graph.go(_Screens.editProduct, id, true)',
        ), // ...then target
        // Not in the single-go Hop KICK-START class (needs the multi-step chain);
        // it IS navigable as a chain-carrying Place Hop, which is fine.
        isNot(contains('Hop<EditProductNav>._(')),
      ]),
      spec: _inheritSpec,
    ),
  );

  test(
    'no ancestor reach: a verb is offered only on its direct parent',
    () => _expectGenerated(
      allOf([
        // section (the direct parent) pushes product…
        contains('ProductNav goProduct(String id) {'),
        // …but no nav above product reaches editProduct with an id (only the
        // static kick-start does)
        isNot(
          matches(
            RegExp(r'^  EditProductNav goEditProduct\(String id\)', multiLine: true),
          ),
        ),
      ]),
      spec: _deepInheritSpec,
    ),
  );

  test(
    'inherit blocked by an interposed id: no-arg at order, reading profile',
    () => _expectGenerated(
      allOf([
        // at order the source id is live → no-arg verb reading it.
        contains('goOrderProfile()'),
        contains('_idOf(.profile)'),
        isNot(contains('goOrderProfile(String id)')),
      ]),
      spec: _interposedIdSpec,
    ),
  );

  test(
    'parentOf includes back-edge parents (a .again self-recursion)',
    () =>
        // _spec: home -> item -> about -> item.again. item is pushable from home
        // (forward) AND from about (the back-edge), so parentOf.item must list both.
        _expectGenerated(
          allOf([
            contains('OnParentOf<ItemNavParent> get item'),
            contains('_Screens.about'), // back-edge parent included
            contains('_Screens.home'),
          ]),
        ),
  );

  test(
    'emits the Initial boot placement (no chain surface, no goRoot)',
    () => _expectGenerated(
      allOf([
        // the boot placement the resolver maps the boot entry to
        contains('final class const Root._() extends AnyPlacement'),
        contains('BootScreen.root => const Root._()'), // _atOf maps it
        contains(
          'BootScreen.root: Screen<Never>._(BootScreen.root)',
        ), // of() safe
        // the old InitialScreen-chain mechanism is gone (name freed for the consumer)
        isNot(contains('sealed class RootScreen')),
        isNot(contains('goRoot')),
      ]),
      spec: _inheritSpec,
    ),
  );

  test(
    'parentOf: only for 2+-parent screens, resolved by membership',
    () => _expectGenerated(
      allOf([
        contains('static _ParentSel get parentOf'),
        contains('final class const OnParentOf<'),
        contains(
          'final class const _ParentSel._() {',
        ), // a holder, NOT an On subtype
        isNot(
          contains('_ParentSel extends'),
        ), // so bare on(.parentOf) can't compile
        contains('OnParentOf<ItemNavParent> get item'), // item: 2 parents
        contains(
          'final class const ItemNavParent._([final Enum? _at]) extends AnyNav',
        ),
        contains('void goItem(String id)'), // pushes the target
        contains('if (_at case final at?)'), // an owner handle goes from it
        contains('parents.contains(_Screens.graph.current)'),
        isNot(
          contains('EditItemNavParent'),
        ), // editItem: single parent -> no parentOf
        isNot(contains('OnParentOf<EditItemNavParent>')),
      ]),
      spec: _parentOfSpec,
    ),
  );

  test(
    'emits the typed Screen surface',
    () => _expectGenerated(
      allOf([
        contains('final class const Screen<I>._(final Enum _spec)'),
        contains('goItem(String id)'), // typed id verb
        contains('isCodegenFresh'), // stale-codegen guard
        contains('_treeSignature'),
        // Placements EXTEND the sealed AnyPlacement (so cross-screen
        // ternaries LUB to AnyPlacement, not AnyNav).
        contains('sealed class const AnyPlacement._() extends AnyNav'),
        matches(RegExp(r'class const \w+\._\(\) extends AnyPlacement')),
        // the total, context-owned handle
        contains(
          'static N ownerOf<N extends AnyNav>(BuildContext context, On<N> which)',
        ),
        contains('ScreenScope.entryOf(context)'),
        contains('_Screens.graph.chainOf(entry)'),
        // gone: the families no consumer reads
        isNot(contains('get current')),
        isNot(contains('Replace')),
        isNot(contains('RootControls')),
        isNot(contains('snapshot()')),
        isNot(contains('OnDepth')),
      ]),
    ),
  );

  test(
    'emits the typed ScreenEntry stack + navigations surface',
    () => _expectGenerated(
      allOf([
        contains('sealed class const ScreenEntry()'),
        contains(
          'final class const ItemEntry(final String id) extends ScreenEntry',
        ),
        contains(
          'final String id) extends ScreenEntry',
        ), // item carries a TYPED id (not Object?)
        contains(
          'final class const HomeEntry() extends ScreenEntry',
        ), // id-free variant
        contains('ScreenEntry _entryOf(Enum s, Object? id)'),
        contains(
          '_Screens.item => ItemEntry(id as String)',
        ), // cast at the seam
        contains('_Screens.home => const HomeEntry()'),
        contains('static NavStack<Screen<Object?>> get stack'),
        contains('static Stream<ScreenNavigation> get navigations'),
        contains('final class ScreenNavigation._(final Navigation _n)'),
        contains('ScreenEntry get destination'),
      ]),
    ),
  );

  test(
    'a .links branch generates the Link surface; nav stays intact',
    () => _expectGenerated(
      allOf([
        contains('HomeEntry'), // home + author nav generation succeeded…
        contains('AuthorEntry'),
        isNot(contains('LinksEntry')), // …and .links added no phantom screen
        contains(
          'sealed class const Url(',
        ), // …and emitted the typed Link surface
        contains(
          'sealed class const Link([super.domain]) extends Url',
        ), // the families
        // single-slot endpoint → one concrete widgetless class, no marker
        contains('final class const AuthorLink('),
        contains('final String value0'), // the slot's typed field
        contains('Url? parseUrl(String url)'),
        contains('final String? domain]) {'), // the inbound origin rides on Url
        contains(
          "'author/*' => AuthorLink(m.path[0] as String, origin)",
        ), // typed map + origin
        // …and an instance toUri per class (no @Screens domain → domain required)
        contains('Uri toUri(String domain);'), // base declares it abstract
        contains(
          'Uri toUri(String domain) => Uri.parse(',
        ), // each class implements
        contains('encodeLink('),
        contains("'author/*'"),
        contains('<Object?>[value0]'),
        contains('<int>[0]'),
      ]),
      spec: _linksSpec,
    ),
  );

  test(
    'a union slot generates sibling Link classes under a per-entity marker',
    () => _expectGenerated(
      allOf([
        contains(
          'sealed class AuthorLink implements Url',
        ), // the per-entity marker
        contains(
          'final class const AuthorByUuidLink(final String uuid, [super.domain])',
        ),
        contains(
          'class const AuthorByUsernameLink',
        ), // username field name rides the codec
        contains('final String uuid'), // semantic codec → field name
        contains('final String username'),
        contains('switch (m.branches[0])'), // parse picks the branch…
        contains('0 => AuthorByUuidLink(m.path[0] as String, origin)'),
        contains('1 => AuthorByUsernameLink(m.path[0] as String, origin)'),
        contains(
          'Uri toUri(String domain) =>',
        ), // …an instance toUri per sibling
        contains('<Object?>[uuid]'),
      ]),
      spec: _unionSpec,
    ),
  );

  test(
    'slot(a | b) is the same union as slots({a, b})',
    () => _expectGenerated(
      allOf([
        contains('sealed class AuthorLink implements Url'),
        contains(
          'final class const AuthorByUuidLink(final String uuid, [super.domain])',
        ),
        contains('class const AuthorByUsernameLink'),
        contains('0 => AuthorByUuidLink(m.path[0] as String, origin)'),
        contains('1 => AuthorByUsernameLink(m.path[0] as String, origin)'),
      ]),
      spec: _slotUnionOpSpec,
    ),
  );

  test(
    'query & fragment use the same `&`/`|` algebra (brackets ok), keys flow',
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
    ),
  );

  test(
    'a literal in a union slot becomes a payload-less widgetless sibling',
    () => _expectGenerated(
      allOf([
        contains('sealed class AuthorLink implements Url'),

        contains(
          'final class const AuthorMeLink([super.domain])',
        ), // payload-less, no field
        contains(
          'final class const AuthorByUuidLink(final String uuid, [super.domain])',
        ),
        contains(
          '0 => AuthorMeLink(origin)',
        ), // parse: branch 0 reads no path token
        contains("<Object?>['me']"), // encode threads the literal back in toUri
      ]),
      spec: _literalUnionSpec,
    ),
  );

  test(
    'the widget form injects the screen id as a Place sibling',
    () => _expectGenerated(
      allOf([
        contains('sealed class AuthorLink implements Url'),
        // injected id branch → Place, field `<screen>Id`, class `…ByIdLink`
        contains('final class const AuthorByIdLink('),
        contains('final String authorId'),
        // declared branches stay widgetless
        contains('final class const AuthorMeLink([super.domain])'),
        contains('class const AuthorByUsernameLink'),
        contains('final String username'),
        // order: the canonical id leads, declared resolvers follow ⇒
        // authorId=0, me=1, username=2
        contains('0 => AuthorByIdLink(m.path[0] as String, origin)'),
        contains('1 => AuthorMeLink(origin)'),
        contains('2 => AuthorByUsernameLink(m.path[0] as String, origin)'),
      ]),
      spec: _widgetFormSpec,
    ),
  );

  test(
    'Link carries the widgetless resolvers; no Place builder chain',
    () => _expectGenerated(
      allOf([
        contains('static _LXAuthor get author =>'),
        contains("me() => _LXAuthorSlot([..._p, 'me'], [..._b, 1]);"),
        contains('byUsername(String username) =>'),
        // the leaf step builds its URL off the accumulators
        contains("_Screens.graph.encodeLink(domain, 'author/*', _p, _b)"),
        isNot(contains('_WL')),
      ]),
      spec: _widgetFormSpec,
    ),
  );

  test(
    'Place is the parsed nav-mirror form, go-able; no builder statics',
    () => _expectGenerated(
      allOf([
        contains('sealed class const Place([super.domain]) extends Url'),
        contains('implements Hop<AnyNav>'),
        contains('final class const _NavPlace('),
        contains('_Screens.graph.encodeNavUrl('),
        isNot(contains('_WL')),
        // a broken percent escape parses to nothing instead of throwing
        contains('final uri = tryParseUri(url);'),
      ]),
      spec: _spec,
    ),
  );

  test('an empty call `author()` is rejected (write the bare leaf)', () async {
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

  test(
    '`X()` beside `X.link(...)` in one set is rejected (redundant)',
    () async {
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
      expect(
        logs.join('\n'),
        contains('both as a placement and a `.link` branch in the same set'),
      );
    },
  );

  test(
    'a link branch stays widgetless, addressed by its leaf',
    () => _expectGenerated(
      allOf([
        // `account.link` is a link branch, NOT a nav child → its widgetless
        // resolver stays on the Link surface, smart-addressed by its leaf
        // (the redundant `home` parent dropped)
        contains('static _LXAccount get account =>'),
        isNot(contains('static _LXHome get home =>')),
        isNot(contains('account(String id) => _LX')),
      ]),
      spec: _probeSpec,
    ),
  );

  test(
    'Link drops a redundant static parent (smart minimal address)',
    () => _expectGenerated(
      allOf([
        // `home/account/*` resolve-link is reachable as `.account`, the
        // redundant `home` parent dropped; the URL still uses the full path
        contains('static _LXAccount get account =>'),
        isNot(contains('static _LXHome get home =>')),
        contains("encodeLink(domain, 'home/account/*'"),
      ]),
      spec: _nestedLinkSpec,
    ),
  );

  test(
    'Link keeps the full path when the leaf is ambiguous',
    () => _expectGenerated(
      allOf([
        // `account` is linked under home AND profile → minimal address clashes,
        // so both keep their disambiguating parent
        contains('static _LXHome get home =>'),
        contains('static _LXProfile get profile =>'),
        contains('class _LXHomeAccount('),
        contains('class _LXProfileAccount('),
        isNot(contains('static _LXAccount get account =>')),
      ]),
      spec: _ambiguousLinkSpec,
    ),
  );

  test(
    'a nested link is named by its leaf screen, path stays in the template',
    () => _expectGenerated(
      allOf([
        contains(
          'final class const AccountLink',
        ), // leaf name, not HomeAccountLink
        isNot(contains('HomeAccountLink')),
        contains("'home/account/*' => AccountLink("), // full path in the URL
      ]),
      spec: _nestedLinkSpec,
    ),
  );

  test(
    'placement .query emits typed FeedQuery (read) + FeedQueryMut (write)',
    () => _expectGenerated(
      allOf([
        contains('FeedNav'), // nav generation still succeeded…
        contains('class const FeedQuery._() {'), // read model
        contains('String? get category =>'),
        contains('int? get radius =>'),
        contains(
          'final class const FeedQueryMut._() extends FeedQuery',
        ), // mutable subtype
        contains('set category(String? v) =>'),
        contains("viewSet(_Screens.feed, 'category', v)"),
        // …and the nav exposes the MUTABLE view-state
        contains('FeedQueryMut get query => const FeedQueryMut._();'),
        // gone: the match/build vocabularies and the reactive view reads
        isNot(contains('FeedQueryCond')),
        isNot(contains('FeedQueryArg')),
        isNot(contains('FeedView')),
        isNot(contains('AnyView')),
      ]),
      spec: _viewSpec,
    ),
  );

  test(
    'a multi-placement view-state screen: its placement declares the getter',
    () => _expectGenerated(
      allOf([
        contains('class const ItemQuery._()'),
        contains('String? get tag =>'),
        contains('ItemQueryMut get query;'), // on the sealed placement
        contains('ItemQueryMut get query => const ItemQueryMut._();'),
      ]),
      spec: _multiViewSpec,
    ),
  );

  test(
    'emits the single RouterDelegate host as Screen.manager',
    () => _expectGenerated(
      allOf([
        contains('static NavDelegate get manager'),
        contains('return _Screens.graph.delegate;'),
      ]),
    ),
  );

  test(
    'emits the on-chain suffix selector + steps',
    () => _expectGenerated(
      allOf([
        contains('final class const On<N extends AnyNav>._('),
        contains('final List<_Screens> specs'), // suffix selector
        contains('final class const OnHome'), // step: home has child item
        contains('final class const OnItem'), // step: item, child about
        contains('static OnItem get item'), // id selector is a getter (any id)
        contains('OnItem call(String id)'), // ...callable to pin a specific id
        contains('On<AboutNav> get about'), // chain: item -> about (a leaf)
        isNot(contains('OnDepth')),
        isNot(contains('countOf(')),
      ]),
    ),
  );

  test(
    'Screen.go(Hop) returns the Hop\'s typed nav (N), not a union',
    () => _expectGenerated(
      allOf([
        contains('static N go<N extends AnyNav>(Hop<N> hop)'),
        contains('return hop.nav;'),
      ]),
    ),
  );

  test(
    'emits the global Screen.pop: a pop above a root, nothing at one',
    () => _expectGenerated(
      allOf([
        contains('static void pop() {'),
        contains('if (_Screens.graph.currentChain.length > 1)'),
        isNot(contains('PopDestPlacement')),
        isNot(contains('CanPopNav')),
      ]),
    ),
  );

  test(
    'exposes the navigations stream',
    () => _expectGenerated(
      contains('static Stream<ScreenNavigation> get navigations'),
    ),
  );

  test(
    'emits the Screen.resolver setter + eager initialUrl (links present)',
    () => _expectGenerated(
      allOf(
        contains('static set resolver(void Function(Url? url) fn) =>'),
        contains('fn(parseUrl(url)),'),
        // Mobile has no host-fed cold URL — assignment during boot
        // fires the launch route as the fallback.
        contains('boot:'),
        contains('platformDispatcher.defaultRouteName'),
      ),
      spec: _linksSpec,
    ),
  );

  test(
    'a link slot holding an @IDs node carries its typed id, named by it',
    () => _expectGenerated(
      allOf([
        contains('final ProductId product'),
        contains('m.path[0] as ProductId'),
        isNot(contains('final Object value0')),
      ]),
      spec: _idSlotLinkSpec,
    ),
  );

  test(
    'record id written directly is reconstructed (no typedef)',
    () => _expectGenerated(
      allOf([
        contains('Screen<(String, String)>'),
        contains('goEditImage((String, String) id)'),
      ]),
      spec: _recordIdSpec,
    ),
  );

  test(
    'a flat (all-roots) tree generates no pop surface at all',
    () => _expectGenerated(
      isNot(contains('static void pop()')),
      spec: _flatSpec,
    ),
  );

  test(
    'a Regency const in the library wires ledger.bind() into the manager',
    () async {
      await _expectGenerated(contains('ledger.bind();'), spec: _regencySpec);
      await _expectGenerated(
        isNot(contains('ledger.bind();')),
        spec: _flatSpec,
      );
    },
  );
}

// A library that also declares its regency — the manager must bind it.
const _regencySpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

class Regency { const Regency(); }

const app = Regency();

@screens
enum _Screens with ScreenNode<Object?, _Screens> {
  home(0),
  feed(0);

  const _Screens(this.widget, [this.id]);
  final Object widget;
  final Codec? id;

  static final graph = NavGraph<_Screens>(
    {home, feed},
  );
}
''';
