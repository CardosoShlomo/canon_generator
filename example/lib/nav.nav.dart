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
  static Screen<Object?> of(Enum spec) => _bySpec[spec]!;
  static const _bySpec = <Enum, Screen<Object?>>{
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
    for (final e in _Screens.graph.stack) NavEntry(of(e.screen), e.id),
  ]);
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

  /// A standalone nav host for `MaterialApp(home: ...)` — no Router,
  /// no URL/deep-link channel. Owns system back; pass a restorationId
  /// to also persist/restore the snapshot.
  static Widget manager({String? restorationId}) {
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
  static N go<N extends AnyNav>(Hop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id);
    return hop.nav;
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
    _ => throw StateError('not a _Screens screen'),
  };

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
  ) => _Screens.graph.observe((f, t) => fn(of(f), of(t)));
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

sealed class InitialScreen implements InitialScreenBase {
  const InitialScreen(this.chain);
  @override
  final List<(Enum, Object?)> chain;
  static const SplashInitialScreen splash = SplashInitialScreen._([
    (_Screens.splash, null),
  ]);
  static const SignInInitialScreen signIn = SignInInitialScreen._([
    (_Screens.signIn, null),
  ]);
  static const HomeInitialScreen home = HomeInitialScreen._([
    (_Screens.home, null),
  ]);
  static const FeedInitialScreen feed = FeedInitialScreen._([
    (_Screens.feed, null),
  ]);
  static const ProfileInitialScreen profile = ProfileInitialScreen._([
    (_Screens.profile, null),
  ]);
  static AccountInitialScreen account(String id) => AccountInitialScreen._([
    (_Screens.profile, null),
    (_Screens.account, id),
  ]);
  static EditAccountInitialScreen editAccount(String id) =>
      EditAccountInitialScreen._([
        (_Screens.profile, null),
        (_Screens.account, id),
        (_Screens.editAccount, id),
      ]);
}

final class SplashInitialScreen extends InitialScreen {
  const SplashInitialScreen._(super.chain);
}

final class SignInInitialScreen extends InitialScreen {
  const SignInInitialScreen._(super.chain);
}

final class HomeInitialScreen extends InitialScreen {
  const HomeInitialScreen._(super.chain);
  HomeItemInitialScreen item(String id) =>
      HomeItemInitialScreen._([...chain, (_Screens.item, id)]);
  HomeSettingsInitialScreen get settings =>
      HomeSettingsInitialScreen._([...chain, (_Screens.settings, null)]);
}

final class HomeItemInitialScreen extends InitialScreen {
  const HomeItemInitialScreen._(super.chain);
}

final class HomeSettingsInitialScreen extends InitialScreen {
  const HomeSettingsInitialScreen._(super.chain);
  HomeSettingsAboutInitialScreen get about =>
      HomeSettingsAboutInitialScreen._([...chain, (_Screens.about, null)]);
}

final class HomeSettingsAboutInitialScreen extends InitialScreen {
  const HomeSettingsAboutInitialScreen._(super.chain);
}

final class FeedInitialScreen extends InitialScreen {
  const FeedInitialScreen._(super.chain);
  FeedItemInitialScreen item(String id) =>
      FeedItemInitialScreen._([...chain, (_Screens.item, id)]);
}

final class FeedItemInitialScreen extends InitialScreen {
  const FeedItemInitialScreen._(super.chain);
}

final class ProfileInitialScreen extends InitialScreen {
  const ProfileInitialScreen._(super.chain);
  ProfileSettingsInitialScreen get settings =>
      ProfileSettingsInitialScreen._([...chain, (_Screens.settings, null)]);
  AccountInitialScreen account(String id) =>
      AccountInitialScreen._([...chain, (_Screens.account, id)]);
}

final class ProfileSettingsInitialScreen extends InitialScreen {
  const ProfileSettingsInitialScreen._(super.chain);
  ProfileSettingsAboutInitialScreen get about =>
      ProfileSettingsAboutInitialScreen._([...chain, (_Screens.about, null)]);
}

final class ProfileSettingsAboutInitialScreen extends InitialScreen {
  const ProfileSettingsAboutInitialScreen._(super.chain);
}

final class AccountInitialScreen extends InitialScreen {
  const AccountInitialScreen._(super.chain);
}

final class EditAccountInitialScreen extends InitialScreen {
  const EditAccountInitialScreen._(super.chain);
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

final class Keep {
  const Keep._(this.spec);
  final Enum spec;
  static const feed = Keep._(_Screens.feed);
  static const home = Keep._(_Screens.home);
  static const profile = Keep._(_Screens.profile);
}

final class SplashNav extends AnyNav {
  const SplashNav._() : super._();
}

final class SignInNav extends AnyNav {
  const SignInNav._() : super._();
}

final class HomeNav extends AnyNav implements PopDestPlacement {
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

final class FeedNav extends AnyNav implements PopDestPlacement {
  const FeedNav._() : super._();
  FeedItemNav goItem(String id) {
    _Screens.graph.go(_Screens.item, id, true);
    return const FeedItemNav._();
  }
}

final class ProfileNav extends AnyNav implements PopDestPlacement {
  const ProfileNav._() : super._();
  ProfileSettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings, null, true);
    return const ProfileSettingsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.account, id, true);
    return const AccountNav._();
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
    implements CanPopPlacement, PopDestPlacement {
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

final class EditAccountNav extends AnyNav implements CanPopPlacement {
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
  Screen<Object?> get screen => Screen.of(ScreenScope.of(this));
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
