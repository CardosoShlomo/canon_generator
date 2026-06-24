// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'nav.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: invalid_use_of_internal_member
Object? _idOf(Enum s) =>
    _Screens.graph.stack.lastWhere((e) => e.screen == s).id;
bool _chainIs(List<Enum> a, List<Enum> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

final class Screen<I> {
  const Screen._(this.spec);
  final Enum spec;
  String get name => spec.name;
  static const splash = Screen<Never>._(_Screens.splash);
  static const signIn = Screen<Never>._(_Screens.signIn);
  static const home = Screen<Never>._(_Screens.home);
  static const feed = Screen<Never>._(_Screens.feed);
  static const profile = Screen<Never>._(_Screens.profile);
  static const item = Screen<String>._(_Screens.item);
  static const editItem = Screen<String>._(_Screens.editItem);
  static const settings = Screen<Never>._(_Screens.settings);
  static const about = Screen<Never>._(_Screens.about);
  static const account = Screen<String>._(_Screens.account);
  static const editAccount = Screen<String>._(_Screens.editAccount);
  static Screen<Object?> forSpec(Enum spec) => _bySpec[spec]!;

  /// Reactive: whether the active placement chain currently includes
  /// [screen] (on/at). The widget rebuilds only when that flips —
  /// robust-aspect, like `Query.of`/`Fragment.of`.
  static bool of(BuildContext context, Enum screen) =>
      Placement.isOn(context, screen);
  static const _bySpec = <Enum, Screen<Object?>>{
    BootScreen.initial: Screen<Never>._(BootScreen.initial),
    _Screens.splash: splash,
    _Screens.signIn: signIn,
    _Screens.home: home,
    _Screens.feed: feed,
    _Screens.profile: profile,
    _Screens.item: item,
    _Screens.editItem: editItem,
    _Screens.settings: settings,
    _Screens.about: about,
    _Screens.account: account,
    _Screens.editAccount: editAccount,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Screens.graph.stack) NavEntry(forSpec(e.screen), e.id),
  ]);

  /// The active top screen's QUERY view-state, read-only and
  /// context-free (the headless peer of `Query.of(context, ...)`).
  static Map<String, Object?> get query => _Screens.graph.activeView('q');

  /// The active top screen's FRAGMENT view-state, read-only and
  /// context-free.
  static Map<String, Object?> get fragment => _Screens.graph.activeView('f');
  static const _treeSignature =
      'feedK(item(editItem()));homeK(item(editItem()),settings(about()));profileK(account(editAccount()),settings(about()));signIn();splash()';

  /// True when this generated code still matches the live tree.
  /// Assert it in a test to fail CI on a stale (un-regenerated) tree:
  /// `test('nav codegen fresh', () => expect(Screen.isCodegenFresh, true));`
  static bool get isCodegenFresh =>
      _Screens.graph.structureSignature == _treeSignature;
  static final bool _fresh = () {
    assert(
      isCodegenFresh,
      'canon: the navigation tree changed but generated code is stale — run build_runner.',
    );
    return true;
  }();
  static NavDelegate get delegate {
    assert(_fresh);
    return _Screens.graph.delegate;
  }

  /// The URL-driven host for `MaterialApp.router(routerConfig:
  /// Screen.routerConfig)` — browser history + cold-start links via
  /// the nav-mirror. Use [manager] instead for a Router-less
  /// `MaterialApp(home: ...)` (no URL channel).
  static RouterConfig<Object> get routerConfig {
    assert(_fresh);
    return RouterConfig(
      routerDelegate: _Screens.graph.delegate,
      routeInformationParser: const CanonRouteParser(),
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(
          uri: Uri.parse(
            WidgetsBinding.instance.platformDispatcher.defaultRouteName,
          ),
        ),
      ),
    );
  }

  /// A standalone nav host for `MaterialApp(home: ...)` — no Router,
  /// no URL/deep-link channel. Owns system back and snapshot
  /// restoration (always on; override [restorationId] only to avoid a
  /// storage-key collision).
  static Widget manager({String restorationId = 'nav'}) {
    assert(_fresh);
    return _Screens.graph.manager(restorationId: restorationId);
  }

  /// A restoration-serializable snapshot of the whole nav state
  /// (no URLs; ids via each screen codec). Persist + [restore] it.
  static Map<String, Object?> snapshot() => _Screens.graph.toState();

  /// Rebuilds the stack from a [snapshot], best-effort. Returns
  /// false on a stale/incompatible snapshot.
  static bool restore(Map<String, Object?> state) =>
      _Screens.graph.restore(state);
  static KickstartNav go<N extends AnyNav>(Hop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id);
    return const KickstartNav._();
  }

  /// If the live stack ends with this selector path (every pinned id and,
  /// for a cyclic terminal, its depth matching), its nav — else null.
  static N? on<N extends AnyNav>(On<N> which) {
    if (which is OnParentOf) {
      return (which as OnParentOf).parents.contains(_Screens.graph.current)
          ? which.nav
          : null;
    }
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    return which.nav;
  }

  /// Live-stack redirect: the chained verb REPLACES the current history
  /// entry instead of pushing. Decide it at the start —
  /// `Screen.replace.goHome()`, `Screen.replace.on(.user)?.goChat(id)`.
  static const replace = Replace._();

  /// The current EXACT placement nav — pattern-match it:
  /// `if (Screen.at case HomeUserProfileNav n) ...`.
  static AnyNav get at => switch (_Screens.graph.current) {
    _Screens.splash => const SplashNav._(),
    _Screens.signIn => const SignInNav._(),
    _Screens.home => const HomeNav._(),
    _Screens.feed => const FeedNav._(),
    _Screens.profile => const ProfileNav._(),
    _Screens.item => (const ItemNav._()).at as AnyNav,
    _Screens.editItem => (const EditItemNav._()).at as AnyNav,
    _Screens.settings => (const SettingsNav._()).at as AnyNav,
    _Screens.about => (const AboutNav._()).at as AnyNav,
    _Screens.account => const AccountNav._(),
    _Screens.editAccount => const EditAccountNav._(),
    BootScreen.initial => const Initial._(),
    _ => throw StateError('not a _Screens screen'),
  };

  /// The cold-start link (already parsed), or null off the web,
  /// warm, or when the URL is not a representable link.
  static Link? get initialUrl {
    final u = _Screens.graph.bootUrl;
    return u == null ? null : parseLink(u)?.link;
  }

  /// The poppable handle if the active top is a non-root placement,
  /// else null (at a scope root). `.at` = current placement; `.pop()`
  /// executes the guaranteed pop and returns the destination.
  static CanPopNav? get canPop =>
      _Screens.graph.currentChain.length > 1 ? const CanPopNav._() : null;

  /// Documented sugar for `canPop?.pop()` — pops the active top if any,
  /// returns where it landed, or null at a root. Never throws.
  static PopDestNav? pop() => canPop?.pop();

  /// Side-effect listener fired after each navigation commits (new top
  /// settled, before its transition animates). Wire it where state lives
  /// (e.g. a provider); returns a disposer. Pure observation.
  static void Function() observe(
    void Function(Screen<Object?> from, Screen<Object?> to) fn,
  ) => _Screens.graph.observe((f, t) => fn(forSpec(f), forSpec(t)));

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);
  static void forget(Keep keep) => _Screens.graph.forget(keep.spec);
  static SplashNav goSplash() {
    _Screens.graph.go(_Screens.splash);
    return const SplashNav._();
  }

  static SignInNav goSignIn() {
    _Screens.graph.go(_Screens.signIn);
    return const SignInNav._();
  }

  static HomeNav goHome() {
    _Screens.graph.go(_Screens.home);
    return const HomeNav._();
  }

  static FeedNav goFeed() {
    _Screens.graph.go(_Screens.feed);
    return const FeedNav._();
  }

  static ProfileNav goProfile() {
    _Screens.graph.go(_Screens.profile);
    return const ProfileNav._();
  }

  static AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.account, id);
    return const AccountNav._();
  }

  static EditAccountNav goEditAccount(String id) {
    _Screens.graph.go(_Screens.account, id);
    _Screens.graph.go(_Screens.editAccount, id, true);
    return const EditAccountNav._();
  }
}

