// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'shell.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: invalid_use_of_internal_member
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
  static const home = Screen<Never>._(_Shell.home);
  static const settings = Screen<Never>._(_Shell.settings);
  static const shop = Screen<Never>._(Shop.shop);
  static const catalog = Screen<Never>._(Shop.catalog);
  static const product = Screen<String>._(Shop.product);
  static const saved = Screen<Never>._(Wishlist.saved);
  static Screen<Object?> forSpec(Enum spec) => _bySpec[spec]!;

  /// Reactive: is the screen THIS context is under the current foreground
  /// top? Rebuilds only when that flips. The self-vs-current gate —
  /// `if (Screen.isCurrentOf(context)) …` to act only while visible.
  static bool isCurrentOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));
  static const _bySpec = <Enum, Screen<Object?>>{
    BootScreen.initial: Screen<Never>._(BootScreen.initial),
    _Shell.home: home,
    _Shell.settings: settings,
    Shop.shop: shop,
    Shop.catalog: catalog,
    Shop.product: product,
    Wishlist.saved: saved,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Shell.graph.stack) NavEntry(forSpec(e.screen), e.id),
  ]);

  /// The active top screen's QUERY view-state, read-only and
  /// context-free (the headless peer of `Query.of(context, ...)`).
  static Map<String, Object?> get query => _Shell.graph.activeView('q');

  /// The active top screen's FRAGMENT view-state, read-only and
  /// context-free.
  static Map<String, Object?> get fragment => _Shell.graph.activeView('f');
  static const _treeSignature =
      'homeK(saved(product()),settings(),shop(catalog(product())))';

  /// True when this generated code still matches the live tree.
  /// Assert it in a test to fail CI on a stale (un-regenerated) tree:
  /// `test('nav codegen fresh', () => expect(Screen.isCodegenFresh, true));`
  static bool get isCodegenFresh =>
      _Shell.graph.structureSignature == _treeSignature;
  static final bool _fresh = () {
    assert(
      isCodegenFresh,
      'canon: the navigation tree changed but generated code is stale — run build_runner.',
    );
    return true;
  }();
  static NavDelegate get delegate {
    assert(_fresh);
    return _Shell.graph.delegate;
  }

  /// The URL-driven host for `MaterialApp.router(routerConfig:
  /// Screen.routerConfig)` — browser history + cold-start links via
  /// the nav-mirror. Use [manager] instead for a Router-less
  /// `MaterialApp(home: ...)` (no URL channel).
  static RouterConfig<Object> get routerConfig {
    assert(_fresh);
    return RouterConfig(
      routerDelegate: _Shell.graph.delegate,
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
    return _Shell.graph.manager(restorationId: restorationId);
  }

  /// A restoration-serializable snapshot of the whole nav state
  /// (no URLs; ids via each screen codec). Persist + [restore] it.
  static Map<String, Object?> snapshot() => _Shell.graph.toState();

  /// Rebuilds the stack from a [snapshot], best-effort. Returns
  /// false on a stale/incompatible snapshot.
  static bool restore(Map<String, Object?> state) =>
      _Shell.graph.restore(state);
  static KickstartNav go<N extends AnyNav>(Hop<N> hop) {
    _Shell.graph.go(hop.spec, hop.id);
    return const KickstartNav._();
  }

  /// If the live stack ends with this selector path (every pinned id and,
  /// for a cyclic terminal, its depth matching), its nav — else null.
  static N? on<N extends AnyNav>(On<N> which) {
    if (which is OnParentOf) {
      return (which as OnParentOf).parents.contains(_Shell.graph.current)
          ? which.nav
          : null;
    }
    final st = _Shell.graph.stack;
    final specs = which.specs;
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    for (final c in which.conds) {
      if (!c.test(_Shell.graph.viewGet(specs.last, c.key))) return null;
    }
    return which.nav;
  }

  /// Live-stack redirect: the chained verb REPLACES the current history
  /// entry instead of pushing. Decide it at the start —
  /// `Screen.replace.goHome()`, `Screen.replace.on(.user)?.goChat(id)`.
  static const replace = Replace._();

  /// The current EXACT placement, as the sealed [Placement] — an
  /// exhaustive `switch (Screen.at) { case HomeUserProfileNav n => … }`.
  static AnyPlacement get at => switch (_Shell.graph.current) {
    _Shell.home => const HomeNav._(),
    _Shell.settings => const SettingsNav._(),
    Shop.shop => const ShopNav._(),
    Shop.catalog => const CatalogNav._(),
    Shop.product => (const ProductNav._()).at,
    Wishlist.saved => const SavedNav._(),
    BootScreen.initial => const Initial._(),
    _ => throw StateError('not a _Shell screen'),
  };

  /// The poppable handle if the active top is a non-root placement,
  /// else null (at a scope root). `.at` = current placement; `.pop()`
  /// executes the guaranteed pop and returns the destination.
  static CanPopNav? get canPop =>
      _Shell.graph.currentChain.length > 1 ? const CanPopNav._() : null;

  /// Documented sugar for `canPop?.pop()` — pops the active top if any,
  /// returns where it landed, or null at a root. Never throws.
  static PopDestNav? pop() => canPop?.pop();

  /// Side-effect listener fired after each navigation commits (new top
  /// settled, before its transition animates). Wire it where state lives
  /// (e.g. a provider); returns a disposer. Pure observation.
  static void Function() observe(
    void Function(Screen<Object?> from, Screen<Object?> to) fn,
  ) => _Shell.graph.observe((f, t) => fn(forSpec(f), forSpec(t)));

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Shell.graph.navigations.map(ScreenNavigation._);
  static void forgetHome() => _Shell.graph.forget(_Shell.home);
  static HomeNav goHome() {
    _Shell.graph.go(_Shell.home);
    return const HomeNav._();
  }

  static SettingsNav goSettings() {
    _Shell.graph.go(_Shell.settings);
    return const SettingsNav._();
  }

  static ShopNav goShop() {
    _Shell.graph.go(Shop.shop);
    return const ShopNav._();
  }

  static CatalogNav goCatalog() {
    _Shell.graph.go(Shop.catalog);
    return const CatalogNav._();
  }

  static SavedNav goSaved() {
    _Shell.graph.go(Wishlist.saved);
    return const SavedNav._();
  }
}

