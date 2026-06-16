// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'nav.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api
Object? _idOf(_Screens s) =>
    _Screens.graph.stack.lastWhere((e) => e.screen == s).id;
bool _chainIs(List<_Screens> a, List<_Screens> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

final class Screen<I> {
  const Screen._(this.spec);
  final _Screens spec;
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
  static Screen<Object?> of(_Screens spec) => _bySpec[spec]!;
  static const _bySpec = <_Screens, Screen<Object?>>{
    _Screens.splash: splash,
    _Screens.signIn: signIn,
    _Screens.home: home,
    _Screens.feed: feed,
    _Screens.profile: profile,
    _Screens.item: item,
    _Screens.editItem: editItem,
    _Screens.settings: settings,
    _Screens.about: about,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Screens.graph.stack) NavEntry(of(e.screen), e.id),
  ]);
  static const _treeSignature =
      'feedK(item(editItem()));homeK(item(editItem()),settings(about()));profileK(settings(about()));signIn();splash()';

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
  static NavDelegate<_Screens> get delegate {
    assert(_fresh);
    return _Screens.graph.delegate;
  }

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
  static void reset(Keep scope) => _Screens.graph.reset(scope.spec);
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
}

final class Hop<N extends AnyNav> {
  const Hop._(this.spec, this.id, this.nav);
  final _Screens spec;
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
}

final class On<N extends AnyNav> {
  const On._(this.specs, this.ids, this.nav);
  final List<_Screens> specs;
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
  static OnItem item(String id) =>
      OnItem._([_Screens.item], [id], const ItemNav._());
  static On<EditItemNav> editItem(String id) =>
      On._([_Screens.editItem], [id], const EditItemNav._());
  static OnSettings get settings =>
      const OnSettings._([_Screens.settings], [null], SettingsNav._());
  static On<AboutNav> get about =>
      const On._([_Screens.about], [null], AboutNav._());

  /// Push a non-root screen onto whatever scope is on top:
  /// `Screen.on(.parentOf.x)?.go(...)`. A namespace — `.parentOf`
  /// alone is not an `On`, so the bare form will not compile.
  static _ParentSel get parentOf => const _ParentSel._();
}

final class OnParentOf<N extends AnyNav> extends On<N> {
  const OnParentOf._(this.parents, N nav) : super._(const [], const [], nav);
  final Set<_Screens> parents;
}

final class _ParentSel {
  const _ParentSel._();
  OnParentOf<ItemNavParent> get item => OnParentOf._(const {
    _Screens.feed,
    _Screens.home,
  }, const ItemNavParent._());
  OnParentOf<EditItemNavParent> get editItem =>
      OnParentOf._(const {_Screens.item}, const EditItemNavParent._());
  OnParentOf<SettingsNavParent> get settings => OnParentOf._(const {
    _Screens.home,
    _Screens.profile,
  }, const SettingsNavParent._());
  OnParentOf<AboutNavParent> get about =>
      OnParentOf._(const {_Screens.settings}, const AboutNavParent._());
}

final class ItemNavParent extends AnyNav {
  const ItemNavParent._() : super._();
  ItemNav goItem(String id) {
    _Screens.graph.go(_Screens.item, id, true);
    return const ItemNav._();
  }
}

final class EditItemNavParent extends AnyNav {
  const EditItemNavParent._() : super._();
  EditItemNav goEditItem() {
    _Screens.graph.go(_Screens.editItem, _idOf(_Screens.item), true);
    return const EditItemNav._();
  }
}

final class SettingsNavParent extends AnyNav {
  const SettingsNavParent._() : super._();
  SettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings, null, true);
    return const SettingsNav._();
  }
}

final class AboutNavParent extends AnyNav {
  const AboutNavParent._() : super._();
  AboutNav goAbout() {
    _Screens.graph.go(_Screens.about, null, true);
    return const AboutNav._();
  }
}

final class OnHome extends On<HomeNav> {
  const OnHome._(List<_Screens> specs, List<Object?> ids, HomeNav nav)
    : super._(specs, ids, nav);
  OnHomeItem item(String id) => OnHomeItem._(
    [...specs, _Screens.item],
    [...ids, id],
    const HomeItemNav._(),
  );
  OnHomeSettings get settings => OnHomeSettings._(
    [...specs, _Screens.settings],
    [...ids, null],
    const HomeSettingsNav._(),
  );
}

final class OnHomeItem extends On<HomeItemNav> {
  const OnHomeItem._(List<_Screens> specs, List<Object?> ids, HomeItemNav nav)
    : super._(specs, ids, nav);
  On<HomeItemEditItemNav> editItem(String id) => On._(
    [...specs, _Screens.editItem],
    [...ids, id],
    const HomeItemEditItemNav._(),
  );
}