/// The `Screen.replace` redirect facade — every verb mirrors `Screen`
/// but commits as a history REPLACE (web `replaceState`).
final class Replace {
  const Replace._();
  KickstartNav go<N extends AnyNav>(Hop<N> hop) {
    _Screens.graph.markReplace();
    return Screen.go(hop);
  }

  /// Scoped redirect — replace is decided here, before scoping; a miss
  /// (null) commits nothing, so the pending flag is dropped, not leaked.
  N? on<N extends AnyNav>(On<N> which) {
    _Screens.graph.markReplace();
    return Screen.on(which);
  }

  SplashNav goSplash() {
    _Screens.graph.markReplace();
    return Screen.goSplash();
  }

  SignInNav goSignIn() {
    _Screens.graph.markReplace();
    return Screen.goSignIn();
  }

  HomeNav goHome() {
    _Screens.graph.markReplace();
    return Screen.goHome();
  }

  FeedNav goFeed() {
    _Screens.graph.markReplace();
    return Screen.goFeed();
  }

  ProfileNav goProfile() {
    _Screens.graph.markReplace();
    return Screen.goProfile();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.markReplace();
    return Screen.goAccount(id);
  }

  EditAccountNav goEditAccount(String id) {
    _Screens.graph.markReplace();
    return Screen.goEditAccount(id);
  }
}