/// The `Screen.replace` redirect facade — every verb mirrors `Screen`
/// but commits as a history REPLACE (web `replaceState`).
final class Replace {
  const Replace._();
  KickstartNav go<N extends AnyNav>(Hop<N> hop) {
    _Shell.graph.markReplace();
    return Screen.go(hop);
  }

  /// Scoped redirect — replace is decided here, before scoping; a miss
  /// (null) commits nothing, so the pending flag is dropped, not leaked.
  N? on<N extends AnyNav>(On<N> which) {
    _Shell.graph.markReplace();
    return Screen.on(which);
  }

  HomeNav goHome() {
    _Shell.graph.markReplace();
    return Screen.goHome();
  }

  SettingsNav goSettings() {
    _Shell.graph.markReplace();
    return Screen.goSettings();
  }

  ShopNav goShop() {
    _Shell.graph.markReplace();
    return Screen.goShop();
  }

  CatalogNav goCatalog() {
    _Shell.graph.markReplace();
    return Screen.goCatalog();
  }

  SavedNav goSaved() {
    _Shell.graph.markReplace();
    return Screen.goSaved();
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

final class HomeEntry extends ScreenEntry {
  const HomeEntry();
}

final class SettingsEntry extends ScreenEntry {
  const SettingsEntry();
}

final class ShopEntry extends ScreenEntry {
  const ShopEntry();
}

final class CatalogEntry extends ScreenEntry {
  const CatalogEntry();
}

final class ProductEntry extends ScreenEntry {
  const ProductEntry(this.id);
  final String id;
}

final class SavedEntry extends ScreenEntry {
  const SavedEntry();
}

ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Shell.home => const HomeEntry(),
  _Shell.settings => const SettingsEntry(),
  Shop.shop => const ShopEntry(),
  Shop.catalog => const CatalogEntry(),
  Shop.product => ProductEntry(id as String),
  Wishlist.saved => const SavedEntry(),
  _ => throw StateError('not a _Shell screen'),
};

final class Hop<N extends AnyNav> {
  const Hop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const home = Hop<HomeNav>._(_Shell.home, null, HomeNav._());
  static const settings = Hop<SettingsNav>._(
    _Shell.settings,
    null,
    SettingsNav._(),
  );
  static const shop = Hop<ShopNav>._(Shop.shop, null, ShopNav._());
  static const catalog = Hop<CatalogNav>._(Shop.catalog, null, CatalogNav._());
  static const saved = Hop<SavedNav>._(Wishlist.saved, null, SavedNav._());
}

/// The boot placement: `Screen.at` returns it until the first commit.
/// `if (Screen.at case Initial()) ...` gates blob-null cold-boot UI.
final class Initial extends AnyNav implements AnyPlacement {
  const Initial._() : super._();
}

final class On<N extends AnyNav> {
  const On._(this.specs, this.ids, this.nav, [this.conds = const []]);
  final List<Enum> specs;
  final List<Object?> ids;
  final N nav;

