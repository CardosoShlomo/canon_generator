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

  /// The current foreground as a read-only view, reactively — switch
  /// it to render per screen. Null when the current screen has no
  /// view-state. (`Placement.isOn`/`Placement.isCurrent` for raw checks.)
  static AnyView? of(BuildContext context) =>
      _viewOf(Placement.current(context));

  /// Reactive: is the screen THIS context is under the current foreground
  /// top? Rebuilds only when that flips. The self-vs-current gate —
  /// `if (Screen.isCurrentOf(context)) …` to act only while visible.
  static bool isCurrentOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));
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
  static N? on<N extends AnyNav, V>(On<N, V> which) {
    if (which is OnParentOf) {
      return (which as OnParentOf).parents.contains(_Screens.graph.current)
          ? which.nav
          : null;
    }
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (specs.isEmpty) {
      for (final c in which.conds) {
        if (!c.test(_Screens.graph.viewGet(_Screens.graph.current, c.key)))
          return null;
      }
      return _atOf(_Screens.graph.current) as N;
    }
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    for (final c in which.conds) {
      if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) return null;
    }
    return _atOf(specs.last) as N;
  }

  /// The placement if this selector path is anywhere on the live stack
  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.
  static N? at<N extends AnyNav, V>(On<N, V> which) {
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (which is OnParentOf) return null;
    if (specs.isEmpty) {
      for (final entry in st) {
        if (which.conds.every(
          (c) => c.test(_Screens.graph.viewGet(entry.screen, c.key)),
        )) {
          return _atOf(entry.screen) as N;
        }
      }
      return null;
    }
    outer:
    for (var e = st.length - 1; e >= specs.length - 1; e--) {
      final off = e - specs.length + 1;
      for (var i = 0; i < specs.length; i++) {
        if (st[off + i].screen != specs[i]) continue outer;
        final wid = which.ids[i];
        if (wid != null && st[off + i].id != wid) continue outer;
      }
      for (final c in which.conds) {
        if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) continue outer;
      }
      return _atOf(specs.last) as N;
    }
    return null;
  }

  /// The placement OWNING [context] (this widget's screen), reactive.
  static AnyPlacement ownerOf(BuildContext context) {
    Placement.isOn(context, ScreenScope.of(context));
    return _atOf(ScreenScope.of(context));
  }

  /// Is the screen owning [context] the current foreground? Reactive.
  static bool isForegroundOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));

  /// The read-only view of the screen owning [context] (or null if it
  /// has no view-state) — `switch` it for the typed view. Reactive.
  static AnyView? viewOf(BuildContext context) {
    Placement.isOn(context, ScreenScope.of(context));
    return _viewOf(ScreenScope.of(context));
  }

  /// Live-stack redirect: the chained verb REPLACES the current history
  /// entry instead of pushing. Decide it at the start —
  /// `Screen.replace.goHome()`, `Screen.replace.on(.user)?.goChat(id)`.
  static const replace = Replace._();

  /// The current foreground placement (the front), as the sealed
  /// [AnyPlacement] — `switch (Screen.current) { … }` is exhaustive.
  static AnyPlacement get current => _atOf(_Screens.graph.current);

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
  N? on<N extends AnyNav, V>(On<N, V> which) {
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

/// The boot placement: `Screen.current` returns it until the first commit.
/// `if (Screen.current case Initial()) ...` gates blob-null cold-boot UI.
final class Initial extends AnyPlacement {
  const Initial._() : super._();
}

final class On<N extends AnyNav, V> {
  const On._(this.specs, this.ids, this.nav, [this.conds = const []]);
  final List<Enum> specs;
  final List<Object?> ids;

  /// The exact nav for a single-placement terminal; null for a multi-
  /// placement one — `Screen.on` resolves it from the live chain.
  final N? nav;

  /// View-state conditions on the terminal screen (`.query`/`.fragment`).
  final List<ViewCond> conds;
  static On<SplashNav, AnyView> get splash =>
      On._([_Screens.splash], [null], const SplashNav._());
  static On<SignInNav, AnyView> get signIn =>
      On._([_Screens.signIn], [null], const SignInNav._());
  static OnHome get home =>
      OnHome._([_Screens.home], [null], const HomeNav._());
  static OnFeed get feed =>
      OnFeed._([_Screens.feed], [null], const FeedNav._());
  static OnProfile get profile =>
      OnProfile._([_Screens.profile], [null], const ProfileNav._());
  static OnItem get item => OnItem._([_Screens.item], [null], null);
  static OnEditItem get editItem =>
      OnEditItem._([_Screens.editItem], [null], null);
  static OnSettings get settings =>
      OnSettings._([_Screens.settings], [null], null);
  static On<AboutPlacement, AnyView> get about =>
      On._([_Screens.about], [null], null);
  static OnAccount get account =>
      OnAccount._([_Screens.account], [null], const AccountNav._());
  static OnEditAccount get editAccount =>
      OnEditAccount._([_Screens.editAccount], [null], const EditAccountNav._());

  /// GLOBAL query conditions, unbound to a screen — `context.on(.query(
  /// {…}))` (foreground) / `context.at(.query({…}))` (anywhere on stack).
  static On<AnyPlacement, AnyView> query(Set<QueryCond> cs) =>
      On._(const [], const [], null, [...cs]);

  /// Disambiguating push onto the current scope when a screen has
  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —
  /// `.parentOf` alone is not an `On`, so the bare form will not compile.
  static _ParentSel get parentOf => const _ParentSel._();
}

final class OnParentOf<N extends AnyNav, V> extends On<N, V> {
  const OnParentOf._(this.parents, N nav) : super._(const [], const [], nav);
  final Set<Enum> parents;
}

final class _ParentSel {
  const _ParentSel._();
  OnParentOf<ItemNavParent, ItemView> get item => OnParentOf._(const {
    _Screens.feed,
    _Screens.home,
  }, const ItemNavParent._());
  OnParentOf<SettingsNavParent, AnyView> get settings => OnParentOf._(const {
    _Screens.home,
    _Screens.profile,
  }, const SettingsNavParent._());
}

final class ItemNavParent extends AnyNav {
  const ItemNavParent._() : super._();
  ItemPlacement goItem(String id) {
    _Screens.graph.go(_Screens.item, id, true);
    return _atOf(_Screens.item) as ItemPlacement;
  }
}

final class SettingsNavParent extends AnyNav {
  const SettingsNavParent._() : super._();
  SettingsPlacement goSettings() {
    _Screens.graph.go(_Screens.settings, null, true);
    return _atOf(_Screens.settings) as SettingsPlacement;
  }
}

final class OnHome extends On<HomeNav, AnyView> {
  const OnHome._(super.specs, super.ids, super.nav, [super.conds]) : super._();
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

final class OnHomeItem extends On<HomeItemNav, ItemView> {
  const OnHomeItem._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnHomeItem query(Set<ItemQueryCond> cs) =>
      OnHomeItem._(specs, ids, nav, [...conds, ...cs]);
  OnHomeItem call(String id) =>
      OnHomeItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnHomeSettings extends On<HomeSettingsNav, AnyView> {
  const OnHomeSettings._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  On<HomeSettingsAboutNav, AnyView> get about => On._(
    [...specs, _Screens.about],
    [...ids, null],
    const HomeSettingsAboutNav._(),
  );
}

final class OnFeed extends On<FeedNav, FeedView> {
  const OnFeed._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnFeed query(Set<FeedQueryCond> cs) =>
      OnFeed._(specs, ids, nav, [...conds, ...cs]);
  OnFeedItem get item => OnFeedItem._(
    [...specs, _Screens.item],
    [...ids, null],
    const FeedItemNav._(),
  );
}

final class OnFeedItem extends On<FeedItemNav, ItemView> {
  const OnFeedItem._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnFeedItem query(Set<ItemQueryCond> cs) =>
      OnFeedItem._(specs, ids, nav, [...conds, ...cs]);
  OnFeedItem call(String id) =>
      OnFeedItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProfile extends On<ProfileNav, AnyView> {
  const OnProfile._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
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

final class OnProfileSettings extends On<ProfileSettingsNav, AnyView> {
  const OnProfileSettings._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  On<ProfileSettingsAboutNav, AnyView> get about => On._(
    [...specs, _Screens.about],
    [...ids, null],
    const ProfileSettingsAboutNav._(),
  );
}

final class OnAccount extends On<AccountNav, AnyView> {
  const OnAccount._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnAccount call(String id) =>
      OnAccount._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnItem extends On<ItemPlacement, ItemView> {
  const OnItem._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnItem query(Set<ItemQueryCond> cs) =>
      OnItem._(specs, ids, nav, [...conds, ...cs]);
  OnItem call(String id) =>
      OnItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnEditItem extends On<EditItemPlacement, AnyView> {
  const OnEditItem._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnEditItem call(String id) =>
      OnEditItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnSettings extends On<SettingsPlacement, AnyView> {
  const OnSettings._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  On<AboutPlacement, AnyView> get about =>
      On._([...specs, _Screens.about], [...ids, null], null);
}

final class OnEditAccount extends On<EditAccountNav, AnyView> {
  const OnEditAccount._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnEditAccount call(String id) =>
      OnEditAccount._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class AnyPlacement extends AnyNav {
  const AnyPlacement._() : super._();
}

AnyPlacement _atOf(Enum s) {
  final c = _Screens.graph.currentChain;
  final p = c.sublist(0, c.lastIndexOf(s) + 1);
  return switch (s) {
    _Screens.splash => const SplashNav._(),
    _Screens.signIn => const SignInNav._(),
    _Screens.home => const HomeNav._(),
    _Screens.feed => const FeedNav._(),
    _Screens.profile => const ProfileNav._(),
    _Screens.item => _resolveItemPlacement(p),
    _Screens.editItem => _resolveEditItemPlacement(p),
    _Screens.settings => _resolveSettingsPlacement(p),
    _Screens.about => _resolveAboutPlacement(p),
    _Screens.account => const AccountNav._(),
    _Screens.editAccount => const EditAccountNav._(),
    BootScreen.initial => const Initial._(),
    _ => throw StateError('not a _Screens screen'),
  };
}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class CanPopPlacement {}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  CanPopPlacement get at => Screen.current as CanPopPlacement;
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
  KickstartPlacement get at => Screen.current as KickstartPlacement;
}

final class Keep {
  const Keep._(this.spec);
  final Enum spec;
  static const feed = Keep._(_Screens.feed);
  static const home = Keep._(_Screens.home);
  static const profile = Keep._(_Screens.profile);
}

final class SplashNav extends AnyPlacement implements KickstartPlacement {
  const SplashNav._() : super._();
  SplashNav surface() {
    _Screens.graph.popTo(_Screens.splash);
    return const SplashNav._();
  }
}

final class SignInNav extends AnyPlacement implements KickstartPlacement {
  const SignInNav._() : super._();
  SignInNav surface() {
    _Screens.graph.popTo(_Screens.signIn);
    return const SignInNav._();
  }
}

final class HomeNav extends AnyPlacement
    implements PopDestPlacement, KickstartPlacement {
  const HomeNav._() : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  HomeItemNav goItem(String id) {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.item, id, true);
    return const HomeItemNav._();
  }

  HomeSettingsNav goSettings() {
    _Screens.graph.popTo(_Screens.home);
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

final class FeedNav extends AnyPlacement
    implements FeedView, PopDestPlacement, KickstartPlacement {
  const FeedNav._() : super._();
  FeedNav surface() {
    _Screens.graph.popTo(_Screens.feed);
    return const FeedNav._();
  }

  FeedQueryMut get query => const FeedQueryMut._();
  FeedNav get at => this;
  FeedItemNav goItem(String id) {
    _Screens.graph.popTo(_Screens.feed);
    _Screens.graph.go(_Screens.item, id, true);
    return const FeedItemNav._();
  }
}

final class ProfileNav extends AnyPlacement
    implements PopDestPlacement, KickstartPlacement {
  const ProfileNav._() : super._();
  ProfileNav surface() {
    _Screens.graph.popTo(_Screens.profile);
    return const ProfileNav._();
  }

  ProfileSettingsNav goSettings() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.settings, null, true);
    return const ProfileSettingsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.popTo(_Screens.profile);
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

ItemPlacement _resolveItemPlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.item]))
    return const HomeItemNav._();
  if (_chainIs(c, const [_Screens.feed, _Screens.item]))
    return const FeedItemNav._();
  throw StateError('unresolved item placement: $c');
}

sealed class ItemPlacement implements AnyPlacement {
  EditItemPlacement goEditItem();
  ItemPlacement surface();
  ItemQueryMut get query;
}

final class HomeItemNav extends AnyPlacement
    implements ItemPlacement, ItemView, CanPopPlacement, PopDestPlacement {
  const HomeItemNav._() : super._();
  HomeItemNav surface() {
    _Screens.graph.popTo(_Screens.item);
    return const HomeItemNav._();
  }

  ItemQueryMut get query => const ItemQueryMut._();
  ItemPlacement get at => this;
  HomeItemEditItemNav goEditItem() {
    _Screens.graph.popTo(_Screens.item);
    _Screens.graph.go(_Screens.editItem, _idOf(_Screens.item), true);
    return const HomeItemEditItemNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class FeedItemNav extends AnyPlacement
    implements ItemPlacement, ItemView, CanPopPlacement, PopDestPlacement {
  const FeedItemNav._() : super._();
  FeedItemNav surface() {
    _Screens.graph.popTo(_Screens.item);
    return const FeedItemNav._();
  }

  ItemQueryMut get query => const ItemQueryMut._();
  ItemPlacement get at => this;
  FeedItemEditItemNav goEditItem() {
    _Screens.graph.popTo(_Screens.item);
    _Screens.graph.go(_Screens.editItem, _idOf(_Screens.item), true);
    return const FeedItemEditItemNav._();
  }

  FeedNav pop() {
    _Screens.graph.pop();
    return const FeedNav._();
  }
}

EditItemPlacement _resolveEditItemPlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.item, _Screens.editItem]))
    return const HomeItemEditItemNav._();
  if (_chainIs(c, const [_Screens.feed, _Screens.item, _Screens.editItem]))
    return const FeedItemEditItemNav._();
  throw StateError('unresolved editItem placement: $c');
}

sealed class EditItemPlacement implements AnyPlacement {
  EditItemPlacement surface();
}

sealed class EditItemUnder {}

sealed class ItemEditItemPlacement implements AnyPlacement {
  ItemEditItemPlacement surface();
}

final class HomeItemEditItemNav extends AnyPlacement
    implements EditItemPlacement, ItemEditItemPlacement, CanPopPlacement {
  const HomeItemEditItemNav._() : super._();
  HomeItemEditItemNav surface() {
    _Screens.graph.popTo(_Screens.editItem);
    return const HomeItemEditItemNav._();
  }

  ItemPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.item) as ItemPlacement;
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeItemEditItemPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeItemEditItemPop<N extends AnyNav> {
  const HomeItemEditItemPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const item = HomeItemEditItemPop<ItemPlacement>._(_Screens.item, null);
  static const home = HomeItemEditItemPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class FeedItemEditItemNav extends AnyPlacement
    implements EditItemPlacement, ItemEditItemPlacement, CanPopPlacement {
  const FeedItemEditItemNav._() : super._();
  FeedItemEditItemNav surface() {
    _Screens.graph.popTo(_Screens.editItem);
    return const FeedItemEditItemNav._();
  }

  ItemPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.item) as ItemPlacement;
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  N popTo<N extends AnyNav>(FeedItemEditItemPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class FeedItemEditItemPop<N extends AnyNav> {
  const FeedItemEditItemPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const item = FeedItemEditItemPop<ItemPlacement>._(_Screens.item, null);
  static const feed = FeedItemEditItemPop<FeedNav>._(
    _Screens.feed,
    FeedNav._(),
  );
}

SettingsPlacement _resolveSettingsPlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.settings]))
    return const HomeSettingsNav._();
  if (_chainIs(c, const [_Screens.profile, _Screens.settings]))
    return const ProfileSettingsNav._();
  throw StateError('unresolved settings placement: $c');
}

sealed class SettingsPlacement implements AnyPlacement {
  AboutPlacement goAbout();
  SettingsPlacement surface();
}

final class HomeSettingsNav extends AnyPlacement
    implements SettingsPlacement, CanPopPlacement, PopDestPlacement {
  const HomeSettingsNav._() : super._();
  HomeSettingsNav surface() {
    _Screens.graph.popTo(_Screens.settings);
    return const HomeSettingsNav._();
  }

  HomeSettingsAboutNav goAbout() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.about, null, true);
    return const HomeSettingsAboutNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class ProfileSettingsNav extends AnyPlacement
    implements SettingsPlacement, CanPopPlacement, PopDestPlacement {
  const ProfileSettingsNav._() : super._();
  ProfileSettingsNav surface() {
    _Screens.graph.popTo(_Screens.settings);
    return const ProfileSettingsNav._();
  }

  ProfileSettingsAboutNav goAbout() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.about, null, true);
    return const ProfileSettingsAboutNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

AboutPlacement _resolveAboutPlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.settings, _Screens.about]))
    return const HomeSettingsAboutNav._();
  if (_chainIs(c, const [_Screens.profile, _Screens.settings, _Screens.about]))
    return const ProfileSettingsAboutNav._();
  throw StateError('unresolved about placement: $c');
}