/// One committed navigation as typed [ScreenEntry] stacks.
final class ScreenNavigation {
  ScreenNavigation._(this._n);
  final Navigation _n;
  List<ScreenEntry> get from => [for (final e in _n.from) _entryOf(e.$1, e.$2)];
  List<ScreenEntry> get to => [for (final e in _n.to) _entryOf(e.$1, e.$2)];
  ScreenEntry get source => _entryOf(_n.source.$1, _n.source.$2);
  ScreenEntry get destination => _entryOf(_n.destination.$1, _n.destination.$2);
  NavDirection get direction => _n.direction;
  bool get isForward => _n.isForward;
  bool get isBackward => _n.isBackward;
  bool get isRoundTrip => _n.isRoundTrip;
  bool get isJump => _n.isJump;
}

/// One typed entry per screen — `switch` it for the screen-specific id.
sealed class ScreenEntry {
  const ScreenEntry();
}

final class SplashEntry extends ScreenEntry {
  const SplashEntry();
}

final class SignInEntry extends ScreenEntry {
  const SignInEntry();
}

final class HomeEntry extends ScreenEntry {
  const HomeEntry();
}

final class FeedEntry extends ScreenEntry {
  const FeedEntry();
}

final class ProfileEntry extends ScreenEntry {
  const ProfileEntry();
}

final class ItemEntry extends ScreenEntry {
  const ItemEntry(this.id);
  final String id;
}

final class EditItemEntry extends ScreenEntry {
  const EditItemEntry(this.id);
  final String id;
}

final class SettingsEntry extends ScreenEntry {
  const SettingsEntry();
}

final class AboutEntry extends ScreenEntry {
  const AboutEntry();
}

final class AccountEntry extends ScreenEntry {
  const AccountEntry(this.id);
  final String id;
}

final class EditAccountEntry extends ScreenEntry {
  const EditAccountEntry(this.id);
  final String id;
}

ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.splash => const SplashEntry(),
  _Screens.signIn => const SignInEntry(),
  _Screens.home => const HomeEntry(),
  _Screens.feed => const FeedEntry(),
  _Screens.profile => const ProfileEntry(),
  _Screens.item => ItemEntry(id as String),
  _Screens.editItem => EditItemEntry(id as String),
  _Screens.settings => const SettingsEntry(),
  _Screens.about => const AboutEntry(),
  _Screens.account => AccountEntry(id as String),
  _Screens.editAccount => EditAccountEntry(id as String),
  _ => throw StateError('not a _Screens screen'),
};

final class Hop<N extends AnyNav> {
  const Hop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const splash = Hop<SplashNav>._(_Screens.splash, null, SplashNav._());
  static const signIn = Hop<SignInNav>._(_Screens.signIn, null, SignInNav._());
  static const home = Hop<HomeNav>._(_Screens.home, null, HomeNav._());
  static const feed = Hop<FeedNav>._(_Screens.feed, null, FeedNav._());
  static const profile = Hop<ProfileNav>._(
    _Screens.profile,
    null,
    ProfileNav._(),
  );
  static Hop<AccountNav> account(String id) =>
      Hop._(_Screens.account, id, const AccountNav._());
}

/// The boot placement: `Screen.at` returns it until the first commit.
/// `if (Screen.at case Initial()) ...` gates blob-null cold-boot UI.
final class Initial extends AnyNav {
  const Initial._() : super._();
}

