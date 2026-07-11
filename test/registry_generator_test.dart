import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:canon_generator/canon_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

// regent owns the regent bases + the Regency graph the generator reads.
const _regentStub = '''
abstract interface class AnyStore<S> {}
abstract interface class AnyProjection {}
abstract class Regent { const Regent(); }
abstract class Store<K, E, M> extends Regent implements AnyStore<Map<K, E>> { const Store(); }
abstract class Unit<S, M> extends Regent implements AnyStore<S> { const Unit(); }
typedef ReadStore = S Function<S>(AnyStore<S> spec);
abstract class Guard<M> extends Regent { const Guard(); }
abstract class Veto<M> extends Guard<M> { const Veto(); }
abstract class Projection<S, K, E> implements AnyProjection {
  const Projection([this.target, this.source]);
  final AnyStore<Object?>? target;
  final AnyStore<Object?>? source;
}
abstract class UnitProjection<S, T> implements AnyProjection {
  const UnitProjection([this.target, this.source]);
  final AnyStore<Object?>? target;
  final AnyStore<Object?>? source;
}
class Regency extends Regent {
  const Regency(this.rows, {this.merges = const {}});
  final Set<Regent> rows;
  final Set<AnyProjection> merges;
}
mixin ListMsg<T> { List<T> get items; }
mixin CacheMsg<T> { List<T> get items; }
mixin AddMsg<T> { T get item; }
mixin EchoOf<T> { T get item; }
mixin RemoveMsg<K> { K get id; }
abstract class Crud<K, T, L, C, A, E, R, G> extends Regency {
  const Crud() : super(const {});
  Store<K, T, Object> get store => throw UnimplementedError();
}
abstract class ListCrud<K, T, L, C> extends Crud<K, T, L, C, Never, Never, Never, Never> {
  const ListCrud();
}
// The retired enum tier — kept only so the retirement guard can name it.
mixin RegentNode<Self extends RegentNode<Self>> on Enum {
  Regent get regent;
}
''';

// identifiable owns the @IDs + @entities grammars.
const _identifiableStub = '''
class IDs { const IDs(); }
abstract mixin class IdNode {
  const IdNode();
  const factory IdNode.compose(IdNode n1, IdNode n2, [IdNode? n3, IdNode? n4]) =
      CompositeId;
}
class CompositeId with IdNode {
  const CompositeId(this.n1, this.n2, [this.n3, this.n4]);
  final IdNode n1, n2;
  final IdNode? n3, n4;
}
class Entities { const Entities(); }
const entities = Entities();
abstract interface class EntityTreeNode {}
mixin EntityNode<Self extends EntityNode<Self>> on Enum
    implements EntityTreeNode {
  Type get type;
  IdNode? get key;
  EntityTreeNode call([Set<EntityTreeNode> children = const {}]) =>
      EntityBranch(this, children);
  EntityMerge merge(Self source, Object projection) =>
      EntityMerge(this, [(source, projection)]);
}
class EntityBranch implements EntityTreeNode {
  EntityBranch(this.entity, this.children);
  final Enum entity;
  final Set<EntityTreeNode> children;
}
class EntityMerge implements EntityTreeNode {
  EntityMerge(this.entity, this.edges, [this.children = const {}]);
  final Enum entity;
  final List<(Enum, Object)> edges;
  final Set<EntityTreeNode> children;
  EntityMerge merge(Enum source, Object projection) =>
      EntityMerge(entity, [...edges, (source, projection)], children);
  EntityMerge call([Set<EntityTreeNode> children = const {}]) =>
      EntityMerge(entity, edges, children);
}
class EntityGraph {
  EntityGraph(this.tree);
  final Set<EntityTreeNode> tree;
}
''';

// canon is the facade — re-exports regent + identifiable, so the spec imports
// only `package:canon/canon.dart` and gets the grammars and the engines.
const _canonStub = '''
export 'package:regent/regent.dart';
export 'package:identifiable/identifiable.dart';

class Canon { const Canon(); }
const canon = Canon();

abstract class Codec<T> { const Codec(); }
class StringCodec extends Codec<String> { const StringCodec(); }

class Screens { const Screens(); }
const screens = Screens();
mixin ScreenNode<S> on Enum {}
class NavGraph<S> {
  NavGraph();
  List<({Enum screen, Object? id})> get stack => const [];
  Stream<Object?> get navigations => const Stream.empty();
}
''';

