// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'shell.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api
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
  static Screen<Object?> of(Enum spec) => _bySpec[spec]!;
  static const _bySpec = <Enum, Screen<Object?>>{
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
    for (final e in _Shell.graph.stack) NavEntry(of(e.screen), e.id),
  ]);
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

  static N go<N extends AnyNav>(Hop<N> hop) {
    _Shell.graph.go(hop.spec, hop.id);
    return hop.nav;
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
    return which.nav;
  }

  /// The current EXACT placement nav — pattern-match it:
  /// `if (Screen.at case HomeUserProfileNav n) ...`.
  static AnyNav get at => switch (_Shell.graph.current) {
    _Shell.home => const HomeNav._(),
    _Shell.settings => const SettingsNav._(),
    Shop.shop => const ShopNav._(),
    Shop.catalog => const CatalogNav._(),
    Shop.product => (const ProductNav._()).at as AnyNav,
    Wishlist.saved => const SavedNav._(),
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
  ) => _Shell.graph.observe((f, t) => fn(of(f), of(t)));
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

sealed class InitialScreen implements InitialScreenBase {
  const InitialScreen(this.chain);
  @override
  final List<(Enum, Object?)> chain;
  static const HomeInitialScreen home = HomeInitialScreen._([
    (_Shell.home, null),
  ]);
  static const SettingsInitialScreen settings = SettingsInitialScreen._([
    (_Shell.home, null),
    (_Shell.settings, null),
  ]);
  static const ShopInitialScreen shop = ShopInitialScreen._([
    (_Shell.home, null),
    (Shop.shop, null),
  ]);
  static const CatalogInitialScreen catalog = CatalogInitialScreen._([
    (_Shell.home, null),
    (Shop.shop, null),
    (Shop.catalog, null),
  ]);
  static const SavedInitialScreen saved = SavedInitialScreen._([
    (_Shell.home, null),
    (Wishlist.saved, null),
  ]);
}

final class HomeInitialScreen extends InitialScreen {
  const HomeInitialScreen._(super.chain);
  SettingsInitialScreen get settings =>
      SettingsInitialScreen._([...chain, (_Shell.settings, null)]);
  ShopInitialScreen get shop =>
      ShopInitialScreen._([...chain, (Shop.shop, null)]);
  SavedInitialScreen get saved =>
      SavedInitialScreen._([...chain, (Wishlist.saved, null)]);
}

final class SettingsInitialScreen extends InitialScreen {
  const SettingsInitialScreen._(super.chain);
}

final class ShopInitialScreen extends InitialScreen {
  const ShopInitialScreen._(super.chain);
  CatalogInitialScreen get catalog =>
      CatalogInitialScreen._([...chain, (Shop.catalog, null)]);
}

final class CatalogInitialScreen extends InitialScreen {
  const CatalogInitialScreen._(super.chain);
  HomeShopCatalogProductInitialScreen product(String id) =>
      HomeShopCatalogProductInitialScreen._([...chain, (Shop.product, id)]);
}

final class HomeShopCatalogProductInitialScreen extends InitialScreen {
  const HomeShopCatalogProductInitialScreen._(super.chain);
}

final class SavedInitialScreen extends InitialScreen {
  const SavedInitialScreen._(super.chain);
  HomeSavedProductInitialScreen product(String id) =>
      HomeSavedProductInitialScreen._([...chain, (Shop.product, id)]);
}

final class HomeSavedProductInitialScreen extends InitialScreen {
  const HomeSavedProductInitialScreen._(super.chain);
}

final class On<N extends AnyNav> {
  const On._(this.specs, this.ids, this.nav);
  final List<Enum> specs;
  final List<Object?> ids;
  final N nav;
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
  const OnHome._(super.specs, super.ids, super.nav) : super._();
  On<SettingsNav> get settings =>
      On._([...specs, _Shell.settings], [...ids, null], const SettingsNav._());
  OnShop get shop =>
      OnShop._([...specs, Shop.shop], [...ids, null], const ShopNav._());
  OnSaved get saved =>
      OnSaved._([...specs, Wishlist.saved], [...ids, null], const SavedNav._());
}

final class OnShop extends On<ShopNav> {
  const OnShop._(super.specs, super.ids, super.nav) : super._();
  OnCatalog get catalog => OnCatalog._(
    [...specs, Shop.catalog],
    [...ids, null],
    const CatalogNav._(),
  );
}

final class OnCatalog extends On<CatalogNav> {
  const OnCatalog._(super.specs, super.ids, super.nav) : super._();
  OnHomeShopCatalogProduct get product => OnHomeShopCatalogProduct._(
    [...specs, Shop.product],
    [...ids, null],
    const HomeShopCatalogProductNav._(),
  );
}

final class OnHomeShopCatalogProduct extends On<HomeShopCatalogProductNav> {
  const OnHomeShopCatalogProduct._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeShopCatalogProduct call(String id) => OnHomeShopCatalogProduct._(
    specs,
    [...ids.sublist(0, ids.length - 1), id],
    nav,
  );
}

final class OnSaved extends On<SavedNav> {
  const OnSaved._(super.specs, super.ids, super.nav) : super._();
  OnHomeSavedProduct get product => OnHomeSavedProduct._(
    [...specs, Shop.product],
    [...ids, null],
    const HomeSavedProductNav._(),
  );
}

final class OnHomeSavedProduct extends On<HomeSavedProductNav> {
  const OnHomeSavedProduct._(super.specs, super.ids, super.nav) : super._();
  OnHomeSavedProduct call(String id) =>
      OnHomeSavedProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProduct extends On<ProductNav> {
  const OnProduct._(super.specs, super.ids, super.nav) : super._();
  OnProduct call(String id) =>
      OnProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
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

final class HomeNav extends AnyNav implements PopDestPlacement {
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

final class SettingsNav extends AnyNav implements CanPopPlacement {
  const SettingsNav._() : super._();
  HomeNav pop() {
    _Shell.graph.pop();
    return const HomeNav._();
  }
}

final class ShopNav extends AnyNav
    implements CanPopPlacement, PopDestPlacement {
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
    implements CanPopPlacement, PopDestPlacement {
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

sealed class ProductPlacement {}

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
    implements CanPopPlacement, PopDestPlacement {
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

extension ScreenIdOf on BuildContext {
  I idOf<I>(Screen<I> screen) {
    final entry = ScreenScope.of(this);
    assert(
      identical(entry.screen, screen.spec),
      'idOf(${screen.name}) under ${entry.screen.name}',
    );
    return entry.id as I;
  }

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen.of(ScreenScope.of(this).screen);
}

void verifyScreens() {
  assert(() {
    assert(
      Shop.shop.id == null,
      'shop declares no id type but the generated tier expected none',
    );
    assert(
      Shop.catalog.id == null,
      'catalog declares no id type but the generated tier expected none',
    );
    assert(
      Shop.product.id == String,
      'product: stale generated id type — rerun build_runner',
    );
    return true;
  }());
}