final class On<N extends AnyNav> {
  const On._(this.specs, this.ids, this.nav);
  final List<Enum> specs;
  final List<Object?> ids;
  final N nav;
  static On<SplashNav> get splash =>
      const On._([_Screens.splash], [null], SplashNav._());
  static On<SignInNav> get signIn =>
      const On._([_Screens.signIn], [null], SignInNav._());
  static OnHome get home =>
      const OnHome._([_Screens.home], [null], HomeNav._());
  static OnFeed get feed =>
      const OnFeed._([_Screens.feed], [null], FeedNav._());
  static OnProfile get profile =>
      const OnProfile._([_Screens.profile], [null], ProfileNav._());
  static OnItem get item =>
      const OnItem._([_Screens.item], [null], ItemNav._());
  static OnEditItem get editItem =>
      const OnEditItem._([_Screens.editItem], [null], EditItemNav._());
  static OnSettings get settings =>
      const OnSettings._([_Screens.settings], [null], SettingsNav._());
  static On<AboutNav> get about =>
      const On._([_Screens.about], [null], AboutNav._());
  static OnAccount get account =>
      const OnAccount._([_Screens.account], [null], AccountNav._());
  static OnEditAccount get editAccount =>
      const OnEditAccount._([_Screens.editAccount], [null], EditAccountNav._());

  /// Disambiguating push onto the current scope when a screen has
  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —
  /// `.parentOf` alone is not an `On`, so the bare form will not compile.
  static _ParentSel get parentOf => const _ParentSel._();
}

final class OnParentOf<N extends AnyNav> extends On<N> {
  const OnParentOf._(this.parents, N nav) : super._(const [], const [], nav);
  final Set<Enum> parents;
}

final class _ParentSel {
  const _ParentSel._();
  OnParentOf<ItemNavParent> get item => OnParentOf._(const {
    _Screens.feed,
    _Screens.home,
  }, const ItemNavParent._());
  OnParentOf<SettingsNavParent> get settings => OnParentOf._(const {
    _Screens.home,
    _Screens.profile,
  }, const SettingsNavParent._());
}

final class ItemNavParent extends AnyNav {
  const ItemNavParent._() : super._();
  ItemNav goItem(String id) {
    _Screens.graph.go(_Screens.item, id, true);
    return const ItemNav._();
  }
}

final class SettingsNavParent extends AnyNav {
  const SettingsNavParent._() : super._();
  SettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings, null, true);
    return const SettingsNav._();
  }
}

final class OnHome extends On<HomeNav> {
  const OnHome._(super.specs, super.ids, super.nav) : super._();
  OnHomeItem get item => OnHomeItem._(
    [...specs, _Screens.item],
    [...ids, null],
    const HomeItemNav._(),
  );
  OnHomeSettings get settings => OnHomeSettings._(
    [...specs, _Screens.settings],
    [...ids, null],
    const HomeSettingsNav._(),
  );
}