sealed class AboutPlacement implements AnyPlacement {
  AboutPlacement surface();
}

sealed class AboutUnder {}

sealed class SettingsAboutPlacement implements AnyPlacement {
  SettingsAboutPlacement surface();
}

final class HomeSettingsAboutNav extends AnyPlacement
    implements AboutPlacement, SettingsAboutPlacement, CanPopPlacement {
  const HomeSettingsAboutNav._() : super._();
  HomeSettingsAboutNav surface() {
    _Screens.graph.popTo(_Screens.about);
    return const HomeSettingsAboutNav._();
  }

  SettingsPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.settings) as SettingsPlacement;
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeSettingsAboutPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeSettingsAboutPop<N extends AnyNav> {
  const HomeSettingsAboutPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const settings = HomeSettingsAboutPop<SettingsPlacement>._(
    _Screens.settings,
    null,
  );
  static const home = HomeSettingsAboutPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class ProfileSettingsAboutNav extends AnyPlacement
    implements AboutPlacement, SettingsAboutPlacement, CanPopPlacement {
  const ProfileSettingsAboutNav._() : super._();
  ProfileSettingsAboutNav surface() {
    _Screens.graph.popTo(_Screens.about);
    return const ProfileSettingsAboutNav._();
  }

  SettingsPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.settings) as SettingsPlacement;
  }

  ProfileNav popToProfile() {
    _Screens.graph.pop(_Screens.profile);
    return const ProfileNav._();
  }

  N popTo<N extends AnyNav>(ProfileSettingsAboutPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ProfileSettingsAboutPop<N extends AnyNav> {
  const ProfileSettingsAboutPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const settings = ProfileSettingsAboutPop<SettingsPlacement>._(
    _Screens.settings,
    null,
  );
  static const profile = ProfileSettingsAboutPop<ProfileNav>._(
    _Screens.profile,
    ProfileNav._(),
  );
}

final class AccountNav extends AnyPlacement
    implements CanPopPlacement, PopDestPlacement, KickstartPlacement {
  const AccountNav._() : super._();
  AccountNav surface() {
    _Screens.graph.popTo(_Screens.account);
    return const AccountNav._();
  }

  EditAccountNav goEditAccount() {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.editAccount, _idOf(_Screens.account), true);
    return const EditAccountNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class EditAccountNav extends AnyPlacement
    implements CanPopPlacement, KickstartPlacement {
  const EditAccountNav._() : super._();
  EditAccountNav surface() {
    _Screens.graph.popTo(_Screens.editAccount);
    return const EditAccountNav._();
  }

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
    return _atOf(to.spec) as N;
  }
}

final class EditAccountPop<N extends AnyNav> {
  const EditAccountPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
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

/// Read-only placement view — the reactive reads return these.
sealed class AnyView {}

/// GLOBAL query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class QueryCond<T> implements ViewCond {
  const QueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  QueryCond<T> call(T v) => QueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static QueryCond<String> get sort =>
      const QueryCond._('sort', null, presence: true);
  static QueryCond<String> get category =>
      const QueryCond._('category', null, presence: true);
  static QueryCond<int> get radius =>
      const QueryCond._('radius', null, presence: true);
  static const QueryNot not = QueryNot._();
}

final class QueryNot {
  const QueryNot._();
  QueryCond<String> get sort =>
      const QueryCond._('sort', null, presence: true, negate: true);
  QueryCond<String> get category =>
      const QueryCond._('category', null, presence: true, negate: true);
  QueryCond<int> get radius =>
      const QueryCond._('radius', null, presence: true, negate: true);
}

/// Screen-local query view-state for `item` (read-only).
class ItemQuery {
  const ItemQuery._();
  String? get sort => _Screens.graph.viewGet(_Screens.item, 'sort') as String?;
}

/// Mutable [ItemQuery] — a setter per key (null clears / removes from URL).
final class ItemQueryMut extends ItemQuery {
  const ItemQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.item, 'sort', v);
}

