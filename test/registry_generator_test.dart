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
  user(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class InterestState {}
sealed class InterestMsg {}
class Interest extends Store<String, InterestState, InterestMsg> {
  const Interest();
}

@screens
enum _Screens with ScreenNode<_Screens> {
  home(null),
  profile(Ids.user);

  const _Screens(this.id);
  final Ids? id;

  static final graph = NavGraph<_Screens>();
}

@stores
enum _Stores with StoreNode<_Stores, Ids> {
  interest(Interest(), Ids.user);

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
  user(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class InterestState {}
sealed class InterestMsg {}
class Interest extends Store<int, InterestState, InterestMsg> {
  const Interest();
}

@stores
enum _Stores with StoreNode<_Stores, Ids> {
  interest(Interest(), Ids.user);

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
  user(StringCodec());
  const Ids(this.codec);
  final Codec codec;
}

class InterestState {}
class InterestMsg {}
class Interest extends Store<String, InterestState, InterestMsg> {
  const Interest();
}

@stores
enum _Stores with StoreNode<_Stores, Ids> {
  interest(Interest(), Ids.user);

  const _Stores(this.store, this.key);
  final Object store;
  @override
  final Ids key;
}
''';

void main() {
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
                // one api: a global `ledger` + an extension on Ledger
                contains('final ledger = Ledger();'),
                contains('extension on Ledger {'),
                contains('void bind() {'),
                contains(
                    'StoreMemory<String, InterestState, InterestMsg>'),
                contains('_interest = store('), // bind uses this.registry
                contains(
                    'InterestState? interest(String key) => _interest[key];'),
                // derived screen↔store association: profile shares Ids.user
                contains('InterestState? interestOnProfile()'),
                contains('e.screen == _Screens.profile'),
                contains('_interest[e.id as String]'),
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
        allOf(contains('InterestMsg'), contains('sealed')));
  });
}