// The three grammars connected: @ids nodes, @entities binding type↔node (+ the
// ownership graph), and the REGENCY holding only the reduces — key node, key
// type, and screen association all DERIVE through the store's entity type.
const _spec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  author(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class ReviewState {}
sealed class ReviewMsg {}
class Review extends Store<String, ReviewState, ReviewMsg> {
  const Review();
}

@entities
enum _Entities with EntityNode<_Entities> {
  review(ReviewState, Ids.author);

  const _Entities(this.type, this.key);
  @override
  final Type type;
  @override
  final Ids key;

  static final graph = EntityGraph({review});
}

@screens
enum _Screens with ScreenNode<_Screens> {
  home(null),
  profile(Ids.author);

  const _Screens(this.id);
  final Ids? id;

  static final graph = NavGraph<_Screens>();
}

@canon
const app = Regency({Review()});
''';

// The shared scaffolding of the guard specs: id node + entity space; each
// spec below appends its own Review store + regency.
const _guardBase = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  author(StringCodec()),
  comment(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class ReviewState {}
class CommentState {}

@entities
enum _Entities with EntityNode<_Entities> {
  review(ReviewState, Ids.author),
  comment(CommentState, Ids.comment);

  const _Entities(this.type, this.key);
  @override
  final Type type;
  @override
  final Ids key;

  static final graph = EntityGraph({review({comment})});
}
''';

// The store's key type (int) disagrees with the entity node's codec value-type
// (String) — the derived key guard must reject it.
const _mismatchSpec = '''
$_guardBase
sealed class ReviewMsg {}
class Review extends Store<int, ReviewState, ReviewMsg> {
  const Review();
}

@canon
const app = Regency({Review()});
''';

// A registry whose message type is NOT sealed — the reduce can't be exhaustive,
// so the generator must reject it at build time.
const _unsealedMsgSpec = '''
$_guardBase
class ReviewMsg {}
class Review extends Store<String, ReviewState, ReviewMsg> {
  const Review();
}

@canon
const app = Regency({Review()});
''';

// A store on an OWNED entity — comment lives inside review's aggregate, so a
// store of its own is illegal.
const _ownedStoreSpec = '''
$_guardBase
sealed class CommentMsg {}
class Comments extends Store<String, CommentState, CommentMsg> {
  const Comments();
}

@canon
const app = Regency({Comments()});
''';

// A store of a type that is no @entities row at all.
const _unknownEntitySpec = '''
$_guardBase
class OrphanState {}
sealed class OrphanMsg {}
class Orphans extends Store<String, OrphanState, OrphanMsg> {
  const Orphans();
}

@canon
const app = Regency({Orphans()});
''';

// The retired tier: a @canon @regents-style enum must fail with the
// migration pointer.
const _retiredEnumSpec = '''
$_guardBase
sealed class ReviewMsg {}
class Review extends Store<String, ReviewState, ReviewMsg> {
  const Review();
}

@canon
enum _Regents with RegentNode<_Regents> {
  review(Review());
  const _Regents(this.regent);
  @override
  final Regent regent;
}
''';

// An @IDs enum with atomic rows, a composite row, and a static composite —
// each atomic node emits a zero-cost extension type; composites emit typed
// record aliases.
const _idsSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@IDs()
enum Ids with IdNode {
  product(StringCodec()),
  author(StringCodec()),
  review.compose(product, author);

  const Ids(Codec this._codec) : n1 = null, n2 = null;
  const Ids.compose(IdNode this.n1, IdNode this.n2) : _codec = null;

  final Codec? _codec;
  final IdNode? n1, n2;

  @override
  Codec get codec => _codec!;

  static const IdNode order = .compose(product, author);
}
''';

// A UNIT: keyless entity row + a Unit holding it — emits a UnitMemory
// global looked up by instance identity.
const _unitSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  author(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class ReviewState {}
class ViewerState {}
sealed class ProfileMsg {}
class Viewer extends Unit<ViewerState?, ProfileMsg> {
  const Viewer();
  @override
  ViewerState? get initial => null;
  @override
  ViewerState? reduce(ViewerState? state, ProfileMsg msg) => state;
}

@entities
enum _Entities with EntityNode<_Entities> {
  review(ReviewState, Ids.author),
  viewer(ViewerState);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  static final graph = EntityGraph({review, viewer});
}

@canon
const app = Regency({Viewer()});
''';

// A NESTED regency splices: its rows are rows of the one queue; merges live
// on the projections themselves — the generator emits NO wiring.
const _nestedSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  user(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class UserState {}
class ViewerState {}
sealed class UserMsg {}
sealed class ProfileMsg {}
class Users extends Store<String, UserState, UserMsg> { const Users(); }
class Viewer extends Unit<ViewerState?, ProfileMsg> { const Viewer(); }
class ViewerSupportsUser extends UnitProjection<ViewerState?, UserState> {
  const ViewerSupportsUser() : super(const Users(), const Viewer());
}

@entities
enum _Entities with EntityNode<_Entities> {
  user(UserState, Ids.user),
  viewer(ViewerState);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  static final graph = EntityGraph({
    user,
    viewer,
  });
}

const profileSegment = Regency({Viewer()});

@canon
const app = Regency({
  profileSegment,
  Users(),
}, merges: {ViewerSupportsUser()});
''';

const _guardRowSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  user(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class UserState {}
class GateState {}
sealed class UserMsg {}
sealed class GateMsg {}
class CachedUsers extends UserMsg {}
class Users extends Store<String, UserState, UserMsg> { const Users(); }
class Covered extends Unit<GateState?, GateMsg> { const Covered(); }
class CachedGate extends Veto<CachedUsers> {
  const CachedGate();
  bool block(CachedUsers msg, ReadStore read) =>
      read(const Covered()) != null;
}

@entities
enum _Entities with EntityNode<_Entities> {
  user(UserState, Ids.user),
  gate(GateState);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  static final graph = EntityGraph({user, gate});
}

@canon
const app = Regency({
  Covered(),
  CachedGate(),
  Users(),
});
''';

// A guard reading a regent NO row holds — citizenship fails the build.
const _strangerReadSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

@IDs()
enum Ids with IdNode {
  user(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class UserState {}
sealed class UserMsg {}
class CachedUsers extends UserMsg {}
class Users extends Store<String, UserState, UserMsg> { const Users(); }
class Stranger extends Unit<int, UserMsg> { const Stranger(); }
class CachedGate extends Veto<CachedUsers> {
  const CachedGate();
  bool block(CachedUsers msg, ReadStore read) =>
      read(const Stranger()) > 0;
}

@entities
enum _Entities with EntityNode<_Entities> {
  user(UserState, Ids.user);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  static final graph = EntityGraph({user});
}

@canon
const app = Regency({
  CachedGate(),
  Users(),
});
''';

// A CRUD brick row: one row that is a whole segment — the generator names
// its authoritative store after the brick class minus the Crud suffix.
const _brickSpec = '''
import 'package:canon/canon.dart';

part 'spec.canon.dart';

enum Ids with IdNode {
  order(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class Order {}
sealed class OrderMsg {}
class OrdersLoaded extends OrderMsg with ListMsg<Order> {
  const OrdersLoaded(this.items);
  final List<Order> items;
}
class CachedOrders extends OrderMsg with CacheMsg<Order> {
  const CachedOrders(this.items);
  final List<Order> items;
}

class OrdersCrud extends ListCrud<String, Order, OrdersLoaded, CachedOrders> {
  const OrdersCrud();
}

@entities
enum _Entities with EntityNode<_Entities> {
  order(Order, Ids.order);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  static final graph = EntityGraph({order});
}

@canon
const app = Regency({OrdersCrud()});
''';

void main() {
  final assets = <String, String>{
    'regent|lib/regent.dart': _regentStub,
    'identifiable|lib/identifiable.dart': _identifiableStub,
    'canon|lib/canon.dart': _canonStub,
  };

  test('@IDs emits extension types, composites with named components', () => testBuilder(
        PartBuilder([IdsGenerator()], '.canon.dart'),
        {...assets, 'pkg|lib/spec.dart': _idsSpec},
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.canon.dart': decodedMatches(allOf([
            contains('extension type const ProductId(String _) implements String {'),
            contains('extension type const AuthorId(String _) implements String {'),
            // the back-link: type → grammar node (codec rides on it)
            contains('static const Ids node = Ids.product;'),
            contains('static const Ids node = Ids.author;'),
            contains(
                  'extension type const ReviewId((ProductId, AuthorId) _) {'),
              contains('const ReviewId.of(ProductId product, AuthorId author)'),
              contains(': this((product, author));'),
              contains('ProductId get product => _.\$1;'),
              contains('AuthorId get author => _.\$2;'),
            contains(
                  'extension type const OrderId((ProductId, AuthorId) _) {'),
          ]))
        },
      ));

  test('a UNIT row (Unit + keyless entity) emits a UnitMemory global',
      () => testBuilder(
            PartBuilder([CanonGenerator()], '.canon.dart'),
            {...assets, 'pkg|lib/spec.dart': _unitSpec},
            rootPackage: 'pkg',
            generateFor: {'pkg|lib/spec.dart'},
            outputs: {
              'pkg|lib/spec.canon.dart': decodedMatches(allOf([
                contains('UnitMemory<ViewerState?, ProfileMsg> get viewer =>'),
                contains('at(const Viewer())'),
              ]))
            },
          ));

  test('emits a typed Data surface; key type follows the @ids node codec',
      () => testBuilder(
            PartBuilder([CanonGenerator()], '.canon.dart'),
            {...assets, 'pkg|lib/spec.dart': _spec},
            rootPackage: 'pkg',
            generateFor: {'pkg|lib/spec.dart'},
            outputs: {
              'pkg|lib/spec.canon.dart': decodedMatches(allOf([
                // one api: the ledger BUILT from the graph + per-row globals
                contains('final ledger = Ledger.root(app);'),
                contains('extension AppLedger on Ledger {'),
                contains('void bind() {'),
                contains(
                    'StoreMemory<String, ReviewState, ReviewMsg> get review =>'),
                contains('at(const Review())'),
                // StoreMemory IS the read surface — no `review(key)` sugar
                isNot(contains('ReviewState? review(String key)')),
                // derived screen↔store association: profile shares Ids.author
                contains('ReviewState? reviewOnProfile()'),
                // Door 2: the committed-navigation trigger consults the twin
                contains('graph.navigations.listen('),
                contains('class ProfileEnteredMsg extends Msg'),
                contains('dispatch(ProfileEnteredMsg(id as String))'),
                isNot(contains('inFlight')),
                isNot(contains('surface(')),
                contains('e.screen == _Screens.profile'),
                contains('review[e.id as String]'),
                // home has no id-node → no accessors at all
                isNot(contains('OnHome')),
              ]))
            },
          ));

  test('a GUARD row emits nothing — the runtime mounts it at its position',
      () => testBuilder(
        PartBuilder([CanonGenerator()], '.canon.dart'),
        {...assets, 'pkg|lib/spec.dart': _guardRowSpec},
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.canon.dart': decodedMatches(allOf([
            isNot(contains('guard(')),
            isNot(contains('CachedGate')),
            contains('get covered =>'),
          ])),
        },
      ));

  test('a nested regency splices; merges emit NO wiring (the runtime owns it)',
      () => testBuilder(
        PartBuilder([CanonGenerator()], '.canon.dart'),
        {...assets, 'pkg|lib/spec.dart': _nestedSpec},
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.canon.dart': decodedMatches(allOf([
            contains('get viewer =>'), // spliced from profileSegment
            contains('get users =>'),
            isNot(contains('.merge(')),
            isNot(contains('.mergeStore(')),
          ])),
        },
      ));

  test('a CRUD brick row names its store after the brick class',
      () => testBuilder(
        PartBuilder([CanonGenerator()], '.canon.dart'),
        {...assets, 'pkg|lib/spec.dart': _brickSpec},
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.canon.dart': decodedMatches(allOf([
            contains('StoreMemory<String, Order, Msg> get orders =>'),
            contains('at(const OrdersCrud().store)'),
          ])),
        },
      ));

  Future<String> guardLogs(String spec) async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {...assets, 'pkg|lib/spec.dart': spec},
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      onLog: (r) => logs.add('${r.message}'),
    );
    return logs.join('\n');
  }

  test('rejects a store whose key type disagrees with its entity node',
      () async {
    expect(await guardLogs(_mismatchSpec),
        allOf(contains('keys as'), contains("store's key type is `int`")));
  });

  test('an ownership edge emits surgical tree ops on the parent map', () =>
      testBuilder(
        PartBuilder([EntitiesGenerator()], '.canon.dart'),
        {...assets, 'pkg|lib/spec.dart': '$_guardBase'},
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.canon.dart': decodedMatches(allOf([
            contains('extension ReviewStateTreeOps'
                ' on IdentifiableMap<String, ReviewState>'),
            contains('updateComment('),
            contains('o.copyWith(comments: o.comments.updateById(id, fn))'),
            contains('addComment('),
            contains('removeComment('),
          ]))
        },
      ));

  test('rejects a store on an OWNED entity — state lives in its root', () async {
    expect(await guardLogs(_ownedStoreSpec),
        allOf(contains('OWNED'), contains('root entity')));
  });

  test('rejects a store whose entity is no @entities row', () async {
    expect(await guardLogs(_unknownEntitySpec),
        allOf(contains('OrphanState'), contains('@entities')));
  });

  test('rejects a registry whose message type is not sealed', () async {
    expect(await guardLogs(_unsealedMsgSpec),
        allOf(contains('ReviewMsg'), contains('sealed')));
  });

  test('rejects the retired @regents enum with the migration pointer', () async {
    expect(await guardLogs(_retiredEnumSpec),
        allOf(contains('retired'), contains('Regency({...}')));
  });

  test('rejects a guard reading a regent no row holds', () async {
    expect(await guardLogs(_strangerReadSpec),
        allOf(contains('CachedGate'), contains('no row')));
  });
}
