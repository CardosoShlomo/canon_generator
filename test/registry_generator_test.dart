import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:canon_generator/canon_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

// Flutter-free stub of canon's registries annotation + the data-engine types the
// generator recognises structurally (it never imports them).
const _registriesAnnotation = '''
class Registries { const Registries(); }
const registries = Registries();
mixin RegistryNode<Self extends RegistryNode<Self, Ids>, Ids> on Enum {
  Ids get key;
}
''';

const _canonStub = '''
export 'src/registries_annotation.dart';

abstract class Registry<S, M, K> { const Registry(); }
abstract class ConnectionRegistry<T, I, SK, M, K> { const ConnectionRegistry(); }

abstract class Codec<T> { const Codec(); }
class StringCodec extends Codec<String> { const StringCodec(); }
class PairCodec extends Codec<(String, String)> { const PairCodec(); }

class Screens { const Screens(); }
const screens = Screens();
mixin ScreenNode<S> on Enum {}
class NavGraph<S> {
  NavGraph();
  List<({Enum screen, Object? id})> get stack => const [];
  Stream<Object?> get navigations => const Stream.empty();
}
''';

// An @ids enum (hand-written id-space) + registries keyed by its nodes. Each
// node's codec value-type MATCHES the held registry's key type.
const _spec = '''
import 'package:canon/canon.dart';

part 'spec.nav.dart';

enum Ids {
  user(StringCodec()),
  adChat(PairCodec());
  const Ids(this.codec);
  final Codec codec;
}

class InterestState {}
class InterestMsg {}
class Interest extends Registry<InterestState, InterestMsg, String> {
  const Interest();
}

class ChatThread {}
class ChatMsg {}
class AdChat extends ConnectionRegistry<ChatThread, String, int, ChatMsg, (String, String)> {
  const AdChat();
}

@screens
enum _Screens with ScreenNode<_Screens> {
  home(null),
  profile(Ids.user),
  chat(Ids.adChat);

  const _Screens(this.id);
  final Ids? id;

  static final graph = NavGraph<_Screens>();
}

@registries
enum _Registries with RegistryNode<_Registries, Ids> {
  interest(Interest(), Ids.user),
  adChat(AdChat(), Ids.adChat);

  const _Registries(this.registry, this.key);
  final Object registry;
  @override
  final Ids key;
}
''';

// Same shape but the registry key type (int) disagrees with the id-node's codec
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
class InterestMsg {}
class Interest extends Registry<InterestState, InterestMsg, int> {
  const Interest();
}

@registries
enum _Registries with RegistryNode<_Registries, Ids> {
  interest(Interest(), Ids.user);

  const _Registries(this.registry, this.key);
  final Object registry;
  @override
  final Ids key;
}
''';

void main() {
  test('emits a typed Data surface; key type follows the @ids node codec',
      () => testBuilder(
            PartBuilder([RegistryGenerator()], '.nav.dart'),
            {
              'canon|lib/src/registries_annotation.dart': _registriesAnnotation,
              'canon|lib/canon.dart': _canonStub,
              'pkg|lib/spec.dart': _spec,
            },
            rootPackage: 'pkg',
            generateFor: {'pkg|lib/spec.dart'},
            outputs: {
              'pkg|lib/spec.nav.dart': decodedMatches(allOf([
                contains('abstract final class Data'),
                contains('static void bind(Ledger ledger)'),
                contains(
                    'RegistryStore<InterestState, InterestMsg, String> _interest'),
                contains('ledger.registry('),
                contains(
                    'static InterestState? interest(String key) => _interest[key];'),
                // transport hook so the app can wire the Door 2 fetch
                contains('static void onFetchInterest(Fetch<String> f) => _interest.onFetch(f);'),
                contains('ledger.connection('),
                contains('Stream<ConnectionView<ChatThread, int>>'),
                contains('_adChat.watch(key)'),
                // derived screen↔registry association: profile shares Ids.user
                contains('static InterestState? interestOnProfile()'),
                contains('e.screen == _Screens.profile'),
                contains('_interest[e.id as String]'),
                // Door 2 trigger + aggregator + commit subscription
                contains('static void surfaceInterestOnProfile()'),
                contains('_interest.surface(e.id as String)'),
                contains('static void surfaceLive()'),
                contains('_Screens.graph.navigations.listen((_) => surfaceLive())'),
                // connection association: chat shares Ids.adChat → watch read + surface
                contains('Stream<ConnectionView<ChatThread, int>>? adChatOnChat()'),
                contains('static void surfaceAdChatOnChat()'),
                contains('_adChat.surface(e.id as (String, String))'),
                // home has no id-node → no accessors at all
                isNot(contains('OnHome')),
              ]))
            },
          ));

  test('rejects a registry whose key type disagrees with its @ids node',
      () async {
    final logs = <String>[];
    await testBuilder(
      navBuilder(BuilderOptions.empty),
      {
        'canon|lib/src/registries_annotation.dart': _registriesAnnotation,
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
}