final class OnHomeItem extends On<HomeItemNav> {
  const OnHomeItem._(super.specs, super.ids, super.nav) : super._();
  OnHomeItem call(String id) =>
      OnHomeItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnHomeSettings extends On<HomeSettingsNav> {
  const OnHomeSettings._(super.specs, super.ids, super.nav) : super._();
  On<HomeSettingsAboutNav> get about => On._(
    [...specs, _Screens.about],
    [...ids, null],
    const HomeSettingsAboutNav._(),
  );
}

final class OnFeed extends On<FeedNav> {
  const OnFeed._(super.specs, super.ids, super.nav) : super._();
  OnFeedItem get item => OnFeedItem._(
    [...specs, _Screens.item],
    [...ids, null],
    const FeedItemNav._(),
  );
}

final class OnFeedItem extends On<FeedItemNav> {
  const OnFeedItem._(super.specs, super.ids, super.nav) : super._();
  OnFeedItem call(String id) =>
      OnFeedItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProfile extends On<ProfileNav> {
  const OnProfile._(super.specs, super.ids, super.nav) : super._();
  OnProfileSettings get settings => OnProfileSettings._(
    [...specs, _Screens.settings],
    [...ids, null],
    const ProfileSettingsNav._(),
  );
  OnAccount get account => OnAccount._(
    [...specs, _Screens.account],
    [...ids, null],
    const AccountNav._(),
  );
}

final class OnProfileSettings extends On<ProfileSettingsNav> {
  const OnProfileSettings._(super.specs, super.ids, super.nav) : super._();
  On<ProfileSettingsAboutNav> get about => On._(
    [...specs, _Screens.about],
    [...ids, null],
    const ProfileSettingsAboutNav._(),
  );
}

final class OnAccount extends On<AccountNav> {
  const OnAccount._(super.specs, super.ids, super.nav) : super._();
  OnAccount call(String id) =>
      OnAccount._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnItem extends On<ItemNav> {
  const OnItem._(super.specs, super.ids, super.nav) : super._();
  OnItem call(String id) =>
      OnItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnEditItem extends On<EditItemNav> {
  const OnEditItem._(super.specs, super.ids, super.nav) : super._();
  OnEditItem call(String id) =>
      OnEditItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnSettings extends On<SettingsNav> {
  const OnSettings._(super.specs, super.ids, super.nav) : super._();
  On<AboutNav> get about =>
      On._([...specs, _Screens.about], [...ids, null], const AboutNav._());
}

final class OnEditAccount extends On<EditAccountNav> {
  const OnEditAccount._(super.specs, super.ids, super.nav) : super._();
  OnEditAccount call(String id) =>
      OnEditAccount._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class CanPopPlacement {}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  CanPopPlacement get at => Screen.at as CanPopPlacement;
  PopDestNav pop() {
    _Screens.graph.pop();
    return const PopDestNav._();
  }
}

final class PopDestNav extends AnyNav {
  const PopDestNav._() : super._();
  PopDestPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.item]))
      return const HomeItemNav._();
    if (_chainIs(c, const [_Screens.feed, _Screens.item]))
      return const FeedItemNav._();
    if (_chainIs(c, const [_Screens.home, _Screens.settings]))
      return const HomeSettingsNav._();
    if (_chainIs(c, const [_Screens.profile, _Screens.settings]))
      return const ProfileSettingsNav._();
    if (_chainIs(c, const [_Screens.profile, _Screens.account]))
      return const AccountNav._();
    if (_chainIs(c, const [_Screens.home])) return const HomeNav._();
    if (_chainIs(c, const [_Screens.feed])) return const FeedNav._();
    if (_chainIs(c, const [_Screens.profile])) return const ProfileNav._();
    throw StateError('unresolved PopDestNav: $c');
  }
}

sealed class KickstartPlacement {}

final class KickstartNav extends AnyNav {
  const KickstartNav._() : super._();
  KickstartPlacement get at => Screen.at as KickstartPlacement;
}

final class Keep {
  const Keep._(this.spec);
  final Enum spec;
  static const feed = Keep._(_Screens.feed);
  static const home = Keep._(_Screens.home);
  static const profile = Keep._(_Screens.profile);
}

final class SplashNav extends AnyNav implements KickstartPlacement {
  const SplashNav._() : super._();
}

final class SignInNav extends AnyNav implements KickstartPlacement {
  const SignInNav._() : super._();
}

final class HomeNav extends AnyNav
    implements PopDestPlacement, KickstartPlacement {
  const HomeNav._() : super._();
  HomeItemNav goItem(String id) {
    _Screens.graph.go(_Screens.item, id, true);
    return const HomeItemNav._();
  }

  HomeSettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings, null, true);
    return const HomeSettingsNav._();
  }

  N go<N extends AnyNav>(HomeHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class HomeHop<N extends AnyNav> {
  const HomeHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static HomeHop<HomeItemNav> item(String id) =>
      HomeHop._(_Screens.item, id, const HomeItemNav._());
  static const settings = HomeHop<HomeSettingsNav>._(
    _Screens.settings,
    null,
    HomeSettingsNav._(),
  );
}

final class FeedNav extends AnyNav
    implements PopDestPlacement, KickstartPlacement {
  const FeedNav._() : super._();
  FeedItemNav goItem(String id) {
    _Screens.graph.go(_Screens.item, id, true);
    return const FeedItemNav._();
  }
}

final class ProfileNav extends AnyNav
    implements PopDestPlacement, KickstartPlacement {
  const ProfileNav._() : super._();
  ProfileSettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings, null, true);
    return const ProfileSettingsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.account, id, true);
    return const AccountNav._();
  }

  EditAccountNav goEditAccount(String id) {
    _Screens.graph.go(_Screens.account, id, true);
    _Screens.graph.go(_Screens.editAccount, id, true);
    return const EditAccountNav._();
  }

  N go<N extends AnyNav>(ProfileHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class ProfileHop<N extends AnyNav> {
  const ProfileHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const settings = ProfileHop<ProfileSettingsNav>._(
    _Screens.settings,
    null,
    ProfileSettingsNav._(),
  );
  static ProfileHop<AccountNav> account(String id) =>
      ProfileHop._(_Screens.account, id, const AccountNav._());
}

final class ItemNav extends AnyNav {
  const ItemNav._() : super._();
  ItemPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.item]))
      return const HomeItemNav._();
    if (_chainIs(c, const [_Screens.feed, _Screens.item]))
      return const FeedItemNav._();
    throw StateError('unresolved item placement: $c');
  }

  EditItemNav goEditItem() {
    _Screens.graph.go(_Screens.editItem, _idOf(_Screens.item), true);
    return const EditItemNav._();
  }
}

