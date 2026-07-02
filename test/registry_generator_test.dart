import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:canon_generator/canon_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

// ledger owns the @stores grammar + the Store base the generator recognises.
const _ledgerStub = '''
class Stores { const Stores(); }
const stores = Stores();
mixin StoreNode<Self extends StoreNode<Self, Ids>, Ids> on Enum {
  Ids get key;
}
abstract class Store<K, E, M> { const Store(); }
''';

// identifiable owns the @IDs grammar + IdNode/CompositeId.
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

// An @ids enum (hand-written id-space) + stores keyed by its nodes. Each node's
// codec value-type MATCHES the held descriptor's key type.
const _spec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum Ids {
  author(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class ReviewState {}
sealed class ReviewMsg {}
class Review extends Store<String, ReviewState, ReviewMsg> {
  const Review();
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
enum _Stores with StoreNode<_Stores, Ids> {
  review(Review(), Ids.author);

  const _Stores(this.store, this.key);
  final Object store;
  @override
  final Ids key;
}
''';

// Same shape but the key type (int) disagrees with the id-node's codec
// value-type (String) — the cross-tree guard must reject it.
const _mismatchSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum Ids {
  author(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class ReviewState {}
sealed class ReviewMsg {}
class Review extends Store<int, ReviewState, ReviewMsg> {
  const Review();
}

@stores
enum _Stores with StoreNode<_Stores, Ids> {
  review(Review(), Ids.author);

  const _Stores(this.store, this.key);
  final Object store;
  @override
  final Ids key;
}
''';

// A registry whose message type is NOT sealed — the reduce can't be exhaustive,
// so the generator must reject it at build time.
const _unsealedMsgSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum Ids {
  author(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class ReviewState {}
class ReviewMsg {}
class Review extends Store<String, ReviewState, ReviewMsg> {
  const Review();
}

@stores
enum _Stores with StoreNode<_Stores, Ids> {
  review(Review(), Ids.author);

  const _Stores(this.store, this.key);
  final Object store;
  @override
  final Ids key;
}
''';

// An @IDs enum with atomic rows, a composite row, and a static composite —
// each atomic node emits a zero-cost extension type; composites emit typed
// record aliases.
const _idsSpec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

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
        PartBuilder([IdsGenerator()], '.nav.dart'),
        {
          'ledger|lib/ledger.dart': _ledgerStub,
          'identifiable|lib/identifiable.dart': _identifiableStub,
          'canon|lib/canon.dart': _canonStub,
          'pkg|lib/spec.dart': _idsSpec,
        },
        rootPackage: 'pkg',
        generateFor: {'pkg|lib/spec.dart'},
        outputs: {
          'pkg|lib/spec.nav.dart': decodedMatches(allOf([
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
            PartBuilder([RegistryGenerator()], '.nav.dart'),
            {
              'ledger|lib/ledger.dart': _ledgerStub,
              'canon|lib/canon.dart': _canonStub,
              'pkg|lib/spec.dart': _spec,
            },
            rootPackage: 'pkg',
            generateFor: {'pkg|lib/spec.dart'},
            outputs: {
              'pkg|lib/spec.nav.dart': decodedMatches(allOf([
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

  test('rejects a store whose key type disagrees with its @ids node', () async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'ledger|lib/ledger.dart': _ledgerStub,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': _mismatchSpec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      onLog: (r) => logs.add('${r.message}'),
    );
    expect(logs.join('\n'),
        allOf(contains('id-node and the'), contains('must agree')));
  });

  test('rejects a registry whose message type is not sealed', () async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'ledger|lib/ledger.dart': _ledgerStub,
        'canon|lib/canon.dart': _canonStub,
        'pkg|lib/spec.dart': _unsealedMsgSpec,
      },
      rootPackage: 'pkg',
      generateFor: {'pkg|lib/spec.dart'},
      onLog: (r) => logs.add('${r.message}'),
    );
    expect(logs.join('\n'),
        allOf(contains('ReviewMsg'), contains('sealed')));
  });
}
