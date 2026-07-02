import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:canon_generator/canon_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

// ledger owns the @stores grammar + the Store base the generator recognises.
const _ledgerStub = '''
class Stores { const Stores(); }
const stores = Stores();
mixin StoreNode<Self extends StoreNode<Self>> on Enum {
  Store get store;
}
abstract class Store<K, E, M> { const Store(); }
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
  IdNode get key;
  EntityTreeNode call([Set<EntityTreeNode> children = const {}]) =>
      EntityBranch(this, children);
}
class EntityBranch implements EntityTreeNode {
  EntityBranch(this.entity, this.children);
  final Enum entity;
  final Set<EntityTreeNode> children;
}
class EntityGraph {
  EntityGraph(this.tree);
  final Set<EntityTreeNode> tree;
}
''';

// canon is the facade — re-exports ledger + identifiable, so the spec imports only
// `package:canon/canon.dart` and gets the nav grammar, `@stores`, and the engines.
const _canonStub = '''
export 'package:ledger/ledger.dart';
export 'package:identifiable/identifiable.dart';

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
// ownership graph), and @stores holding only the reduces — key node, key type,
// and screen association all DERIVE through the store's entity type.
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

@stores
enum _Stores with StoreNode<_Stores> {
  review(Review());

  const _Stores(this.store);
  @override
  final Store store;
}
''';

// The shared scaffolding of the guard specs: id node + entity space; each
// spec below appends its own Review store + @stores enum.
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

@stores
enum _Stores with StoreNode<_Stores> {
  review(Review());
  const _Stores(this.store);
  @override
  final Store store;
}
''';

// A registry whose message type is NOT sealed — the reduce can't be exhaustive,
// so the generator must reject it at build time.
const _unsealedMsgSpec = '''
$_guardBase
class ReviewMsg {}
class Review extends Store<String, ReviewState, ReviewMsg> {
  const Review();
}

@stores
enum _Stores with StoreNode<_Stores> {
  review(Review());
  const _Stores(this.store);
  @override
  final Store store;
}
''';

// A store on an OWNED entity — comment lives inside review's aggregate, so a
// store of its own is illegal.
const _ownedStoreSpec = '''
$_guardBase
sealed class CommentMsg {}
class Comments extends Store<String, CommentState, CommentMsg> {
  const Comments();
}

@stores
enum _Stores with StoreNode<_Stores> {
  comments(Comments());
  const _Stores(this.store);
  @override
  final Store store;
}
''';

// A store of a type that is no @entities row at all.
const _unknownEntitySpec = '''
$_guardBase
class OrphanState {}
sealed class OrphanMsg {}
class Orphans extends Store<String, OrphanState, OrphanMsg> {
  const Orphans();
}

@stores
enum _Stores with StoreNode<_Stores> {
  orphans(Orphans());
  const _Stores(this.store);
  @override
  final Store store;
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

void main() {
  test('@IDs emits extension types + composite typedefs', () => testBuilder(
        PartBuilder([IdsGenerator()], '.canon.dart'),
        {
          'ledger|lib/ledger.dart': _ledgerStub,
          'identifiable|lib/identifiable.dart': _identifiableStub,
          'canon|lib/canon.dart': _canonStub,
          'pkg|lib/spec.dart': _idsSpec,
        },
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.canon.dart': decodedMatches(allOf([
            contains('extension type const ProductId(String _) implements String {'),
            contains('extension type const AuthorId(String _) implements String {'),
            // the back-link: type → grammar node (codec rides on it)
            contains('static const Ids node = Ids.product;'),
            contains('static const Ids node = Ids.author;'),
            contains('typedef ReviewId = (ProductId, AuthorId);'),
            contains('typedef OrderId = (ProductId, AuthorId);'),
          ]))
        },
      ));

  test('emits a typed Data surface; key type follows the @ids node codec',
      () => testBuilder(
            PartBuilder([RegistryGenerator()], '.canon.dart'),
            {
              'ledger|lib/ledger.dart': _ledgerStub,
              'identifiable|lib/identifiable.dart': _identifiableStub,
              'canon|lib/canon.dart': _canonStub,
              'pkg|lib/spec.dart': _spec,
            },
            rootPackage: 'pkg',
            generateFor: {'pkg|lib/spec.dart'},
            outputs: {
              'pkg|lib/spec.canon.dart': decodedMatches(allOf([
                // one api: a global `ledger` + the public per-row store globals
                contains('final ledger = Ledger();'),
                contains('extension on Ledger {'),
                contains('void bind() {'),
                contains(
                    'late final StoreMemory<String, ReviewState, ReviewMsg> reviewStore;'),
                contains('reviewStore = store('), // bind uses this.registry
                // StoreMemory IS the read surface — no `review(key)` sugar
                isNot(contains('ReviewState? review(String key)')),
                // derived screen↔store association: profile shares Ids.author
                contains('ReviewState? reviewOnProfile()'),
                contains('e.screen == _Screens.profile'),
                contains('reviewStore[e.id as String]'),
                // home has no id-node → no accessors at all
                isNot(contains('OnHome')),
              ]))
            },
          ));

  Future<String> guardLogs(String spec) async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'ledger|lib/ledger.dart': _ledgerStub,
        'identifiable|lib/identifiable.dart': _identifiableStub,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': spec,
      },
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
        {
          'ledger|lib/ledger.dart': _ledgerStub,
          'identifiable|lib/identifiable.dart': _identifiableStub,
          'canon|lib/canon.dart': _canonStub,
          'pkg|lib/spec.dart': '$_guardBase',
        },
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
}