sealed class ItemPlacement {}

final class HomeItemNav extends AnyNav
    implements ItemPlacement, CanPopPlacement, PopDestPlacement {
  const HomeItemNav._() : super._();
  HomeItemEditItemNav goEditItem() {
    _Screens.graph.go(_Screens.editItem, _idOf(_Screens.item), true);
    return const HomeItemEditItemNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class FeedItemNav extends AnyNav
    implements ItemPlacement, CanPopPlacement, PopDestPlacement {
  const FeedItemNav._() : super._();
  FeedItemEditItemNav goEditItem() {
    _Screens.graph.go(_Screens.editItem, _idOf(_Screens.item), true);
    return const FeedItemEditItemNav._();
  }

  FeedNav pop() {
    _Screens.graph.pop();
    return const FeedNav._();
  }
}

final class ItemEditItemNav extends AnyNav implements EditItemUnder {
  const ItemEditItemNav._() : super._();
  ItemEditItemPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.item, _Screens.editItem]))
      return const HomeItemEditItemNav._();
    if (_chainIs(c, const [_Screens.feed, _Screens.item, _Screens.editItem]))
      return const FeedItemEditItemNav._();
    throw StateError('unresolved editItem placement: $c');
  }

  ItemNav pop() {
    _Screens.graph.pop();
    return const ItemNav._();
  }
}

final class EditItemNav extends AnyNav {
  const EditItemNav._() : super._();
  EditItemPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.item, _Screens.editItem]))
      return const HomeItemEditItemNav._();
    if (_chainIs(c, const [_Screens.feed, _Screens.item, _Screens.editItem]))
      return const FeedItemEditItemNav._();
    throw StateError('unresolved editItem placement: $c');
  }

  EditItemUnder get under {
    final c = _Screens.graph.currentChain;
    if (_endsWith(c, const [_Screens.item, _Screens.editItem]))
      return const ItemEditItemNav._();
    throw StateError('unresolved editItem under: $c');
  }

  ItemNav popToItem() {
    _Screens.graph.pop(_Screens.item);
    return const ItemNav._();
  }
}

sealed class EditItemPlacement {}

sealed class EditItemUnder {}

sealed class ItemEditItemPlacement {}

final class HomeItemEditItemNav extends AnyNav
    implements EditItemPlacement, ItemEditItemPlacement, CanPopPlacement {
  const HomeItemEditItemNav._() : super._();
  ItemNav pop() {
    _Screens.graph.pop();
    return const ItemNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeItemEditItemPop<N> to) {
    _Screens.graph.pop(to.spec);
    return to.nav;
  }
}

final class HomeItemEditItemPop<N extends AnyNav> {
  const HomeItemEditItemPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const item = HomeItemEditItemPop<HomeItemNav>._(
    _Screens.item,
    HomeItemNav._(),
  );
  static const home = HomeItemEditItemPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class FeedItemEditItemNav extends AnyNav
    implements EditItemPlacement, ItemEditItemPlacement, CanPopPlacement {
  const FeedItemEditItemNav._() : super._();
  ItemNav pop() {
    _Screens.graph.pop();
    return const ItemNav._();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  N popTo<N extends AnyNav>(FeedItemEditItemPop<N> to) {
    _Screens.graph.pop(to.spec);
    return to.nav;
  }
}

final class FeedItemEditItemPop<N extends AnyNav> {
  const FeedItemEditItemPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const item = FeedItemEditItemPop<FeedItemNav>._(
    _Screens.item,
    FeedItemNav._(),
  );
  static const feed = FeedItemEditItemPop<FeedNav>._(
    _Screens.feed,
    FeedNav._(),
  );
}

final class SettingsNav extends AnyNav {
  const SettingsNav._() : super._();
  SettingsPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.settings]))
      return const HomeSettingsNav._();
    if (_chainIs(c, const [_Screens.profile, _Screens.settings]))
      return const ProfileSettingsNav._();
    throw StateError('unresolved settings placement: $c');
  }

  AboutNav goAbout() {
    _Screens.graph.go(_Screens.about, null, true);
    return const AboutNav._();
  }
}