final class OnHomeSettings extends On<HomeSettingsNav> {
  const OnHomeSettings._(
    List<_Screens> specs,
    List<Object?> ids,
    HomeSettingsNav nav,
  ) : super._(specs, ids, nav);
  On<HomeSettingsAboutNav> get about => On._(
    [...specs, _Screens.about],
    [...ids, null],
    const HomeSettingsAboutNav._(),
  );
}

final class OnFeed extends On<FeedNav> {
  const OnFeed._(List<_Screens> specs, List<Object?> ids, FeedNav nav)
    : super._(specs, ids, nav);
  OnFeedItem item(String id) => OnFeedItem._(
    [...specs, _Screens.item],
    [...ids, id],
    const FeedItemNav._(),
  );
}

final class OnFeedItem extends On<FeedItemNav> {
  const OnFeedItem._(List<_Screens> specs, List<Object?> ids, FeedItemNav nav)
    : super._(specs, ids, nav);
  On<FeedItemEditItemNav> editItem(String id) => On._(
    [...specs, _Screens.editItem],
    [...ids, id],
    const FeedItemEditItemNav._(),
  );
}

final class OnProfile extends On<ProfileNav> {
  const OnProfile._(List<_Screens> specs, List<Object?> ids, ProfileNav nav)
    : super._(specs, ids, nav);
  OnProfileSettings get settings => OnProfileSettings._(
    [...specs, _Screens.settings],
    [...ids, null],
    const ProfileSettingsNav._(),
  );
}

final class OnProfileSettings extends On<ProfileSettingsNav> {
  const OnProfileSettings._(
    List<_Screens> specs,
    List<Object?> ids,
    ProfileSettingsNav nav,
  ) : super._(specs, ids, nav);
  On<ProfileSettingsAboutNav> get about => On._(
    [...specs, _Screens.about],
    [...ids, null],
    const ProfileSettingsAboutNav._(),
  );
}

final class OnItem extends On<ItemNav> {
  const OnItem._(List<_Screens> specs, List<Object?> ids, ItemNav nav)
    : super._(specs, ids, nav);
  On<EditItemNav> editItem(String id) =>
      On._([...specs, _Screens.editItem], [...ids, id], const EditItemNav._());
}

final class OnSettings extends On<SettingsNav> {
  const OnSettings._(List<_Screens> specs, List<Object?> ids, SettingsNav nav)
    : super._(specs, ids, nav);
  On<AboutNav> get about =>
      On._([...specs, _Screens.about], [...ids, null], const AboutNav._());
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
    if (_chainIs(c, const [_Screens.home])) return const HomeNav._();
    if (_chainIs(c, const [_Screens.feed])) return const FeedNav._();
    if (_chainIs(c, const [_Screens.profile])) return const ProfileNav._();
    throw StateError('unresolved PopDestNav: $c');
  }
}

final class Keep {
  const Keep._(this.spec);
  final _Screens spec;
  static const home = Keep._(_Screens.home);
  static const feed = Keep._(_Screens.feed);
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
  final _Screens spec;
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
  final _Screens spec;
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
  final _Screens spec;
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
  final _Screens spec;
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
  final _Screens spec;
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

extension ScreenIdOf on BuildContext {
  I idOf<I>(Screen<I> screen) {
    final entry = ScreenScope.of<_Screens>(this);
    assert(
      identical(entry.screen, screen.spec),
      'idOf(${screen.name}) under ${entry.screen.name}',
    );
    return entry.id as I;
  }

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen =>
      Screen.of(ScreenScope.of<_Screens>(this).screen);
}

void verifyScreens() {
  assert(() {
    assert(
      _Screens.splash.id == null,
      'splash declares no id type but the generated tier expected none',
    );
    assert(
      _Screens.signIn.id == null,
      'signIn declares no id type but the generated tier expected none',
    );
    assert(
      _Screens.home.id == null,
      'home declares no id type but the generated tier expected none',
    );
    assert(
      _Screens.feed.id == null,
      'feed declares no id type but the generated tier expected none',
    );
    assert(
      _Screens.profile.id == null,
      'profile declares no id type but the generated tier expected none',
    );
    assert(
      _Screens.item.id == String,
      'item: stale generated id type — rerun build_runner',
    );
    assert(
      _Screens.editItem.id == String,
      'editItem: stale generated id type — rerun build_runner',
    );
    assert(
      _Screens.settings.id == null,
      'settings declares no id type but the generated tier expected none',
    );
    assert(
      _Screens.about.id == null,
      'about declares no id type but the generated tier expected none',
    );
    return true;
  }());
}

bool _endsWith(List<_Screens> chain, List<_Screens> suffix) {
  if (chain.length < suffix.length) return false;
  final off = chain.length - suffix.length;
  for (var i = 0; i < suffix.length; i++) {
    if (chain[off + i] != suffix[i]) return false;
  }
  return true;
}