/// `Item` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ItemQueryCond<T> implements ViewCond {
  const ItemQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  ItemQueryCond<T> call(T v) => ItemQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static ItemQueryCond<String> get sort =>
      const ItemQueryCond._('sort', null, presence: true);
  static const ItemQueryNot not = ItemQueryNot._();
}

final class ItemQueryNot {
  const ItemQueryNot._();
  ItemQueryCond<String> get sort =>
      const ItemQueryCond._('sort', null, presence: true, negate: true);
}

/// Read-only view-state of `item` — the reactive reads return
/// this; the navigable `ItemNav` adds the setters.
abstract interface class ItemView implements AnyView {
  ItemQuery get query;
  ItemPlacement get at;
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

/// `Feed` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class FeedQueryCond<T> implements ViewCond {
  const FeedQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  FeedQueryCond<T> call(T v) => FeedQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static FeedQueryCond<String> get category =>
      const FeedQueryCond._('category', null, presence: true);
  static FeedQueryCond<int> get radius =>
      const FeedQueryCond._('radius', null, presence: true);
  static const FeedQueryNot not = FeedQueryNot._();
}

final class FeedQueryNot {
  const FeedQueryNot._();
  FeedQueryCond<String> get category =>
      const FeedQueryCond._('category', null, presence: true, negate: true);
  FeedQueryCond<int> get radius =>
      const FeedQueryCond._('radius', null, presence: true, negate: true);
}