sealed class SettingsPlacement {}

final class HomeSettingsNav extends AnyNav
    implements SettingsPlacement, CanPopPlacement, PopDestPlacement {
  const HomeSettingsNav._() : super._();
  HomeSettingsAboutNav goAbout() {
    _Screens.graph.go(_Screens.about, null, true);
    return const HomeSettingsAboutNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class ProfileSettingsNav extends AnyNav
    implements SettingsPlacement, CanPopPlacement, PopDestPlacement {
  const ProfileSettingsNav._() : super._();
  ProfileSettingsAboutNav goAbout() {
    _Screens.graph.go(_Screens.about, null, true);
    return const ProfileSettingsAboutNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class SettingsAboutNav extends AnyNav implements AboutUnder {
  const SettingsAboutNav._() : super._();
  SettingsAboutPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.settings, _Screens.about]))
      return const HomeSettingsAboutNav._();
    if (_chainIs(c, const [
      _Screens.profile,
      _Screens.settings,
      _Screens.about,
    ]))
      return const ProfileSettingsAboutNav._();
    throw StateError('unresolved about placement: $c');
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class AboutNav extends AnyNav {
  const AboutNav._() : super._();
  AboutPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.home, _Screens.settings, _Screens.about]))
      return const HomeSettingsAboutNav._();
    if (_chainIs(c, const [
      _Screens.profile,
      _Screens.settings,
      _Screens.about,
    ]))
      return const ProfileSettingsAboutNav._();
    throw StateError('unresolved about placement: $c');
  }

  AboutUnder get under {
    final c = _Screens.graph.currentChain;
    if (_endsWith(c, const [_Screens.settings, _Screens.about]))
      return const SettingsAboutNav._();
    throw StateError('unresolved about under: $c');
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }
}

sealed class AboutPlacement {}

sealed class AboutUnder {}

sealed class SettingsAboutPlacement {}

final class HomeSettingsAboutNav extends AnyNav
    implements AboutPlacement, SettingsAboutPlacement, CanPopPlacement {
  const HomeSettingsAboutNav._() : super._();
  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeSettingsAboutPop<N> to) {
    _Screens.graph.pop(to.spec);
    return to.nav;
  }
}

final class HomeSettingsAboutPop<N extends AnyNav> {
  const HomeSettingsAboutPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const settings = HomeSettingsAboutPop<HomeSettingsNav>._(
    _Screens.settings,
    HomeSettingsNav._(),
  );
  static const home = HomeSettingsAboutPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class ProfileSettingsAboutNav extends AnyNav
    implements AboutPlacement, SettingsAboutPlacement, CanPopPlacement {
  const ProfileSettingsAboutNav._() : super._();
  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }

  ProfileNav popToProfile() {
    _Screens.graph.pop(_Screens.profile);
    return const ProfileNav._();
  }

  N popTo<N extends AnyNav>(ProfileSettingsAboutPop<N> to) {
    _Screens.graph.pop(to.spec);
    return to.nav;
  }
}

final class ProfileSettingsAboutPop<N extends AnyNav> {
  const ProfileSettingsAboutPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const settings = ProfileSettingsAboutPop<ProfileSettingsNav>._(
    _Screens.settings,
    ProfileSettingsNav._(),
  );
  static const profile = ProfileSettingsAboutPop<ProfileNav>._(
    _Screens.profile,
    ProfileNav._(),
  );
}