  /// View-state conditions on the terminal screen (`.query`/`.fragment`).
  final List<ViewCond> conds;
  static OnHome get home => const OnHome._([_Shell.home], [null], HomeNav._());
  static On<SettingsNav> get settings =>
      const On._([_Shell.settings], [null], SettingsNav._());
  static OnShop get shop => const OnShop._([Shop.shop], [null], ShopNav._());
  static OnCatalog get catalog =>
      const OnCatalog._([Shop.catalog], [null], CatalogNav._());
  static OnProduct get product =>
      const OnProduct._([Shop.product], [null], ProductNav._());
  static OnSaved get saved =>
      const OnSaved._([Wishlist.saved], [null], SavedNav._());

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
  OnParentOf<ProductNavParent> get product => OnParentOf._(const {
    Shop.catalog,
    Wishlist.saved,
  }, const ProductNavParent._());
}

final class ProductNavParent extends AnyNav {
  const ProductNavParent._() : super._();
  ProductNav goProduct(String id) {
    _Shell.graph.go(Shop.product, id, true);
    return const ProductNav._();
  }

  PopDestNav pop() {
    _Shell.graph.pop();
    return const PopDestNav._();
  }
}

final class OnHome extends On<HomeNav> {
  const OnHome._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  On<SettingsNav> get settings =>
      On._([...specs, _Shell.settings], [...ids, null], const SettingsNav._());
  OnShop get shop =>
      OnShop._([...specs, Shop.shop], [...ids, null], const ShopNav._());
  OnSaved get saved =>
      OnSaved._([...specs, Wishlist.saved], [...ids, null], const SavedNav._());
}

final class OnShop extends On<ShopNav> {
  const OnShop._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnCatalog get catalog => OnCatalog._(
    [...specs, Shop.catalog],
    [...ids, null],
    const CatalogNav._(),
  );
}

final class OnCatalog extends On<CatalogNav> {
  const OnCatalog._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnHomeShopCatalogProduct get product => OnHomeShopCatalogProduct._(
    [...specs, Shop.product],
    [...ids, null],
    const HomeShopCatalogProductNav._(),
  );
}

final class OnHomeShopCatalogProduct extends On<HomeShopCatalogProductNav> {
  const OnHomeShopCatalogProduct._(
    super.specs,
    super.ids,
    super.nav, [
    super.conds,
  ]) : super._();
  OnHomeShopCatalogProduct call(String id) => OnHomeShopCatalogProduct._(
    specs,
    [...ids.sublist(0, ids.length - 1), id],
    nav,
  );
}

final class OnSaved extends On<SavedNav> {
  const OnSaved._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnHomeSavedProduct get product => OnHomeSavedProduct._(
    [...specs, Shop.product],
    [...ids, null],
    const HomeSavedProductNav._(),
  );
}

final class OnHomeSavedProduct extends On<HomeSavedProductNav> {
  const OnHomeSavedProduct._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnHomeSavedProduct call(String id) =>
      OnHomeSavedProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProduct extends On<ProductNav> {
  const OnProduct._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnProduct call(String id) =>
      OnProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class AnyPlacement {}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class CanPopPlacement {}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  CanPopPlacement get at => Screen.at as CanPopPlacement;
  PopDestNav pop() {
    _Shell.graph.pop();
    return const PopDestNav._();
  }
}

final class PopDestNav extends AnyNav {
  const PopDestNav._() : super._();
  PopDestPlacement get at {
    final c = _Shell.graph.currentChain;
    if (_chainIs(c, const [_Shell.home, Shop.shop, Shop.catalog]))
      return const CatalogNav._();
    if (_chainIs(c, const [_Shell.home, Shop.shop])) return const ShopNav._();
    if (_chainIs(c, const [_Shell.home, Wishlist.saved]))
      return const SavedNav._();
    if (_chainIs(c, const [_Shell.home])) return const HomeNav._();
    throw StateError('unresolved PopDestNav: $c');
  }
}

sealed class KickstartPlacement {}

final class KickstartNav extends AnyNav {
  const KickstartNav._() : super._();
  KickstartPlacement get at => Screen.at as KickstartPlacement;
}

final class HomeNav extends AnyNav
    implements AnyPlacement, PopDestPlacement, KickstartPlacement {
  const HomeNav._() : super._();
  SettingsNav goSettings() {
    _Shell.graph.go(_Shell.settings, null, true);
    return const SettingsNav._();
  }

  ShopNav goShop() {
    _Shell.graph.go(Shop.shop, null, true);
    return const ShopNav._();
  }

  SavedNav goSaved() {
    _Shell.graph.go(Wishlist.saved, null, true);
    return const SavedNav._();
  }

  N go<N extends AnyNav>(HomeHop<N> hop) {
    _Shell.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class HomeHop<N extends AnyNav> {
  const HomeHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const settings = HomeHop<SettingsNav>._(
    _Shell.settings,
    null,
    SettingsNav._(),
  );
  static const shop = HomeHop<ShopNav>._(Shop.shop, null, ShopNav._());
  static const saved = HomeHop<SavedNav>._(Wishlist.saved, null, SavedNav._());
}

final class SettingsNav extends AnyNav
    implements AnyPlacement, CanPopPlacement, KickstartPlacement {
  const SettingsNav._() : super._();
  HomeNav pop() {
    _Shell.graph.pop();
    return const HomeNav._();
  }
}

final class ShopNav extends AnyNav
    implements
        AnyPlacement,
        CanPopPlacement,
        PopDestPlacement,
        KickstartPlacement {
  const ShopNav._() : super._();
  CatalogNav goCatalog() {
    _Shell.graph.go(Shop.catalog, null, true);
    return const CatalogNav._();
  }

  HomeNav pop() {
    _Shell.graph.pop();
    return const HomeNav._();
  }
}

final class CatalogNav extends AnyNav
    implements
        AnyPlacement,
        CanPopPlacement,
        PopDestPlacement,
        KickstartPlacement {
  const CatalogNav._() : super._();
  HomeShopCatalogProductNav goProduct(String id) {
    _Shell.graph.go(Shop.product, id, true);
    return const HomeShopCatalogProductNav._();
  }

  ShopNav pop() {
    _Shell.graph.pop();
    return const ShopNav._();
  }

  HomeNav popToHome() {
    _Shell.graph.pop(_Shell.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(CatalogPop<N> to) {
    _Shell.graph.pop(to.spec);
    return to.nav;
  }
}

final class CatalogPop<N extends AnyNav> {
  const CatalogPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const shop = CatalogPop<ShopNav>._(Shop.shop, ShopNav._());
  static const home = CatalogPop<HomeNav>._(_Shell.home, HomeNav._());
}

final class ProductNav extends AnyNav {
  const ProductNav._() : super._();
  ProductPlacement get at {
    final c = _Shell.graph.currentChain;
    if (_chainIs(c, const [_Shell.home, Shop.shop, Shop.catalog, Shop.product]))
      return const HomeShopCatalogProductNav._();
    if (_chainIs(c, const [_Shell.home, Wishlist.saved, Shop.product]))
      return const HomeSavedProductNav._();
    throw StateError('unresolved product placement: $c');
  }

  HomeNav popToHome() {
    _Shell.graph.pop(_Shell.home);
    return const HomeNav._();
  }
}

sealed class ProductPlacement implements AnyPlacement {}

final class HomeShopCatalogProductNav extends AnyNav
    implements ProductPlacement, CanPopPlacement {
  const HomeShopCatalogProductNav._() : super._();
  CatalogNav pop() {
    _Shell.graph.pop();
    return const CatalogNav._();
  }

  ShopNav popToShop() {
    _Shell.graph.pop(Shop.shop);
    return const ShopNav._();
  }

  HomeNav popToHome() {
    _Shell.graph.pop(_Shell.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeShopCatalogProductPop<N> to) {
    _Shell.graph.pop(to.spec);
    return to.nav;
  }
}

final class HomeShopCatalogProductPop<N extends AnyNav> {
  const HomeShopCatalogProductPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const catalog = HomeShopCatalogProductPop<CatalogNav>._(
    Shop.catalog,
    CatalogNav._(),
  );
  static const shop = HomeShopCatalogProductPop<ShopNav>._(
    Shop.shop,
    ShopNav._(),
  );
  static const home = HomeShopCatalogProductPop<HomeNav>._(
    _Shell.home,
    HomeNav._(),
  );
}

final class HomeSavedProductNav extends AnyNav
    implements ProductPlacement, CanPopPlacement {
  const HomeSavedProductNav._() : super._();
  SavedNav pop() {
    _Shell.graph.pop();
    return const SavedNav._();
  }

  HomeNav popToHome() {
    _Shell.graph.pop(_Shell.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeSavedProductPop<N> to) {
    _Shell.graph.pop(to.spec);
    return to.nav;
  }
}

final class HomeSavedProductPop<N extends AnyNav> {
  const HomeSavedProductPop._(this.spec, this.nav);
  final Enum spec;
  final N nav;
  static const saved = HomeSavedProductPop<SavedNav>._(
    Wishlist.saved,
    SavedNav._(),
  );
  static const home = HomeSavedProductPop<HomeNav>._(_Shell.home, HomeNav._());
}

final class SavedNav extends AnyNav
    implements
        AnyPlacement,
        CanPopPlacement,
        PopDestPlacement,
        KickstartPlacement {
  const SavedNav._() : super._();
  HomeSavedProductNav goProduct(String id) {
    _Shell.graph.go(Shop.product, id, true);
    return const HomeSavedProductNav._();
  }

  HomeNav pop() {
    _Shell.graph.pop();
    return const HomeNav._();
  }
}

extension type const ScreenId<I>._(Enum spec) {
  static const product = ScreenId<String>._(Shop.product);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen.forSpec(ScreenScope.of(this));
}

void verifyScreens() {
  assert(() {
    assert(
      Shop.shop.id == null,
      'shop has an unexpected id codec — rerun build_runner',
    );
    assert(
      Shop.catalog.id == null,
      'catalog has an unexpected id codec — rerun build_runner',
    );
    assert(
      Shop.product.id != null,
      'product is missing its id codec — rerun build_runner',
    );
    return true;
  }());
}