/// Read-only view-state of `feed` — the reactive reads return
/// this; the navigable `FeedNav` adds the setters.
abstract interface class FeedView implements AnyView {
  FeedQuery get query;
  FeedNav get at;
}

AnyView? _viewOf(Enum? screen) => switch (screen) {
  _Screens.item => _atOf(_Screens.item) as AnyView?,
  _Screens.feed => const FeedNav._(),
  _ => null,
};

/// Reactive read-only stack reads scoped to this BuildContext.
extension ScreenStackContext on BuildContext {
  /// FOREGROUND: the typed read-only view if [sel] is the current front
  /// (suffix + ids + conditions), else null. Reactive on top + keys.
  V? on<N extends AnyNav, V>(On<N, V> sel) {
    if (sel.specs.isNotEmpty) Placement.isCurrent(this, sel.specs.last);
    ViewMatch.conds(this, _termOf(sel), sel.conds);
    return Screen.on(sel) != null ? _viewOf(_termOf(sel)) as V? : null;
  }

  /// ANYWHERE on the stack (front OR buried): the typed read-only view if
  /// [sel] is on the live stack, else null. Reactive on chain + keys.
  V? at<N extends AnyNav, V>(On<N, V> sel) {
    if (sel.specs.isNotEmpty) Placement.isOn(this, sel.specs.last);
    ViewMatch.conds(this, _termOf(sel), sel.conds);
    return Screen.at(sel) != null ? _viewOf(_termOf(sel)) as V? : null;
  }
}

Enum _termOf(On sel) =>
    sel.specs.isEmpty ? _Screens.graph.current : sel.specs.last;