final class AccountNav extends AnyNav
    implements CanPopPlacement, PopDestPlacement, KickstartPlacement {
  const AccountNav._() : super._();
  EditAccountNav goEditAccount() {
    _Screens.graph.go(_Screens.editAccount, _idOf(_Screens.account), true);
    return const EditAccountNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class EditAccountNav extends AnyNav
    implements CanPopPlacement, KickstartPlacement {
  const EditAccountNav._() : super._();
  AccountNav pop() {
    _Screens.graph.pop();
    return const AccountNav._();
  }

  ProfileNav popToProfile() {
    _Screens.graph.pop(_Screens.profile);
    return const ProfileNav._();
  }

  N popTo<N extends AnyNav>(EditAccountPop<N> to) {
    _Screens.graph.pop(to.spec);
    return to.nav;
  }
}

final class EditAccountPop<N extends AnyNav> {
  const EditAccountPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const account = EditAccountPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const profile = EditAccountPop<ProfileNav>._(
    _Screens.profile,
    ProfileNav._(),
  );
}

extension type const ScreenId<I>._(Enum spec) {
  static const item = ScreenId<String>._(_Screens.item);
  static const editItem = ScreenId<String>._(_Screens.editItem);
  static const account = ScreenId<String>._(_Screens.account);
  static const editAccount = ScreenId<String>._(_Screens.editAccount);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen.forSpec(ScreenScope.of(this));
}

void verifyScreens() {
  assert(() {
    assert(
      _Screens.splash.id == null,
      'splash has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.signIn.id == null,
      'signIn has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.home.id == null,
      'home has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.feed.id == null,
      'feed has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.profile.id == null,
      'profile has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.item.id != null,
      'item is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.editItem.id != null,
      'editItem is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.settings.id == null,
      'settings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.about.id == null,
      'about has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.account.id != null,
      'account is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.editAccount.id != null,
      'editAccount is missing its id codec — rerun build_runner',
    );
    return true;
  }());
}

bool _endsWith(List<Enum> chain, List<Enum> suffix) {
  if (chain.length < suffix.length) return false;
  final off = chain.length - suffix.length;
  for (var i = 0; i < suffix.length; i++) {
    if (chain[off + i] != suffix[i]) return false;
  }
  return true;
}

/// A strict URL -> typed Link, from the tree's `.link` branches.
sealed class Link {
  const Link();
}

sealed class WidgetLink extends Link {
  const WidgetLink();
}

sealed class WidgetlessLink extends Link {
  const WidgetlessLink();
}

sealed class ItemLink implements Link {}

final class ItemMeLink extends WidgetlessLink implements ItemLink {
  const ItemMeLink();
}

final class ItemByIdLink extends WidgetlessLink implements ItemLink {
  const ItemByIdLink(this.itemId);
  final String itemId;
}

final class ItemByUsernameLink extends WidgetlessLink implements ItemLink {
  const ItemByUsernameLink(this.username);
  final String username;
}

/// A parsed [Link] plus the URL's origin (the host is reported,
/// not matched — the platform already verified it is ours).
final class ParsedLink {
  const ParsedLink(this.link, this.domain);
  final Link link;
  final String domain;
}

/// Parses [url] into a typed [Link] + origin, or null if not a link.
ParsedLink? parseLink(String url) {
  final m = _Screens.graph.parseLink(url);
  if (m == null) return null;
  final uri = Uri.parse(url);
  final link = switch (m.template) {
    'item/*' => switch (m.branches[0]) {
      0 => ItemMeLink(),
      1 => ItemByIdLink(m.path[0] as String),
      2 => ItemByUsernameLink(m.path[0] as String),
      _ => throw StateError('bad union branch'),
    },
    _ => null,
  };
  if (link == null) return null;
  return ParsedLink(link, '${uri.scheme}://${uri.host}');
}

/// Encodes a [Link] to a full URL under [domain].
String toUri(Link link, [String domain = 'https://canon.example']) {
  switch (link) {
    case ItemMeLink():
      return _Screens.graph.encodeLink(
        domain,
        'item/*',
        <Object?>['me'],
        <int>[0],
      );
    case ItemByIdLink(:final itemId):
      return _Screens.graph.encodeLink(
        domain,
        'item/*',
        <Object?>[itemId],
        <int>[1],
      );
    case ItemByUsernameLink(:final username):
      return _Screens.graph.encodeLink(
        domain,
        'item/*',
        <Object?>[username],
        <int>[2],
      );
  }
}

/// Screen-local query view-state for `feed` (read-only).
class FeedQuery {
  const FeedQuery._();
  String? get category =>
      _Screens.graph.viewGet(_Screens.feed, 'category') as String?;
  int? get radius => _Screens.graph.viewGet(_Screens.feed, 'radius') as int?;
}

/// Mutable [FeedQuery] — a setter per key (null clears / removes from URL).
final class FeedQueryMut extends FeedQuery {
  const FeedQueryMut._() : super._();
  set category(String? v) =>
      _Screens.graph.viewSet(_Screens.feed, 'category', v);
  set radius(int? v) => _Screens.graph.viewSet(_Screens.feed, 'radius', v);
}
