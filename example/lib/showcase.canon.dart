// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'showcase.dart';

// **************************************************************************
// CanonGenerator
// **************************************************************************

// Typed ids — nominal identity in the value space, generated
// from the @ids grammar. Zero-cost: each erases to its codec's
// value type at runtime. `node` links back to the grammar
// (`XId.node.codec` reaches the codec).
extension type const ProductId(String _) implements String {
  static const Ids node = Ids.product;
}
extension type const ReviewId(String _) implements String {
  static const Ids node = Ids.review;
}
extension type const SellerId(String _) implements String {
  static const Ids node = Ids.seller;
}
extension type const CategoryId(String _) implements String {
  static const Ids node = Ids.category;
}
extension type const OrderId(String _) implements String {
  static const Ids node = Ids.order;
}
extension type const ListingId(String _) implements String {
  static const Ids node = Ids.listing;
}
extension type const SellerChatId((ProductId, SellerId) _) {
  const SellerChatId.of(ProductId product, SellerId seller)
    : this((product, seller));
  ProductId get product => _.$1;
  SellerId get seller => _.$2;
  static const Ids node = Ids.sellerChat;
}

// Tree ops — one extension per owning entity, from the
// @entities graph: surgical child updates, pure, reduce-safe.
extension ProductTreeOps on IdentifiableMap<ProductId, Product> {
  /// Surgically update one `review` inside its owner.
  IdentifiableMap<ProductId, Product> updateReview(
    ProductId owner,
    ReviewId id,
    Review Function(Review) fn,
  ) => updateById(
    owner,
    (o) => o.copyWith(reviews: o.reviews.updateById(id, fn)),
  );

  /// Insert/replace one `review` inside its owner.
  IdentifiableMap<ProductId, Product> addReview(
    ProductId owner,
    Review child,
  ) => updateById(owner, (o) => o.copyWith(reviews: o.reviews.upsert(child)));

  /// Remove one `review` from its owner.
  IdentifiableMap<ProductId, Product> removeReview(
    ProductId owner,
    ReviewId id,
  ) => updateById(owner, (o) => o.copyWith(reviews: o.reviews.removeById(id)));
}

// ignore_for_file: unused_element
/// The app-wide ledger — the single state + message api (from @regents).
/// `Screen.manager` binds it. `ledger.dispatch(msg)` · `ledger.on<…>(...)` ·
/// `ledger.command(...)`; entities live on the public `<row>Store`
/// globals. `Screen` is nav; `ledger` is state-and-messages.
final ledger = Ledger();

/// States a fact — dispatch is the ONLY verb, so it needs no prefix.
/// (`ledger.` keeps the rarer surfaces: `on`, `veto`, `guard`, `journal`.)
void dispatch(Msg msg) => ledger.dispatch(msg);
bool _bound = false;

/// The `product` screen was navigated to (never a render).
class ProductEnteredMsg extends Msg {
  const ProductEnteredMsg(this.id);
  final ProductId id;
}

/// The `sellerChat` screen was navigated to (never a render).
class SellerChatEnteredMsg extends Msg {
  const SellerChatEnteredMsg(this.id);
  final SellerChatId id;
}

late final UnitMemory<bool, ProductMsg> catalogCoveredStore;
late final UnitMemory<Set<ProductId>, ReviewsInFlightMsg> reviewsInFlightStore;
late final StoreMemory<ProductId, Product, ProductMsg> localProductsStore;
late final StoreMemory<ProductId, Product, ProductMsg> productsStore;
late final StoreMemory<SellerChatId, SellerThread, SellerChatMsg>
sellerThreadsStore;
late final UnitMemory<CartWrite, CartMsg> cartWriteStore;
late final UnitMemory<CartState, CartMsg> cartStore;
late final UnitMemory<NavState?, NavOp> navStore;

/// The generated data surface, hung on [Ledger] so `ledger.` is the one api.
extension on Ledger {
  /// Register the stores on the ledger. Idempotent — `Screen.manager` calls it.
  void bind() {
    if (_bound) return;
    _bound = true;
    catalogCoveredStore = unit(
      _Regents.catalogCovered.regent as Unit<bool, ProductMsg>,
    );
    guard(_Regents.catalogGate.regent as Guard<CatalogCacheMsg>);
    guard(_Regents.productEntryGate.regent as Guard<ProductEnteredMsg>);
    guard(_Regents.dedupeGetReviews.regent as Guard<GetReviews>);
    reviewsInFlightStore = unit(
      _Regents.reviewsInFlight.regent
          as Unit<Set<ProductId>, ReviewsInFlightMsg>,
    );
    localProductsStore = store(
      _Regents.localProducts.regent as Store<ProductId, Product, ProductMsg>,
    );
    IdScope.tag(localProductsStore, Ids.product);
    productsStore = store(
      _Regents.products.regent as Store<ProductId, Product, ProductMsg>,
    );
    IdScope.tag(productsStore, Ids.product);
    sellerThreadsStore = store(
      _Regents.sellerThreads.regent
          as Store<SellerChatId, SellerThread, SellerChatMsg>,
    );
    IdScope.tag(sellerThreadsStore, Ids.sellerChat);
    guard(_Regents.threadGate.regent as Guard<SellerChatEnteredMsg>);
    guard(_Regents.cartWriteGate.regent as Guard<CartMsg>);
    cartWriteStore = unit(
      _Regents.cartWrite.regent as Unit<CartWrite, CartMsg>,
    );
    cartStore = unit(_Regents.cart.regent as Unit<CartState, CartMsg>);
    navStore = unit(_Regents.nav.regent as Unit<NavState?, NavOp>);
    _Screens.graph.navigations.listen((n) {
      final (screen, id) = n.destination;
      if (screen == _Screens.product) {
        dispatch(ProductEnteredMsg(id as ProductId));
      }
      if (screen == _Screens.sellerChat) {
        dispatch(SellerChatEnteredMsg(id as SellerChatId));
      }
    });
    _Screens.graph.routeOps((op) {
      dispatch(op);
      final s = navStore.value;
      if (s != null) _Screens.graph.applyState(s);
    });
    navStore.events.listen((e) {
      final s = e.after;
      if (s != null) _Screens.graph.applyState(s);
    });
    dispatch(SeedOp(_Screens.graph.navState));
    cartStore.merge(cartWriteStore, const WriteSupportsCart());
    productsStore.mergeStore(localProductsStore, const LocalProductSupports());
  }

  /// localProducts on screen `product` — the entry at its live nav id.
  Product? localProductsOnProduct() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.product)
        return localProductsStore[e.id as ProductId];
    }
    return null;
  }

  /// products on screen `product` — the entry at its live nav id.
  Product? productsOnProduct() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.product) return productsStore[e.id as ProductId];
    }
    return null;
  }

  /// sellerThreads on screen `sellerChat` — the entry at its live nav id.
  SellerThread? sellerThreadsOnSellerChat() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.sellerChat)
        return sellerThreadsStore[e.id as SellerChatId];
    }
    return null;
  }
}

/// Canon's `product` identity face: `of` reads the ambient
/// typed id, `navOf` mints the deictic handle for the verbs.
abstract final class ProductID {
  static ProductId of(BuildContext context) =>
      IdScope.of<ProductId>(context, Ids.product);
  static IdNav<ProductId> navOf(BuildContext context) =>
      IdScope.navOf<ProductId>(context, Ids.product);
  static ProductId screenOf(BuildContext context) =>
      IdScope.screenOf<ProductId>(context);
  static ProductId itemOf(BuildContext context) =>
      IdScope.itemOf<ProductId>(context);

  /// The CLAIMED handle — compile-gated: only chains that
  /// EVIDENCE this identity type-check (`ProductOn`);
  /// null when the claim misses the live chain.
  static IdNav<ProductId>? on(BuildContext context, ProductOn which) =>
      Screen.on(which as On) == null
      ? null
      : IdScope.navOf<ProductId>(context, Ids.product);
}

/// Deictic forward verbs for the `product` identity —
/// obtain via `ProductID.navOf(context)`; the id is ambient.
extension ProductIdNav on IdNav<ProductId> {
  void go() {
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.product, id, true);
  }

  void goSellerChat() {
    final e = _Screens.graph.stack.lastWhere(
      (e) => const {_Screens.seller, _Screens.sellerChat}.contains(e.screen),
    );
    final other = const {_Screens.sellerChat}.contains(e.screen)
        ? (e.id as SellerChatId).seller
        : e.id as SellerId;
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.sellerChat, SellerChatId.of(id, other), true);
  }
}

/// Canon's `sellerChat` identity face: `of` reads the ambient
/// typed id, `navOf` mints the deictic handle for the verbs.
abstract final class SellerChatID {
  static SellerChatId of(BuildContext context) =>
      IdScope.of<SellerChatId>(context, Ids.sellerChat);
  static IdNav<SellerChatId> navOf(BuildContext context) =>
      IdScope.navOf<SellerChatId>(context, Ids.sellerChat);
  static SellerChatId screenOf(BuildContext context) =>
      IdScope.screenOf<SellerChatId>(context);
  static SellerChatId itemOf(BuildContext context) =>
      IdScope.itemOf<SellerChatId>(context);
}

/// Deictic forward verbs for the `sellerChat` identity —
/// obtain via `SellerChatID.navOf(context)`; the id is ambient.
extension SellerChatIdNav on IdNav<SellerChatId> {
  void go() {
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.sellerChat, id, true);
  }

  void goProduct() {
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.product, id.product, true);
  }

  void goSeller() {
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.seller, id.seller, true);
  }
}

/// Canon's `seller` identity face: `of` reads the ambient
/// typed id, `navOf` mints the deictic handle for the verbs.
abstract final class SellerID {
  static SellerId of(BuildContext context) =>
      IdScope.of<SellerId>(context, Ids.seller);
  static IdNav<SellerId> navOf(BuildContext context) =>
      IdScope.navOf<SellerId>(context, Ids.seller);
  static SellerId screenOf(BuildContext context) =>
      IdScope.screenOf<SellerId>(context);
  static SellerId itemOf(BuildContext context) =>
      IdScope.itemOf<SellerId>(context);

  /// The CLAIMED handle — compile-gated: only chains that
  /// EVIDENCE this identity type-check (`SellerOn`);
  /// null when the claim misses the live chain.
  static IdNav<SellerId>? on(BuildContext context, SellerOn which) =>
      Screen.on(which as On) == null
      ? null
      : IdScope.navOf<SellerId>(context, Ids.seller);
}

/// Deictic forward verbs for the `seller` identity —
/// obtain via `SellerID.navOf(context)`; the id is ambient.
extension SellerIdNav on IdNav<SellerId> {
  void goSellerChat() {
    final e = _Screens.graph.stack.lastWhere(
      (e) => const {_Screens.product, _Screens.sellerChat}.contains(e.screen),
    );
    final other = const {_Screens.sellerChat}.contains(e.screen)
        ? (e.id as SellerChatId).product
        : e.id as ProductId;
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.sellerChat, SellerChatId.of(other, id), true);
  }
}

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
  const Screen._(this._spec);
  final Enum _spec;

  /// This screen's name, as written in the grammar enum — the
  /// readable identity of a stack entry (`Screen.stack.current.name`).
  String get name => _spec.name;
  static const splash = Screen<Never>._(_Screens.splash);
  static const signIn = Screen<Never>._(_Screens.signIn);
  static const otp = Screen<String>._(_Screens.otp);
  static const home = Screen<Never>._(_Screens.home);
  static const search = Screen<Never>._(_Screens.search);
  static const scan = Screen<Never>._(_Screens.scan);
  static const category = Screen<CategoryId>._(_Screens.category);
  static const product = Screen<ProductId>._(_Screens.product);
  static const seller = Screen<SellerId>._(_Screens.seller);
  static const sellerChat = Screen<SellerChatId>._(_Screens.sellerChat);
  static const wishlist = Screen<Never>._(_Screens.wishlist);
  static const account = Screen<Never>._(_Screens.account);
  static const orders = Screen<Never>._(_Screens.orders);
  static const order = Screen<OrderId>._(_Screens.order);
  static const settings = Screen<Never>._(_Screens.settings);
  static const listing = Screen<ListingId>._(_Screens.listing);
  static const editListing = Screen<ListingId>._(_Screens.editListing);
  static const cart = Screen<Never>._(_Checkout.cart);
  static const checkout = Screen<Never>._(_Checkout.checkout);
  static const payment = Screen<Never>._(_Checkout.payment);
  static const confirmation = Screen<String>._(_Checkout.confirmation);
  static Screen<Object?> _forSpec(Enum spec) => _bySpec[spec]!;

  /// The [Screen] constant for a grammar row — `pageOf`'s bridge from
  /// `PageCtx.screen` to the typed surface (per-screen meta extensions
  /// switch on the constants).
  static Screen<Object?> from(Enum spec) => _bySpec[spec]!;

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
    BootScreen.root: Screen<Never>._(BootScreen.root),
    _Screens.splash: splash,
    _Screens.signIn: signIn,
    _Screens.otp: otp,
    _Screens.home: home,
    _Screens.search: search,
    _Screens.scan: scan,
    _Screens.category: category,
    _Screens.product: product,
    _Screens.seller: seller,
    _Screens.sellerChat: sellerChat,
    _Screens.wishlist: wishlist,
    _Screens.account: account,
    _Screens.orders: orders,
    _Screens.order: order,
    _Screens.settings: settings,
    _Screens.listing: listing,
    _Screens.editListing: editListing,
    _Checkout.cart: cart,
    _Checkout.checkout: checkout,
    _Checkout.payment: payment,
    _Checkout.confirmation: confirmation,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Screens.graph.stack) NavEntry(_forSpec(e.screen), e.id),
  ]);

  /// The active top screen's QUERY view-state, read-only and
  /// context-free (the headless peer of `Query.of(context, ...)`).
  static Map<String, Object?> get query => _Screens.graph.activeView('q');

  /// The active top screen's FRAGMENT view-state, read-only and
  /// context-free.
  static Map<String, Object?> get fragment => _Screens.graph.activeView('f');
  static const _treeSignature =
      'accountK(listing(editListing()),orders(order(product(seller(productA(),sellerChat())))),settings());homeK(cart(checkout(payment(confirmation()))),category(categoryA(),product(seller(productA(),sellerChat()))),scanF(product(seller(productA(),sellerChat()))),search(product(seller(productA(),sellerChat()))),wishlist(product(seller(productA(),sellerChat()))));signIn(otp());splash()';

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

  /// THE app host — a `RouterDelegate`. Wire it once:
  /// `MaterialApp.router(routerDelegate: Screen.manager)`. It owns the
  /// in-memory stack, drives browser back/forward + the URL channel on
  /// web, and system back on mobile. (The placement may change; the name
  /// stays — always pass it where a `RouterDelegate` goes.)
  static NavDelegate get manager {
    assert(_fresh);
    ledger.bind();
    return _Screens.graph.delegate;
  }

  /// A restoration-serializable snapshot of the whole nav state
  /// (no URLs; ids via each screen codec). Persist + [restore] it.
  static Map<String, Object?> snapshot() => _Screens.graph.toState();

  /// Rebuilds the stack from a [snapshot], best-effort. Returns
  /// false on a stale/incompatible snapshot.
  static bool restore(Map<String, Object?> state) =>
      _Screens.graph.restore(state);

  /// Executes a resolved [Hop] — the path a parsed [Place] carries.
  /// This is how a resolver commits an inbound link:
  /// `Screen.resolver = (url) { if (url case Place p) Screen.go(p); };`.
  static N go<N extends AnyNav>(Hop<N> hop) {
    for (final (s, i) in hop.chain) _Screens.graph.go<Object?>(s, i);
    return hop.nav;
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
    if (which is OnDepth &&
        _Screens.graph.countOf(specs.last, which.ids.last) !=
            (which as OnDepth).depth) {
      return null;
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

  /// The root (history bottom) controls: `Screen.root.anchor()` keeps the
  /// launch position returnable; `Screen.root.passthrough()` makes it a
  /// throwaway that exits on back.
  static const root = RootControls._();

  /// The current foreground placement (the front), as the sealed
  /// [AnyPlacement] — `switch (Screen.current) { … }` is exhaustive.
  static AnyPlacement get current => _atOf(_Screens.graph.current);

  /// The cold-start link, parsed from the launch URL — read it in the
  /// `root` boot UI to vary the loading screen by destination. Eager:
  /// available from the first build, independent of the Router callback.
  /// Null when the launch URL isn't a representable link.
  static Url? get rootUrl {
    final u =
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName;
    return parseUrl(u);
  }

  /// THE navigation resolver — assign once (ideally in `main` before
  /// `runApp`). Fires with the cold-start link (or null), then on every
  /// deep link — web URL + mobile app-link, one channel. Write plain
  /// `Screen.goX()` / `Screen.replace`. Single, last-wins, never disposed.
  static set resolver(void Function(Url? url) fn) => _Screens.graph.setResolver(
    (url) => fn(parseUrl(url)),
    boot:
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName,
  );

  /// The poppable handle if the active top is a non-root placement,
  /// else null (at a scope root). `.at` = current placement; `.pop()`
  /// executes the guaranteed pop and returns the destination.
  static CanPopNav? get canPop =>
      _Screens.graph.currentChain.length > 1 ? const CanPopNav._() : null;

  /// Documented sugar for `canPop?.pop()` — pops the active top if any,
  /// returns where it landed, or null at a root. Never throws.
  static PopDestPlacement? pop() => canPop?.pop();

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);

  /// Resolves a widget shared by several screens to its exact
  /// (screen, typed id) — switch the sealed result exhaustively.
  static _SId _sId(BuildContext context) {
    final s = ScreenScope.of(context);
    return switch (s) {
      _Screens.splash => SplashScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.splash),
      ),
      _Screens.signIn => SignInScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.signIn),
      ),
      _Screens.otp => OtpScreenId(
        ScreenScope.idOf<String>(context, _Screens.otp),
      ),
      _Screens.home => HomeScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.home),
      ),
      _Screens.search => SearchScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.search),
      ),
      _Screens.scan => ScanScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.scan),
      ),
      _Screens.category => CategoryScreenId(
        ScreenScope.idOf<CategoryId>(context, _Screens.category),
      ),
      _Screens.seller => SellerScreenId(
        ScreenScope.idOf<SellerId>(context, _Screens.seller),
      ),
      _Screens.sellerChat => SellerChatScreenId(
        ScreenScope.idOf<SellerChatId>(context, _Screens.sellerChat),
      ),
      _Screens.wishlist => WishlistScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.wishlist),
      ),
      _Screens.account => AccountScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.account),
      ),
      _Screens.orders => OrdersScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.orders),
      ),
      _Screens.order => OrderScreenId(
        ScreenScope.idOf<OrderId>(context, _Screens.order),
      ),
      _Screens.settings => SettingsScreenId(
        ScreenScope.idOf<Object?>(context, _Screens.settings),
      ),
      _Screens.listing => ListingScreenId(
        ScreenScope.idOf<ListingId>(context, _Screens.listing),
      ),
      _Screens.editListing => EditListingScreenId(
        ScreenScope.idOf<ListingId>(context, _Screens.editListing),
      ),
      _Checkout.cart => CartScreenId(
        ScreenScope.idOf<Object?>(context, _Checkout.cart),
      ),
      _Checkout.checkout => CheckoutScreenId(
        ScreenScope.idOf<Object?>(context, _Checkout.checkout),
      ),
      _Checkout.payment => PaymentScreenId(
        ScreenScope.idOf<Object?>(context, _Checkout.payment),
      ),
      _Checkout.confirmation => ConfirmationScreenId(
        ScreenScope.idOf<String>(context, _Checkout.confirmation),
      ),
      _ => throw StateError('_sId() under ${s.name}'),
    };
  }

  /// Drops a kept subtree now, so its next visit rebuilds fresh —
  /// the runtime counterpart to a `keep` branch in the grammar.
  static void forget(Keep keep) => _Screens.graph.forget(keep.spec);
  static SplashNav goSplash() {
    _Screens.graph.go(_Screens.splash);
    return const SplashNav._();
  }

  static SignInNav goSignIn() {
    _Screens.graph.go(_Screens.signIn);
    return const SignInNav._();
  }

  static OtpNav goOtp(String id) {
    _Screens.graph.go(_Screens.otp, id);
    return const OtpNav._();
  }

  static HomeNav goHome() {
    _Screens.graph.go(_Screens.home);
    return const HomeNav._();
  }

  static SearchNav goSearch() {
    _Screens.graph.go(_Screens.search);
    return const SearchNav._();
  }

  static ScanNav goScan() {
    _Screens.graph.go(_Screens.scan);
    return const ScanNav._();
  }

  static CategoryNav goCategory(CategoryId id) {
    _Screens.graph.go(_Screens.category, id);
    return const CategoryNav._();
  }

  static WishlistNav goWishlist() {
    _Screens.graph.go(_Screens.wishlist);
    return const WishlistNav._();
  }

  static AccountNav goAccount() {
    _Screens.graph.go(_Screens.account);
    return const AccountNav._();
  }

  static OrdersNav goOrders() {
    _Screens.graph.go(_Screens.orders);
    return const OrdersNav._();
  }

  static OrderNav goOrder(OrderId id) {
    _Screens.graph.go(_Screens.order, id);
    return const OrderNav._();
  }

  static SettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings);
    return const SettingsNav._();
  }

  static ListingNav goListing(ListingId id) {
    _Screens.graph.go(_Screens.listing, id);
    return const ListingNav._();
  }

  static EditListingNav goEditListing(ListingId id) {
    _Screens.graph.go(_Screens.listing, id);
    _Screens.graph.go(_Screens.editListing, id, true);
    return const EditListingNav._();
  }

  static CartNav goCart() {
    _Screens.graph.go(_Checkout.cart);
    return const CartNav._();
  }

  static CheckoutNav goCheckout() {
    _Screens.graph.go(_Checkout.checkout);
    return const CheckoutNav._();
  }

  static PaymentNav goPayment() {
    _Screens.graph.go(_Checkout.payment);
    return const PaymentNav._();
  }

  static ConfirmationNav goConfirmation(String id) {
    _Screens.graph.go(_Checkout.confirmation, id);
    return const ConfirmationNav._();
  }
}

/// The `Screen.root` facade — controls for the root (the history bottom):
/// whether the launch position is a returnable root or a throwaway that
/// exits on back.
final class RootControls {
  const RootControls._();

  /// Persist the launch/root position as returnable — back returns to it
  /// (then exits), and trunk-switches stack above it.
  void anchor() => _Screens.graph.anchor();

  /// Make the launch/root a throwaway that exits on back (the default).
  void passthrough() => _Screens.graph.passthrough();

  /// On a BARE root the `root` widget renders — read this to branch
  /// (a `sentinel`/`fallthrough` kind), or null while boot-loading.
  FloorKind? get kind => _Screens.graph.rootKind;

  /// The current front screen's widget — `return Screen.root.front` from
  /// the `root` widget to keep showing it on a bare root.
  Widget? get front => _Screens.graph.frontWidget as Widget?;
}

/// The `Screen.replace` redirect facade — every verb mirrors `Screen`
/// but commits as a history REPLACE (web `replaceState`).
final class Replace {
  const Replace._();
  N go<N extends AnyNav>(Hop<N> hop) {
    _Screens.graph.markReplace();
    return Screen.go(hop);
  }

  /// Scoped redirect — replace is decided here, before scoping; a miss
  /// (null) commits nothing, so the pending flag is dropped, not leaked.
  N? on<N extends AnyNav, V>(On<N, V> which) {
    _Screens.graph.markReplace();
    return Screen.on(which);
  }

  /// Replace-mode reach: the placement anywhere on the stack, so the
  /// following `surface()` / `goX()` commits as a replace (or, on a miss,
  /// nothing — the flag drops, not leaks).
  N? at<N extends AnyNav, V>(On<N, V> which) {
    _Screens.graph.markReplace();
    return Screen.at(which);
  }

  SplashNav goSplash() {
    _Screens.graph.markReplace();
    return Screen.goSplash();
  }

  SignInNav goSignIn() {
    _Screens.graph.markReplace();
    return Screen.goSignIn();
  }

  OtpNav goOtp(String id) {
    _Screens.graph.markReplace();
    return Screen.goOtp(id);
  }

  HomeNav goHome() {
    _Screens.graph.markReplace();
    return Screen.goHome();
  }

  SearchNav goSearch() {
    _Screens.graph.markReplace();
    return Screen.goSearch();
  }

  ScanNav goScan() {
    _Screens.graph.markReplace();
    return Screen.goScan();
  }

  CategoryNav goCategory(CategoryId id) {
    _Screens.graph.markReplace();
    return Screen.goCategory(id);
  }

  WishlistNav goWishlist() {
    _Screens.graph.markReplace();
    return Screen.goWishlist();
  }

  AccountNav goAccount() {
    _Screens.graph.markReplace();
    return Screen.goAccount();
  }

  OrdersNav goOrders() {
    _Screens.graph.markReplace();
    return Screen.goOrders();
  }

  OrderNav goOrder(OrderId id) {
    _Screens.graph.markReplace();
    return Screen.goOrder(id);
  }

  SettingsNav goSettings() {
    _Screens.graph.markReplace();
    return Screen.goSettings();
  }

  ListingNav goListing(ListingId id) {
    _Screens.graph.markReplace();
    return Screen.goListing(id);
  }

  EditListingNav goEditListing(ListingId id) {
    _Screens.graph.markReplace();
    return Screen.goEditListing(id);
  }

  CartNav goCart() {
    _Screens.graph.markReplace();
    return Screen.goCart();
  }

  CheckoutNav goCheckout() {
    _Screens.graph.markReplace();
    return Screen.goCheckout();
  }

  PaymentNav goPayment() {
    _Screens.graph.markReplace();
    return Screen.goPayment();
  }

  ConfirmationNav goConfirmation(String id) {
    _Screens.graph.markReplace();
    return Screen.goConfirmation(id);
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

final class OtpEntry extends ScreenEntry {
  const OtpEntry(this.id);
  final String id;
}

final class HomeEntry extends ScreenEntry {
  const HomeEntry();
}

final class SearchEntry extends ScreenEntry {
  const SearchEntry();
}

final class ScanEntry extends ScreenEntry {
  const ScanEntry();
}

final class CategoryEntry extends ScreenEntry {
  const CategoryEntry(this.id);
  final CategoryId id;
}

final class ProductEntry extends ScreenEntry {
  const ProductEntry(this.id);
  final ProductId id;
}

final class SellerEntry extends ScreenEntry {
  const SellerEntry(this.id);
  final SellerId id;
}

final class SellerChatEntry extends ScreenEntry {
  const SellerChatEntry(this.id);
  final SellerChatId id;
}

final class WishlistEntry extends ScreenEntry {
  const WishlistEntry();
}

final class AccountEntry extends ScreenEntry {
  const AccountEntry();
}

final class OrdersEntry extends ScreenEntry {
  const OrdersEntry();
}

final class OrderEntry extends ScreenEntry {
  const OrderEntry(this.id);
  final OrderId id;
}

final class SettingsEntry extends ScreenEntry {
  const SettingsEntry();
}

final class ListingEntry extends ScreenEntry {
  const ListingEntry(this.id);
  final ListingId id;
}

final class EditListingEntry extends ScreenEntry {
  const EditListingEntry(this.id);
  final ListingId id;
}

final class CartEntry extends ScreenEntry {
  const CartEntry();
}

final class CheckoutEntry extends ScreenEntry {
  const CheckoutEntry();
}

final class PaymentEntry extends ScreenEntry {
  const PaymentEntry();
}

final class ConfirmationEntry extends ScreenEntry {
  const ConfirmationEntry(this.id);
  final String id;
}

ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.splash => const SplashEntry(),
  _Screens.signIn => const SignInEntry(),
  _Screens.otp => OtpEntry(id as String),
  _Screens.home => const HomeEntry(),
  _Screens.search => const SearchEntry(),
  _Screens.scan => const ScanEntry(),
  _Screens.category => CategoryEntry(id as CategoryId),
  _Screens.product => ProductEntry(id as ProductId),
  _Screens.seller => SellerEntry(id as SellerId),
  _Screens.sellerChat => SellerChatEntry(id as SellerChatId),
  _Screens.wishlist => const WishlistEntry(),
  _Screens.account => const AccountEntry(),
  _Screens.orders => const OrdersEntry(),
  _Screens.order => OrderEntry(id as OrderId),
  _Screens.settings => const SettingsEntry(),
  _Screens.listing => ListingEntry(id as ListingId),
  _Screens.editListing => EditListingEntry(id as ListingId),
  _Checkout.cart => const CartEntry(),
  _Checkout.checkout => const CheckoutEntry(),
  _Checkout.payment => const PaymentEntry(),
  _Checkout.confirmation => ConfirmationEntry(id as String),
  _ => throw StateError('not a _Screens screen'),
};

final class Hop<N extends AnyNav> {
  const Hop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;

  /// The root-down chain this hop replays. A single kick-start is one
  /// segment; a navigable `Place` (a `Place`) overrides it with its
  /// full path, so `Screen.go` lands the whole placement.
  List<(Enum, Object?)> get chain => [(spec, id)];
  static const splash = Hop<SplashNav>._(_Screens.splash, null, SplashNav._());
  static const signIn = Hop<SignInNav>._(_Screens.signIn, null, SignInNav._());
  static Hop<OtpNav> otp(String id) =>
      Hop._(_Screens.otp, id, const OtpNav._());
  static const home = Hop<HomeNav>._(_Screens.home, null, HomeNav._());
  static const search = Hop<SearchNav>._(_Screens.search, null, SearchNav._());
  static const scan = Hop<ScanNav>._(_Screens.scan, null, ScanNav._());
  static Hop<CategoryNav> category(CategoryId id) =>
      Hop._(_Screens.category, id, const CategoryNav._());
  static const wishlist = Hop<WishlistNav>._(
    _Screens.wishlist,
    null,
    WishlistNav._(),
  );
  static const account = Hop<AccountNav>._(
    _Screens.account,
    null,
    AccountNav._(),
  );
  static const orders = Hop<OrdersNav>._(_Screens.orders, null, OrdersNav._());
  static Hop<OrderNav> order(OrderId id) =>
      Hop._(_Screens.order, id, const OrderNav._());
  static const settings = Hop<SettingsNav>._(
    _Screens.settings,
    null,
    SettingsNav._(),
  );
  static Hop<ListingNav> listing(ListingId id) =>
      Hop._(_Screens.listing, id, const ListingNav._());
  static const cart = Hop<CartNav>._(_Checkout.cart, null, CartNav._());
  static const checkout = Hop<CheckoutNav>._(
    _Checkout.checkout,
    null,
    CheckoutNav._(),
  );
  static const payment = Hop<PaymentNav>._(
    _Checkout.payment,
    null,
    PaymentNav._(),
  );
  static Hop<ConfirmationNav> confirmation(String id) =>
      Hop._(_Checkout.confirmation, id, const ConfirmationNav._());
}

/// The root/boot placement: `Screen.current` returns it until the first
/// commit. `if (Screen.current case Root()) ...` gates blob-null cold-boot UI.
final class Root extends AnyPlacement {
  const Root._() : super._();
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
  static OnSignIn get signIn =>
      OnSignIn._([_Screens.signIn], [null], const SignInNav._());
  static OnOtp get otp => OnOtp._([_Screens.otp], [null], const OtpNav._());
  static OnHome get home =>
      OnHome._([_Screens.home], [null], const HomeNav._());
  static OnSearch get search =>
      OnSearch._([_Screens.search], [null], const SearchNav._());
  static OnScan get scan =>
      OnScan._([_Screens.scan], [null], const ScanNav._());
  static OnCategory get category =>
      OnCategory._([_Screens.category], [null], const CategoryNav._());
  static OnProduct get product => OnProduct._([_Screens.product], [null], null);
  static OnSeller get seller => OnSeller._([_Screens.seller], [null], null);
  static OnSellerChat get sellerChat =>
      OnSellerChat._([_Screens.sellerChat], [null], null);
  static OnWishlist get wishlist =>
      OnWishlist._([_Screens.wishlist], [null], const WishlistNav._());
  static OnAccount get account =>
      OnAccount._([_Screens.account], [null], const AccountNav._());
  static OnOrders get orders =>
      OnOrders._([_Screens.orders], [null], const OrdersNav._());
  static OnOrder get order =>
      OnOrder._([_Screens.order], [null], const OrderNav._());
  static On<SettingsNav, AnyView> get settings =>
      On._([_Screens.settings], [null], const SettingsNav._());
  static OnListing get listing =>
      OnListing._([_Screens.listing], [null], const ListingNav._());
  static OnEditListing get editListing =>
      OnEditListing._([_Screens.editListing], [null], const EditListingNav._());
  static OnCart get cart =>
      OnCart._([_Checkout.cart], [null], const CartNav._());
  static OnCheckout get checkout =>
      OnCheckout._([_Checkout.checkout], [null], const CheckoutNav._());
  static OnPayment get payment =>
      OnPayment._([_Checkout.payment], [null], const PaymentNav._());
  static OnConfirmation get confirmation => OnConfirmation._(
    [_Checkout.confirmation],
    [null],
    const ConfirmationNav._(),
  );

  /// GLOBAL query conditions, unbound to a screen — `context.on(.query(
  /// {…}))` (foreground) / `context.at(.query({…}))` (anywhere on stack).
  static On<AnyPlacement, AnyView> query(Set<QueryCond> cs) =>
      On._(const [], const [], null, [...cs]);

  /// GLOBAL fragment conditions, unbound to a screen.
  static On<AnyPlacement, AnyView> fragment(Set<FragmentCond> cs) =>
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
  OnParentOf<CategoryNavParent, AnyView> get category => OnParentOf._(const {
    _Screens.category,
    _Screens.home,
  }, const CategoryNavParent._());
  OnParentOf<ProductNavParent, ProductView> get product => OnParentOf._(const {
    _Screens.category,
    _Screens.order,
    _Screens.scan,
    _Screens.search,
    _Screens.seller,
    _Screens.wishlist,
  }, const ProductNavParent._());
}

final class CategoryNavParent extends AnyNav {
  const CategoryNavParent._() : super._();
  CategoryNav goCategory(CategoryId id) {
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }
}

final class ProductNavParent extends AnyNav {
  const ProductNavParent._() : super._();
  ProductPlacement goProduct(ProductId id) {
    _Screens.graph.go(_Screens.product, id, true);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class OnDepth<N extends AnyNav, V> extends On<N, V> {
  const OnDepth._(super.specs, super.ids, this.depth, super.nav) : super._();
  final int depth;
}

final class OnSignIn extends On<SignInNav, AnyView> {
  const OnSignIn._(super.specs, super.ids, super.nav) : super._();
  OnOtp get otp =>
      OnOtp._([...specs, _Screens.otp], [...ids, null], const OtpNav._());
}

final class OnOtp extends On<OtpNav, AnyView> {
  const OnOtp._(super.specs, super.ids, super.nav) : super._();
  OnOtp call(String id) =>
      OnOtp._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnHome extends On<HomeNav, AnyView> {
  const OnHome._(super.specs, super.ids, super.nav) : super._();
  OnSearch get search => OnSearch._(
    [...specs, _Screens.search],
    [...ids, null],
    const SearchNav._(),
  );
  OnCategory get category => OnCategory._(
    [...specs, _Screens.category],
    [...ids, null],
    const CategoryNav._(),
  );
  OnScan get scan =>
      OnScan._([...specs, _Screens.scan], [...ids, null], const ScanNav._());
  OnWishlist get wishlist => OnWishlist._(
    [...specs, _Screens.wishlist],
    [...ids, null],
    const WishlistNav._(),
  );
  OnCart get cart =>
      OnCart._([...specs, _Checkout.cart], [...ids, null], const CartNav._());
}

final class OnSearch extends On<SearchNav, SearchView> {
  const OnSearch._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnSearch query(Set<SearchQueryCond> cs) =>
      OnSearch._(specs, ids, nav, [...conds, ...cs]);
  OnHomeSearchProduct get product => OnHomeSearchProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const HomeSearchProductNav._(),
  );
}

final class OnHomeSearchProduct extends On<HomeSearchProductNav, ProductView>
    implements SellerOn {
  const OnHomeSearchProduct._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnHomeSearchProduct query(Set<ProductQueryCond> cs) =>
      OnHomeSearchProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeSearchProduct fragment(Set<ProductFragmentCond> cs) =>
      OnHomeSearchProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeSearchProductSeller get seller => OnHomeSearchProductSeller._(
    [...specs, _Screens.seller],
    [...ids, null],
    const HomeSearchProductSellerNav._(),
  );
  OnHomeSearchProduct call(ProductId id) => OnHomeSearchProduct._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
  OnDepth<HomeSearchProductNav, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeSearchProductSeller
    extends On<HomeSearchProductSellerNav, AnyView>
    implements ProductOn {
  const OnHomeSearchProductSeller._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeSearchProductSellerSellerChat get sellerChat =>
      OnHomeSearchProductSellerSellerChat._(
        [...specs, _Screens.sellerChat],
        [...ids, null],
        const HomeSearchProductSellerSellerChatNav._(),
      );
  OnHomeSearchProductSeller call(SellerId id) => OnHomeSearchProductSeller._(
    specs,
    [...ids.sublist(0, ids.length - 1), id],
    nav,
  );
  OnDepth<HomeSearchProductSellerNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeSearchProductSellerSellerChat
    extends On<HomeSearchProductSellerSellerChatNav, AnyView>
    implements ProductOn, SellerOn {
  const OnHomeSearchProductSellerSellerChat._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeSearchProductSellerSellerChat call(SellerChatId id) =>
      OnHomeSearchProductSellerSellerChat._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnCategory extends On<CategoryNav, AnyView> {
  const OnCategory._(super.specs, super.ids, super.nav) : super._();
  OnHomeCategoryProduct get product => OnHomeCategoryProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const HomeCategoryProductNav._(),
  );
  OnCategory call(CategoryId id) =>
      OnCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<CategoryNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnHomeCategoryProduct
    extends On<HomeCategoryProductNav, ProductView>
    implements SellerOn {
  const OnHomeCategoryProduct._(
    super.specs,
    super.ids,
    super.nav, [
    super.conds,
  ]) : super._();
  OnHomeCategoryProduct query(Set<ProductQueryCond> cs) =>
      OnHomeCategoryProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeCategoryProduct fragment(Set<ProductFragmentCond> cs) =>
      OnHomeCategoryProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeCategoryProductSeller get seller => OnHomeCategoryProductSeller._(
    [...specs, _Screens.seller],
    [...ids, null],
    const HomeCategoryProductSellerNav._(),
  );
  OnHomeCategoryProduct call(ProductId id) => OnHomeCategoryProduct._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
  OnDepth<HomeCategoryProductNav, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeCategoryProductSeller
    extends On<HomeCategoryProductSellerNav, AnyView>
    implements ProductOn {
  const OnHomeCategoryProductSeller._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeCategoryProductSellerSellerChat get sellerChat =>
      OnHomeCategoryProductSellerSellerChat._(
        [...specs, _Screens.sellerChat],
        [...ids, null],
        const HomeCategoryProductSellerSellerChatNav._(),
      );
  OnHomeCategoryProductSeller call(SellerId id) =>
      OnHomeCategoryProductSeller._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
  OnDepth<HomeCategoryProductSellerNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeCategoryProductSellerSellerChat
    extends On<HomeCategoryProductSellerSellerChatNav, AnyView>
    implements ProductOn, SellerOn {
  const OnHomeCategoryProductSellerSellerChat._(
    super.specs,
    super.ids,
    super.nav,
  ) : super._();
  OnHomeCategoryProductSellerSellerChat call(SellerChatId id) =>
      OnHomeCategoryProductSellerSellerChat._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnScan extends On<ScanNav, AnyView> {
  const OnScan._(super.specs, super.ids, super.nav) : super._();
  OnHomeScanProduct get product => OnHomeScanProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const HomeScanProductNav._(),
  );
}

final class OnHomeScanProduct extends On<HomeScanProductNav, ProductView>
    implements SellerOn {
  const OnHomeScanProduct._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnHomeScanProduct query(Set<ProductQueryCond> cs) =>
      OnHomeScanProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeScanProduct fragment(Set<ProductFragmentCond> cs) =>
      OnHomeScanProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeScanProductSeller get seller => OnHomeScanProductSeller._(
    [...specs, _Screens.seller],
    [...ids, null],
    const HomeScanProductSellerNav._(),
  );
  OnHomeScanProduct call(ProductId id) =>
      OnHomeScanProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<HomeScanProductNav, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeScanProductSeller
    extends On<HomeScanProductSellerNav, AnyView>
    implements ProductOn {
  const OnHomeScanProductSeller._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeScanProductSellerSellerChat get sellerChat =>
      OnHomeScanProductSellerSellerChat._(
        [...specs, _Screens.sellerChat],
        [...ids, null],
        const HomeScanProductSellerSellerChatNav._(),
      );
  OnHomeScanProductSeller call(SellerId id) => OnHomeScanProductSeller._(
    specs,
    [...ids.sublist(0, ids.length - 1), id],
    nav,
  );
  OnDepth<HomeScanProductSellerNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeScanProductSellerSellerChat
    extends On<HomeScanProductSellerSellerChatNav, AnyView>
    implements ProductOn, SellerOn {
  const OnHomeScanProductSellerSellerChat._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeScanProductSellerSellerChat call(SellerChatId id) =>
      OnHomeScanProductSellerSellerChat._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnWishlist extends On<WishlistNav, AnyView> {
  const OnWishlist._(super.specs, super.ids, super.nav) : super._();
  OnHomeWishlistProduct get product => OnHomeWishlistProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const HomeWishlistProductNav._(),
  );
}

final class OnHomeWishlistProduct
    extends On<HomeWishlistProductNav, ProductView>
    implements SellerOn {
  const OnHomeWishlistProduct._(
    super.specs,
    super.ids,
    super.nav, [
    super.conds,
  ]) : super._();
  OnHomeWishlistProduct query(Set<ProductQueryCond> cs) =>
      OnHomeWishlistProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeWishlistProduct fragment(Set<ProductFragmentCond> cs) =>
      OnHomeWishlistProduct._(specs, ids, nav, [...conds, ...cs]);
  OnHomeWishlistProductSeller get seller => OnHomeWishlistProductSeller._(
    [...specs, _Screens.seller],
    [...ids, null],
    const HomeWishlistProductSellerNav._(),
  );
  OnHomeWishlistProduct call(ProductId id) => OnHomeWishlistProduct._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
  OnDepth<HomeWishlistProductNav, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeWishlistProductSeller
    extends On<HomeWishlistProductSellerNav, AnyView>
    implements ProductOn {
  const OnHomeWishlistProductSeller._(super.specs, super.ids, super.nav)
    : super._();
  OnHomeWishlistProductSellerSellerChat get sellerChat =>
      OnHomeWishlistProductSellerSellerChat._(
        [...specs, _Screens.sellerChat],
        [...ids, null],
        const HomeWishlistProductSellerSellerChatNav._(),
      );
  OnHomeWishlistProductSeller call(SellerId id) =>
      OnHomeWishlistProductSeller._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
  OnDepth<HomeWishlistProductSellerNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnHomeWishlistProductSellerSellerChat
    extends On<HomeWishlistProductSellerSellerChatNav, AnyView>
    implements ProductOn, SellerOn {
  const OnHomeWishlistProductSellerSellerChat._(
    super.specs,
    super.ids,
    super.nav,
  ) : super._();
  OnHomeWishlistProductSellerSellerChat call(SellerChatId id) =>
      OnHomeWishlistProductSellerSellerChat._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnCart extends On<CartNav, AnyView> {
  const OnCart._(super.specs, super.ids, super.nav) : super._();
  OnCheckout get checkout => OnCheckout._(
    [...specs, _Checkout.checkout],
    [...ids, null],
    const CheckoutNav._(),
  );
}

final class OnCheckout extends On<CheckoutNav, AnyView> {
  const OnCheckout._(super.specs, super.ids, super.nav) : super._();
  OnPayment get payment => OnPayment._(
    [...specs, _Checkout.payment],
    [...ids, null],
    const PaymentNav._(),
  );
}

final class OnPayment extends On<PaymentNav, AnyView> {
  const OnPayment._(super.specs, super.ids, super.nav) : super._();
  OnConfirmation get confirmation => OnConfirmation._(
    [...specs, _Checkout.confirmation],
    [...ids, null],
    const ConfirmationNav._(),
  );
}

final class OnConfirmation extends On<ConfirmationNav, AnyView> {
  const OnConfirmation._(super.specs, super.ids, super.nav) : super._();
  OnConfirmation call(String id) =>
      OnConfirmation._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProduct extends On<ProductPlacement, ProductView>
    implements SellerOn {
  const OnProduct._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnProduct query(Set<ProductQueryCond> cs) =>
      OnProduct._(specs, ids, nav, [...conds, ...cs]);
  OnProduct fragment(Set<ProductFragmentCond> cs) =>
      OnProduct._(specs, ids, nav, [...conds, ...cs]);
  OnSeller get seller =>
      OnSeller._([...specs, _Screens.seller], [...ids, null], null);
  OnProduct call(ProductId id) =>
      OnProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ProductPlacement, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnSeller extends On<SellerPlacement, AnyView> implements ProductOn {
  const OnSeller._(super.specs, super.ids, super.nav) : super._();
  OnSellerChat get sellerChat =>
      OnSellerChat._([...specs, _Screens.sellerChat], [...ids, null], null);
  OnSeller call(SellerId id) =>
      OnSeller._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<SellerPlacement, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnSellerChat extends On<SellerChatPlacement, AnyView>
    implements ProductOn, SellerOn {
  const OnSellerChat._(super.specs, super.ids, super.nav) : super._();
  OnSellerChat call(SellerChatId id) =>
      OnSellerChat._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnAccount extends On<AccountNav, AnyView> {
  const OnAccount._(super.specs, super.ids, super.nav) : super._();
  OnOrders get orders => OnOrders._(
    [...specs, _Screens.orders],
    [...ids, null],
    const OrdersNav._(),
  );
  On<SettingsNav, AnyView> get settings => On._(
    [...specs, _Screens.settings],
    [...ids, null],
    const SettingsNav._(),
  );
  OnListing get listing => OnListing._(
    [...specs, _Screens.listing],
    [...ids, null],
    const ListingNav._(),
  );
  On<EditListingNav, AnyView> editListing(ListingId id) => On._(
    [...specs, _Screens.listing, _Screens.editListing],
    [...ids, id, null],
    const EditListingNav._(),
  );
}

final class OnOrders extends On<OrdersNav, AnyView> {
  const OnOrders._(super.specs, super.ids, super.nav) : super._();
  OnOrder get order =>
      OnOrder._([...specs, _Screens.order], [...ids, null], const OrderNav._());
}

final class OnOrder extends On<OrderNav, AnyView> {
  const OnOrder._(super.specs, super.ids, super.nav) : super._();
  OnAccountOrdersOrderProduct get product => OnAccountOrdersOrderProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const AccountOrdersOrderProductNav._(),
  );
  OnOrder call(OrderId id) =>
      OnOrder._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnAccountOrdersOrderProduct
    extends On<AccountOrdersOrderProductNav, ProductView>
    implements SellerOn {
  const OnAccountOrdersOrderProduct._(
    super.specs,
    super.ids,
    super.nav, [
    super.conds,
  ]) : super._();
  OnAccountOrdersOrderProduct query(Set<ProductQueryCond> cs) =>
      OnAccountOrdersOrderProduct._(specs, ids, nav, [...conds, ...cs]);
  OnAccountOrdersOrderProduct fragment(Set<ProductFragmentCond> cs) =>
      OnAccountOrdersOrderProduct._(specs, ids, nav, [...conds, ...cs]);
  OnAccountOrdersOrderProductSeller get seller =>
      OnAccountOrdersOrderProductSeller._(
        [...specs, _Screens.seller],
        [...ids, null],
        const AccountOrdersOrderProductSellerNav._(),
      );
  OnAccountOrdersOrderProduct call(ProductId id) =>
      OnAccountOrdersOrderProduct._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
  OnDepth<AccountOrdersOrderProductNav, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnAccountOrdersOrderProductSeller
    extends On<AccountOrdersOrderProductSellerNav, AnyView>
    implements ProductOn {
  const OnAccountOrdersOrderProductSeller._(super.specs, super.ids, super.nav)
    : super._();
  OnAccountOrdersOrderProductSellerSellerChat get sellerChat =>
      OnAccountOrdersOrderProductSellerSellerChat._(
        [...specs, _Screens.sellerChat],
        [...ids, null],
        const AccountOrdersOrderProductSellerSellerChatNav._(),
      );
  OnAccountOrdersOrderProductSeller call(SellerId id) =>
      OnAccountOrdersOrderProductSeller._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
  OnDepth<AccountOrdersOrderProductSellerNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnAccountOrdersOrderProductSellerSellerChat
    extends On<AccountOrdersOrderProductSellerSellerChatNav, AnyView>
    implements ProductOn, SellerOn {
  const OnAccountOrdersOrderProductSellerSellerChat._(
    super.specs,
    super.ids,
    super.nav,
  ) : super._();
  OnAccountOrdersOrderProductSellerSellerChat call(SellerChatId id) =>
      OnAccountOrdersOrderProductSellerSellerChat._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnListing extends On<ListingNav, AnyView> {
  const OnListing._(super.specs, super.ids, super.nav) : super._();
  OnListing call(ListingId id) =>
      OnListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnEditListing extends On<EditListingNav, AnyView> {
  const OnEditListing._(super.specs, super.ids, super.nav) : super._();
  OnEditListing call(ListingId id) =>
      OnEditListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

/// Chains ending at a screen that EVIDENCES this identity —
/// the compile-time gate of `ProductID.on(context, chain)`.
abstract interface class ProductOn {}

/// Chains ending at a screen that EVIDENCES this identity —
/// the compile-time gate of `SellerID.on(context, chain)`.
abstract interface class SellerOn {}

sealed class AnyPlacement extends AnyNav {
  const AnyPlacement._() : super._();
}

AnyPlacement _atOf(Enum s) {
  final c = _Screens.graph.currentChain;
  final p = c.sublist(0, c.lastIndexOf(s) + 1);
  return switch (s) {
    _Screens.splash => const SplashNav._(),
    _Screens.signIn => const SignInNav._(),
    _Screens.otp => const OtpNav._(),
    _Screens.home => const HomeNav._(),
    _Screens.search => const SearchNav._(),
    _Screens.scan => const ScanNav._(),
    _Screens.category => const CategoryNav._(),
    _Screens.product => _resolveProductPlacement(p),
    _Screens.seller => _resolveSellerPlacement(p),
    _Screens.sellerChat => _resolveSellerChatPlacement(p),
    _Screens.wishlist => const WishlistNav._(),
    _Screens.account => const AccountNav._(),
    _Screens.orders => const OrdersNav._(),
    _Screens.order => const OrderNav._(),
    _Screens.settings => const SettingsNav._(),
    _Screens.listing => const ListingNav._(),
    _Screens.editListing => const EditListingNav._(),
    _Checkout.cart => const CartNav._(),
    _Checkout.checkout => const CheckoutNav._(),
    _Checkout.payment => const PaymentNav._(),
    _Checkout.confirmation => const ConfirmationNav._(),
    BootScreen.root => const Root._(),
    _ => throw StateError('not a _Screens screen'),
  };
}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class CategoryHomePopPlacement {}

CategoryHomePopPlacement _resolveCategoryHomePopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [_Screens.home, _Screens.category]))
    return const CategoryNav._();
  if (_endsWith(c, const [_Screens.home])) return const HomeNav._();
  throw StateError('unresolved CategoryHomePopPlacement: $c');
}

sealed class AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement {}

AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement
_resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.search]))
    return const SearchNav._();
  throw StateError(
    'unresolved AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement: $c',
  );
}

sealed class AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement {}

AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement
_resolveAccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.category]))
    return const CategoryNav._();
  throw StateError(
    'unresolved AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement: $c',
  );
}

sealed class AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement {}

AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement
_resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.scan]))
    return const ScanNav._();
  throw StateError(
    'unresolved AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement: $c',
  );
}

sealed class AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement {}

AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement
_resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.wishlist]))
    return const WishlistNav._();
  throw StateError(
    'unresolved AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement: $c',
  );
}

sealed class AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement {}

AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement
_resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_endsWith(c, const [_Screens.account, _Screens.orders, _Screens.order]))
    return const OrderNav._();
  throw StateError(
    'unresolved AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement: $c',
  );
}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

PopDestPlacement _resolvePopDest() {
  final c = _Screens.graph.currentChain;
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
  ]))
    return const AccountOrdersOrderProductNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Checkout.cart,
    _Checkout.checkout,
    _Checkout.payment,
  ]))
    return const PaymentNav._();
  if (_chainIs(c, const [_Screens.account, _Screens.orders, _Screens.order]))
    return const OrderNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.search, _Screens.product]))
    return const HomeSearchProductNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.category, _Screens.product]))
    return const HomeCategoryProductNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.scan, _Screens.product]))
    return const HomeScanProductNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.wishlist, _Screens.product]))
    return const HomeWishlistProductNav._();
  if (_chainIs(c, const [_Screens.home, _Checkout.cart, _Checkout.checkout]))
    return const CheckoutNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.category]))
    return const CategoryNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.search]))
    return const SearchNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.scan]))
    return const ScanNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.wishlist]))
    return const WishlistNav._();
  if (_chainIs(c, const [_Screens.account, _Screens.orders]))
    return const OrdersNav._();
  if (_chainIs(c, const [_Screens.account, _Screens.listing]))
    return const ListingNav._();
  if (_chainIs(c, const [_Screens.home, _Checkout.cart]))
    return const CartNav._();
  if (_chainIs(c, const [_Screens.signIn])) return const SignInNav._();
  if (_chainIs(c, const [_Screens.home])) return const HomeNav._();
  if (_chainIs(c, const [_Screens.account])) return const AccountNav._();
  throw StateError('unresolved pop destination: $c');
}

sealed class _SId {
  const _SId();
}

final class SplashScreenId extends _SId with Identifiable<Object?> {
  const SplashScreenId(this.id);
  @override
  final Object? id;
}

final class SignInScreenId extends _SId with Identifiable<Object?> {
  const SignInScreenId(this.id);
  @override
  final Object? id;
}

final class OtpScreenId extends _SId with Identifiable<String> {
  const OtpScreenId(this.id);
  @override
  final String id;
}

final class HomeScreenId extends _SId with Identifiable<Object?> {
  const HomeScreenId(this.id);
  @override
  final Object? id;
}

final class SearchScreenId extends _SId with Identifiable<Object?> {
  const SearchScreenId(this.id);
  @override
  final Object? id;
}

final class ScanScreenId extends _SId with Identifiable<Object?> {
  const ScanScreenId(this.id);
  @override
  final Object? id;
}

final class CategoryScreenId extends _SId with Identifiable<CategoryId> {
  const CategoryScreenId(this.id);
  @override
  final CategoryId id;
}

final class SellerScreenId extends _SId with Identifiable<SellerId> {
  const SellerScreenId(this.id);
  @override
  final SellerId id;
}

final class SellerChatScreenId extends _SId with Identifiable<SellerChatId> {
  const SellerChatScreenId(this.id);
  @override
  final SellerChatId id;
}

final class WishlistScreenId extends _SId with Identifiable<Object?> {
  const WishlistScreenId(this.id);
  @override
  final Object? id;
}

final class AccountScreenId extends _SId with Identifiable<Object?> {
  const AccountScreenId(this.id);
  @override
  final Object? id;
}

final class OrdersScreenId extends _SId with Identifiable<Object?> {
  const OrdersScreenId(this.id);
  @override
  final Object? id;
}

final class OrderScreenId extends _SId with Identifiable<OrderId> {
  const OrderScreenId(this.id);
  @override
  final OrderId id;
}

final class SettingsScreenId extends _SId with Identifiable<Object?> {
  const SettingsScreenId(this.id);
  @override
  final Object? id;
}

final class ListingScreenId extends _SId with Identifiable<ListingId> {
  const ListingScreenId(this.id);
  @override
  final ListingId id;
}

final class EditListingScreenId extends _SId with Identifiable<ListingId> {
  const EditListingScreenId(this.id);
  @override
  final ListingId id;
}

final class CartScreenId extends _SId with Identifiable<Object?> {
  const CartScreenId(this.id);
  @override
  final Object? id;
}

final class CheckoutScreenId extends _SId with Identifiable<Object?> {
  const CheckoutScreenId(this.id);
  @override
  final Object? id;
}

final class PaymentScreenId extends _SId with Identifiable<Object?> {
  const PaymentScreenId(this.id);
  @override
  final Object? id;
}

final class ConfirmationScreenId extends _SId with Identifiable<String> {
  const ConfirmationScreenId(this.id);
  @override
  final String id;
}

final class Keep {
  const Keep._(this.spec);
  final Enum spec;
  static const account = Keep._(_Screens.account);
  static const home = Keep._(_Screens.home);
}

final class SplashNav extends AnyPlacement {
  const SplashNav._() : super._();
  SplashNav surface() {
    _Screens.graph.popTo(_Screens.splash);
    return const SplashNav._();
  }
}

final class SignInNav extends AnyPlacement implements PopDestPlacement {
  const SignInNav._() : super._();
  SignInNav surface() {
    _Screens.graph.popTo(_Screens.signIn);
    return const SignInNav._();
  }

  OtpNav goOtp(String id) {
    _Screens.graph.popTo(_Screens.signIn);
    _Screens.graph.go(_Screens.otp, id, true);
    return const OtpNav._();
  }
}

final class OtpNav extends AnyPlacement {
  const OtpNav._() : super._();
  OtpNav surface() {
    _Screens.graph.popTo(_Screens.otp);
    return const OtpNav._();
  }

  SignInNav pop() {
    _Screens.graph.pop();
    return const SignInNav._();
  }
}

final class HomeNav extends AnyPlacement
    implements CategoryHomePopPlacement, PopDestPlacement {
  const HomeNav._() : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  SearchNav goSearch() {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.search, null, true);
    return const SearchNav._();
  }

  CategoryNav goCategory(CategoryId id) {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }

  ScanNav goScan() {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.scan, null, true);
    return const ScanNav._();
  }

  WishlistNav goWishlist() {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.wishlist, null, true);
    return const WishlistNav._();
  }

  CartNav goCart() {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Checkout.cart, null, true);
    return const CartNav._();
  }

  ConfirmationNav goConfirmation(String id) {
    _Screens.graph.go(_Checkout.cart, null, true);
    _Screens.graph.go(_Checkout.checkout, null, true);
    _Screens.graph.go(_Checkout.payment, null, true);
    _Screens.graph.go(_Checkout.confirmation, id, true);
    return const ConfirmationNav._();
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
  static const search = HomeHop<SearchNav>._(
    _Screens.search,
    null,
    SearchNav._(),
  );
  static HomeHop<CategoryNav> category(CategoryId id) =>
      HomeHop._(_Screens.category, id, const CategoryNav._());
  static const scan = HomeHop<ScanNav>._(_Screens.scan, null, ScanNav._());
  static const wishlist = HomeHop<WishlistNav>._(
    _Screens.wishlist,
    null,
    WishlistNav._(),
  );
  static const cart = HomeHop<CartNav>._(_Checkout.cart, null, CartNav._());
}

final class SearchNav extends AnyPlacement
    implements
        SearchView,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement,
        PopDestPlacement {
  const SearchNav._() : super._();
  SearchNav surface() {
    _Screens.graph.popTo(_Screens.search);
    return const SearchNav._();
  }

  SearchQueryMut get query => const SearchQueryMut._();
  HomeSearchProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.search);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeSearchProductNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class ScanNav extends AnyPlacement
    implements
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement,
        PopDestPlacement {
  const ScanNav._() : super._();
  ScanNav surface() {
    _Screens.graph.popTo(_Screens.scan);
    return const ScanNav._();
  }

  HomeScanProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.scan);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeScanProductNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class CategoryNav extends AnyPlacement
    implements
        CategoryHomePopPlacement,
        AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement,
        PopDestPlacement {
  const CategoryNav._() : super._();
  CategoryNav surface() {
    _Screens.graph.popTo(_Screens.category);
    return const CategoryNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.category);
  CategoryNav goCategory(CategoryId id) {
    _Screens.graph.popTo(_Screens.category);
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }

  HomeCategoryProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.category);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeCategoryProductNav._();
  }

  N go<N extends AnyNav>(CategoryHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CategoryHomePopPlacement pop() {
    _Screens.graph.pop();
    return _resolveCategoryHomePopPlacement();
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  N popTo<N extends AnyNav>(CategoryPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CategoryPop<N extends AnyNav> {
  const CategoryPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const home = CategoryPop<HomeNav>._(_Screens.home, HomeNav._());
  static const category = CategoryPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
}

final class CategoryHop<N extends AnyNav> {
  const CategoryHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static CategoryHop<CategoryNav> category(CategoryId id) =>
      CategoryHop._(_Screens.category, id, const CategoryNav._());
  static CategoryHop<HomeCategoryProductNav> product(ProductId id) =>
      CategoryHop._(_Screens.product, id, const HomeCategoryProductNav._());
}

ProductPlacement _resolveProductPlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.search, _Screens.product]))
    return const HomeSearchProductNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.category, _Screens.product]))
    return const HomeCategoryProductNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.scan, _Screens.product]))
    return const HomeScanProductNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.wishlist, _Screens.product]))
    return const HomeWishlistProductNav._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
  ]))
    return const AccountOrdersOrderProductNav._();
  throw StateError('unresolved product placement: $c');
}

sealed class ProductPlacement implements AnyPlacement {
  SellerPlacement goSeller(SellerId id);
  ProductPlacement surface();
  ProductQueryMut get query;
  int get depth;
}

final class HomeSearchProductNav extends AnyPlacement
    implements ProductPlacement, ProductView, PopDestPlacement {
  const HomeSearchProductNav._() : super._();
  HomeSearchProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const HomeSearchProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  int get depth => _Screens.graph.countOf(_Screens.product);
  HomeSearchProductSellerNav goSeller(SellerId id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.seller, id, true);
    return const HomeSearchProductSellerNav._();
  }

  AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement
  pop() {
    _Screens.graph.pop();
    return _resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  N popTo<N extends AnyNav>(HomeSearchProductPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeSearchProductPop<N extends AnyNav> {
  const HomeSearchProductPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const search = HomeSearchProductPop<SearchNav>._(
    _Screens.search,
    SearchNav._(),
  );
  static const home = HomeSearchProductPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeSearchProductPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product = HomeSearchProductPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
}

final class HomeCategoryProductNav extends AnyPlacement
    implements ProductPlacement, ProductView, PopDestPlacement {
  const HomeCategoryProductNav._() : super._();
  HomeCategoryProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const HomeCategoryProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  int get depth => _Screens.graph.countOf(_Screens.product);
  HomeCategoryProductSellerNav goSeller(SellerId id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.seller, id, true);
    return const HomeCategoryProductSellerNav._();
  }

  AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement
  pop() {
    _Screens.graph.pop();
    return _resolveAccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  N popTo<N extends AnyNav>(HomeCategoryProductPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeCategoryProductPop<N extends AnyNav> {
  const HomeCategoryProductPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const category = HomeCategoryProductPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const home = HomeCategoryProductPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeCategoryProductPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product = HomeCategoryProductPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
}

final class HomeScanProductNav extends AnyPlacement
    implements ProductPlacement, ProductView, PopDestPlacement {
  const HomeScanProductNav._() : super._();
  HomeScanProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const HomeScanProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  int get depth => _Screens.graph.countOf(_Screens.product);
  HomeScanProductSellerNav goSeller(SellerId id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.seller, id, true);
    return const HomeScanProductSellerNav._();
  }

  AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement
  pop() {
    _Screens.graph.pop();
    return _resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  N popTo<N extends AnyNav>(HomeScanProductPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeScanProductPop<N extends AnyNav> {
  const HomeScanProductPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const scan = HomeScanProductPop<ScanNav>._(_Screens.scan, ScanNav._());
  static const home = HomeScanProductPop<HomeNav>._(_Screens.home, HomeNav._());
  static const seller = HomeScanProductPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product = HomeScanProductPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
}

final class HomeWishlistProductNav extends AnyPlacement
    implements ProductPlacement, ProductView, PopDestPlacement {
  const HomeWishlistProductNav._() : super._();
  HomeWishlistProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const HomeWishlistProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  int get depth => _Screens.graph.countOf(_Screens.product);
  HomeWishlistProductSellerNav goSeller(SellerId id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.seller, id, true);
    return const HomeWishlistProductSellerNav._();
  }

  AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement
  pop() {
    _Screens.graph.pop();
    return _resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  N popTo<N extends AnyNav>(HomeWishlistProductPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeWishlistProductPop<N extends AnyNav> {
  const HomeWishlistProductPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const wishlist = HomeWishlistProductPop<WishlistNav>._(
    _Screens.wishlist,
    WishlistNav._(),
  );
  static const home = HomeWishlistProductPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeWishlistProductPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product = HomeWishlistProductPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
}

final class AccountOrdersOrderProductNav extends AnyPlacement
    implements ProductPlacement, ProductView, PopDestPlacement {
  const AccountOrdersOrderProductNav._() : super._();
  AccountOrdersOrderProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const AccountOrdersOrderProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  int get depth => _Screens.graph.countOf(_Screens.product);
  AccountOrdersOrderProductSellerNav goSeller(SellerId id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.seller, id, true);
    return const AccountOrdersOrderProductSellerNav._();
  }

  AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement
  pop() {
    _Screens.graph.pop();
    return _resolveAccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement();
  }

  OrdersNav popToOrders() {
    _Screens.graph.pop(_Screens.orders);
    return const OrdersNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  N popTo<N extends AnyNav>(AccountOrdersOrderProductPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AccountOrdersOrderProductPop<N extends AnyNav> {
  const AccountOrdersOrderProductPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const order = AccountOrdersOrderProductPop<OrderNav>._(
    _Screens.order,
    OrderNav._(),
  );
  static const orders = AccountOrdersOrderProductPop<OrdersNav>._(
    _Screens.orders,
    OrdersNav._(),
  );
  static const account = AccountOrdersOrderProductPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const seller = AccountOrdersOrderProductPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product = AccountOrdersOrderProductPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
}

SellerPlacement _resolveSellerPlacement(List<Enum> c) {
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeSearchProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeCategoryProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeScanProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const HomeWishlistProductSellerNav._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const AccountOrdersOrderProductSellerNav._();
  throw StateError('unresolved seller placement: $c');
}

sealed class SellerPlacement implements AnyPlacement {
  ProductPlacement goProduct(ProductId id);
  SellerChatPlacement goSellerChat(SellerChatId id);
  SellerPlacement surface();
  int get depth;
}

sealed class SellerUnder {}

sealed class ProductSellerPlacement implements AnyPlacement {
  ProductPlacement goProduct(ProductId id);
  SellerChatPlacement goSellerChat(SellerChatId id);
  ProductSellerPlacement surface();
  int get depth;
}

final class HomeSearchProductSellerNav extends AnyPlacement
    implements
        SellerPlacement,
        ProductSellerPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement,
        AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement,
        PopDestPlacement {
  const HomeSearchProductSellerNav._() : super._();
  HomeSearchProductSellerNav surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const HomeSearchProductSellerNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.seller);
  HomeSearchProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeSearchProductNav._();
  }

  HomeSearchProductSellerSellerChatNav goSellerChat(SellerChatId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.sellerChat, id, true);
    return const HomeSearchProductSellerSellerChatNav._();
  }

  N go<N extends AnyNav>(HomeSearchProductSellerHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ProductPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.product) as ProductPlacement;
  }

  SearchNav popToSearch() {
    _Screens.graph.pop(_Screens.search);
    return const SearchNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  N popTo<N extends AnyNav>(HomeSearchProductSellerPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeSearchProductSellerPop<N extends AnyNav> {
  const HomeSearchProductSellerPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = HomeSearchProductSellerPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
  static const search = HomeSearchProductSellerPop<SearchNav>._(
    _Screens.search,
    SearchNav._(),
  );
  static const home = HomeSearchProductSellerPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeSearchProductSellerPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
}

final class HomeSearchProductSellerHop<N extends AnyNav> {
  const HomeSearchProductSellerHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static HomeSearchProductSellerHop<HomeSearchProductNav> product(
    ProductId id,
  ) => HomeSearchProductSellerHop._(
    _Screens.product,
    id,
    const HomeSearchProductNav._(),
  );
  static HomeSearchProductSellerHop<HomeSearchProductSellerSellerChatNav>
  sellerChat(SellerChatId id) => HomeSearchProductSellerHop._(
    _Screens.sellerChat,
    id,
    const HomeSearchProductSellerSellerChatNav._(),
  );
}

final class HomeCategoryProductSellerNav extends AnyPlacement
    implements
        SellerPlacement,
        ProductSellerPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement,
        AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement,
        PopDestPlacement {
  const HomeCategoryProductSellerNav._() : super._();
  HomeCategoryProductSellerNav surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const HomeCategoryProductSellerNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.seller);
  HomeCategoryProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeCategoryProductNav._();
  }

  HomeCategoryProductSellerSellerChatNav goSellerChat(SellerChatId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.sellerChat, id, true);
    return const HomeCategoryProductSellerSellerChatNav._();
  }

  N go<N extends AnyNav>(HomeCategoryProductSellerHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ProductPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.product) as ProductPlacement;
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  N popTo<N extends AnyNav>(HomeCategoryProductSellerPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeCategoryProductSellerPop<N extends AnyNav> {
  const HomeCategoryProductSellerPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = HomeCategoryProductSellerPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
  static const category = HomeCategoryProductSellerPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const home = HomeCategoryProductSellerPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeCategoryProductSellerPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
}

final class HomeCategoryProductSellerHop<N extends AnyNav> {
  const HomeCategoryProductSellerHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static HomeCategoryProductSellerHop<HomeCategoryProductNav> product(
    ProductId id,
  ) => HomeCategoryProductSellerHop._(
    _Screens.product,
    id,
    const HomeCategoryProductNav._(),
  );
  static HomeCategoryProductSellerHop<HomeCategoryProductSellerSellerChatNav>
  sellerChat(SellerChatId id) => HomeCategoryProductSellerHop._(
    _Screens.sellerChat,
    id,
    const HomeCategoryProductSellerSellerChatNav._(),
  );
}

final class HomeScanProductSellerNav extends AnyPlacement
    implements
        SellerPlacement,
        ProductSellerPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement,
        AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement,
        PopDestPlacement {
  const HomeScanProductSellerNav._() : super._();
  HomeScanProductSellerNav surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const HomeScanProductSellerNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.seller);
  HomeScanProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeScanProductNav._();
  }

  HomeScanProductSellerSellerChatNav goSellerChat(SellerChatId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.sellerChat, id, true);
    return const HomeScanProductSellerSellerChatNav._();
  }

  N go<N extends AnyNav>(HomeScanProductSellerHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ProductPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.product) as ProductPlacement;
  }

  ScanNav popToScan() {
    _Screens.graph.pop(_Screens.scan);
    return const ScanNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  N popTo<N extends AnyNav>(HomeScanProductSellerPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeScanProductSellerPop<N extends AnyNav> {
  const HomeScanProductSellerPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = HomeScanProductSellerPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
  static const scan = HomeScanProductSellerPop<ScanNav>._(
    _Screens.scan,
    ScanNav._(),
  );
  static const home = HomeScanProductSellerPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeScanProductSellerPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
}

final class HomeScanProductSellerHop<N extends AnyNav> {
  const HomeScanProductSellerHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static HomeScanProductSellerHop<HomeScanProductNav> product(ProductId id) =>
      HomeScanProductSellerHop._(
        _Screens.product,
        id,
        const HomeScanProductNav._(),
      );
  static HomeScanProductSellerHop<HomeScanProductSellerSellerChatNav>
  sellerChat(SellerChatId id) => HomeScanProductSellerHop._(
    _Screens.sellerChat,
    id,
    const HomeScanProductSellerSellerChatNav._(),
  );
}

final class HomeWishlistProductSellerNav extends AnyPlacement
    implements
        SellerPlacement,
        ProductSellerPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement,
        AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement,
        PopDestPlacement {
  const HomeWishlistProductSellerNav._() : super._();
  HomeWishlistProductSellerNav surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const HomeWishlistProductSellerNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.seller);
  HomeWishlistProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeWishlistProductNav._();
  }

  HomeWishlistProductSellerSellerChatNav goSellerChat(SellerChatId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.sellerChat, id, true);
    return const HomeWishlistProductSellerSellerChatNav._();
  }

  N go<N extends AnyNav>(HomeWishlistProductSellerHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ProductPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.product) as ProductPlacement;
  }

  WishlistNav popToWishlist() {
    _Screens.graph.pop(_Screens.wishlist);
    return const WishlistNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  N popTo<N extends AnyNav>(HomeWishlistProductSellerPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeWishlistProductSellerPop<N extends AnyNav> {
  const HomeWishlistProductSellerPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = HomeWishlistProductSellerPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
  static const wishlist = HomeWishlistProductSellerPop<WishlistNav>._(
    _Screens.wishlist,
    WishlistNav._(),
  );
  static const home = HomeWishlistProductSellerPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
  static const seller = HomeWishlistProductSellerPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
}

final class HomeWishlistProductSellerHop<N extends AnyNav> {
  const HomeWishlistProductSellerHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static HomeWishlistProductSellerHop<HomeWishlistProductNav> product(
    ProductId id,
  ) => HomeWishlistProductSellerHop._(
    _Screens.product,
    id,
    const HomeWishlistProductNav._(),
  );
  static HomeWishlistProductSellerHop<HomeWishlistProductSellerSellerChatNav>
  sellerChat(SellerChatId id) => HomeWishlistProductSellerHop._(
    _Screens.sellerChat,
    id,
    const HomeWishlistProductSellerSellerChatNav._(),
  );
}

final class AccountOrdersOrderProductSellerNav extends AnyPlacement
    implements
        SellerPlacement,
        ProductSellerPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerSearchPopPlacement,
        AccountOrdersOrderProductSellerCategoryHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerScanPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement,
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement,
        PopDestPlacement {
  const AccountOrdersOrderProductSellerNav._() : super._();
  AccountOrdersOrderProductSellerNav surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const AccountOrdersOrderProductSellerNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.seller);
  AccountOrdersOrderProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.product, id, true);
    return const AccountOrdersOrderProductNav._();
  }

  AccountOrdersOrderProductSellerSellerChatNav goSellerChat(SellerChatId id) {
    _Screens.graph.popTo(_Screens.seller);
    _Screens.graph.go(_Screens.sellerChat, id, true);
    return const AccountOrdersOrderProductSellerSellerChatNav._();
  }

  N go<N extends AnyNav>(AccountOrdersOrderProductSellerHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ProductPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.product) as ProductPlacement;
  }

  OrderNav popToOrder() {
    _Screens.graph.pop(_Screens.order);
    return const OrderNav._();
  }

  OrdersNav popToOrders() {
    _Screens.graph.pop(_Screens.orders);
    return const OrdersNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  SellerPlacement popToSeller() {
    _Screens.graph.pop(_Screens.seller);
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  N popTo<N extends AnyNav>(AccountOrdersOrderProductSellerPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AccountOrdersOrderProductSellerPop<N extends AnyNav> {
  const AccountOrdersOrderProductSellerPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = AccountOrdersOrderProductSellerPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
  static const order = AccountOrdersOrderProductSellerPop<OrderNav>._(
    _Screens.order,
    OrderNav._(),
  );
  static const orders = AccountOrdersOrderProductSellerPop<OrdersNav>._(
    _Screens.orders,
    OrdersNav._(),
  );
  static const account = AccountOrdersOrderProductSellerPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const seller = AccountOrdersOrderProductSellerPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
}

final class AccountOrdersOrderProductSellerHop<N extends AnyNav> {
  const AccountOrdersOrderProductSellerHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static AccountOrdersOrderProductSellerHop<AccountOrdersOrderProductNav>
  product(ProductId id) => AccountOrdersOrderProductSellerHop._(
    _Screens.product,
    id,
    const AccountOrdersOrderProductNav._(),
  );
  static AccountOrdersOrderProductSellerHop<
    AccountOrdersOrderProductSellerSellerChatNav
  >
  sellerChat(SellerChatId id) => AccountOrdersOrderProductSellerHop._(
    _Screens.sellerChat,
    id,
    const AccountOrdersOrderProductSellerSellerChatNav._(),
  );
}

SellerChatPlacement _resolveSellerChatPlacement(List<Enum> c) {
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const HomeSearchProductSellerSellerChatNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const HomeCategoryProductSellerSellerChatNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const HomeScanProductSellerSellerChatNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const HomeWishlistProductSellerSellerChatNav._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const AccountOrdersOrderProductSellerSellerChatNav._();
  throw StateError('unresolved sellerChat placement: $c');
}

sealed class SellerChatPlacement implements AnyPlacement {
  SellerChatPlacement surface();
}

sealed class SellerChatUnder {}

sealed class SellerSellerChatPlacement implements AnyPlacement {
  SellerSellerChatPlacement surface();
}

sealed class SellerSellerChatUnder {}

sealed class ProductSellerSellerChatPlacement implements AnyPlacement {
  ProductSellerSellerChatPlacement surface();
}

final class HomeSearchProductSellerSellerChatNav extends AnyPlacement
    implements
        SellerChatPlacement,
        SellerSellerChatPlacement,
        ProductSellerSellerChatPlacement {
  const HomeSearchProductSellerSellerChatNav._() : super._();
  HomeSearchProductSellerSellerChatNav surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const HomeSearchProductSellerSellerChatNav._();
  }

  SellerPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  SearchNav popToSearch() {
    _Screens.graph.pop(_Screens.search);
    return const SearchNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeSearchProductSellerSellerChatPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeSearchProductSellerSellerChatPop<N extends AnyNav> {
  const HomeSearchProductSellerSellerChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const seller = HomeSearchProductSellerSellerChatPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product =
      HomeSearchProductSellerSellerChatPop<ProductPlacement>._(
        _Screens.product,
        null,
      );
  static const search = HomeSearchProductSellerSellerChatPop<SearchNav>._(
    _Screens.search,
    SearchNav._(),
  );
  static const home = HomeSearchProductSellerSellerChatPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class HomeCategoryProductSellerSellerChatNav extends AnyPlacement
    implements
        SellerChatPlacement,
        SellerSellerChatPlacement,
        ProductSellerSellerChatPlacement {
  const HomeCategoryProductSellerSellerChatNav._() : super._();
  HomeCategoryProductSellerSellerChatNav surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const HomeCategoryProductSellerSellerChatNav._();
  }

  SellerPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeCategoryProductSellerSellerChatPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeCategoryProductSellerSellerChatPop<N extends AnyNav> {
  const HomeCategoryProductSellerSellerChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const seller =
      HomeCategoryProductSellerSellerChatPop<SellerPlacement>._(
        _Screens.seller,
        null,
      );
  static const product =
      HomeCategoryProductSellerSellerChatPop<ProductPlacement>._(
        _Screens.product,
        null,
      );
  static const category = HomeCategoryProductSellerSellerChatPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const home = HomeCategoryProductSellerSellerChatPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class HomeScanProductSellerSellerChatNav extends AnyPlacement
    implements
        SellerChatPlacement,
        SellerSellerChatPlacement,
        ProductSellerSellerChatPlacement {
  const HomeScanProductSellerSellerChatNav._() : super._();
  HomeScanProductSellerSellerChatNav surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const HomeScanProductSellerSellerChatNav._();
  }

  SellerPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  ScanNav popToScan() {
    _Screens.graph.pop(_Screens.scan);
    return const ScanNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeScanProductSellerSellerChatPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeScanProductSellerSellerChatPop<N extends AnyNav> {
  const HomeScanProductSellerSellerChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const seller = HomeScanProductSellerSellerChatPop<SellerPlacement>._(
    _Screens.seller,
    null,
  );
  static const product = HomeScanProductSellerSellerChatPop<ProductPlacement>._(
    _Screens.product,
    null,
  );
  static const scan = HomeScanProductSellerSellerChatPop<ScanNav>._(
    _Screens.scan,
    ScanNav._(),
  );
  static const home = HomeScanProductSellerSellerChatPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class HomeWishlistProductSellerSellerChatNav extends AnyPlacement
    implements
        SellerChatPlacement,
        SellerSellerChatPlacement,
        ProductSellerSellerChatPlacement {
  const HomeWishlistProductSellerSellerChatNav._() : super._();
  HomeWishlistProductSellerSellerChatNav surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const HomeWishlistProductSellerSellerChatNav._();
  }

  SellerPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  WishlistNav popToWishlist() {
    _Screens.graph.pop(_Screens.wishlist);
    return const WishlistNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeWishlistProductSellerSellerChatPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeWishlistProductSellerSellerChatPop<N extends AnyNav> {
  const HomeWishlistProductSellerSellerChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const seller =
      HomeWishlistProductSellerSellerChatPop<SellerPlacement>._(
        _Screens.seller,
        null,
      );
  static const product =
      HomeWishlistProductSellerSellerChatPop<ProductPlacement>._(
        _Screens.product,
        null,
      );
  static const wishlist = HomeWishlistProductSellerSellerChatPop<WishlistNav>._(
    _Screens.wishlist,
    WishlistNav._(),
  );
  static const home = HomeWishlistProductSellerSellerChatPop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class AccountOrdersOrderProductSellerSellerChatNav extends AnyPlacement
    implements
        SellerChatPlacement,
        SellerSellerChatPlacement,
        ProductSellerSellerChatPlacement {
  const AccountOrdersOrderProductSellerSellerChatNav._() : super._();
  AccountOrdersOrderProductSellerSellerChatNav surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const AccountOrdersOrderProductSellerSellerChatNav._();
  }

  SellerPlacement pop() {
    _Screens.graph.pop();
    return _atOf(_Screens.seller) as SellerPlacement;
  }

  ProductPlacement popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return _atOf(_Screens.product) as ProductPlacement;
  }

  OrderNav popToOrder() {
    _Screens.graph.pop(_Screens.order);
    return const OrderNav._();
  }

  OrdersNav popToOrders() {
    _Screens.graph.pop(_Screens.orders);
    return const OrdersNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  N popTo<N extends AnyNav>(
    AccountOrdersOrderProductSellerSellerChatPop<N> to,
  ) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AccountOrdersOrderProductSellerSellerChatPop<N extends AnyNav> {
  const AccountOrdersOrderProductSellerSellerChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const seller =
      AccountOrdersOrderProductSellerSellerChatPop<SellerPlacement>._(
        _Screens.seller,
        null,
      );
  static const product =
      AccountOrdersOrderProductSellerSellerChatPop<ProductPlacement>._(
        _Screens.product,
        null,
      );
  static const order = AccountOrdersOrderProductSellerSellerChatPop<OrderNav>._(
    _Screens.order,
    OrderNav._(),
  );
  static const orders =
      AccountOrdersOrderProductSellerSellerChatPop<OrdersNav>._(
        _Screens.orders,
        OrdersNav._(),
      );
  static const account =
      AccountOrdersOrderProductSellerSellerChatPop<AccountNav>._(
        _Screens.account,
        AccountNav._(),
      );
}

final class WishlistNav extends AnyPlacement
    implements
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerWishlistPopPlacement,
        PopDestPlacement {
  const WishlistNav._() : super._();
  WishlistNav surface() {
    _Screens.graph.popTo(_Screens.wishlist);
    return const WishlistNav._();
  }

  HomeWishlistProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.wishlist);
    _Screens.graph.go(_Screens.product, id, true);
    return const HomeWishlistProductNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class AccountNav extends AnyPlacement implements PopDestPlacement {
  const AccountNav._() : super._();
  AccountNav surface() {
    _Screens.graph.popTo(_Screens.account);
    return const AccountNav._();
  }

  OrdersNav goOrders() {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.orders, null, true);
    return const OrdersNav._();
  }

  SettingsNav goSettings() {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.settings, null, true);
    return const SettingsNav._();
  }

  ListingNav goListing(ListingId id) {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.listing, id, true);
    return const ListingNav._();
  }

  OrderNav goOrder(OrderId id) {
    _Screens.graph.go(_Screens.orders, null, true);
    _Screens.graph.go(_Screens.order, id, true);
    return const OrderNav._();
  }

  EditListingNav goEditListing(ListingId id) {
    _Screens.graph.go(_Screens.listing, id, true);
    _Screens.graph.go(_Screens.editListing, id, true);
    return const EditListingNav._();
  }

  N go<N extends AnyNav>(AccountHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class AccountHop<N extends AnyNav> {
  const AccountHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const orders = AccountHop<OrdersNav>._(
    _Screens.orders,
    null,
    OrdersNav._(),
  );
  static const settings = AccountHop<SettingsNav>._(
    _Screens.settings,
    null,
    SettingsNav._(),
  );
  static AccountHop<ListingNav> listing(ListingId id) =>
      AccountHop._(_Screens.listing, id, const ListingNav._());
}

final class OrdersNav extends AnyPlacement implements PopDestPlacement {
  const OrdersNav._() : super._();
  OrdersNav surface() {
    _Screens.graph.popTo(_Screens.orders);
    return const OrdersNav._();
  }

  OrderNav goOrder(OrderId id) {
    _Screens.graph.popTo(_Screens.orders);
    _Screens.graph.go(_Screens.order, id, true);
    return const OrderNav._();
  }

  AccountNav pop() {
    _Screens.graph.pop();
    return const AccountNav._();
  }
}

final class OrderNav extends AnyPlacement
    implements
        AccountOrdersOrderProductSellerHomeCategoryProductSellerHomeScanProductSellerHomeSearchProductSellerHomeWishlistProductSellerOrderPopPlacement,
        PopDestPlacement {
  const OrderNav._() : super._();
  OrderNav surface() {
    _Screens.graph.popTo(_Screens.order);
    return const OrderNav._();
  }

  AccountOrdersOrderProductNav goProduct(ProductId id) {
    _Screens.graph.popTo(_Screens.order);
    _Screens.graph.go(_Screens.product, id, true);
    return const AccountOrdersOrderProductNav._();
  }

  OrdersNav pop() {
    _Screens.graph.pop();
    return const OrdersNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  N popTo<N extends AnyNav>(OrderPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class OrderPop<N extends AnyNav> {
  const OrderPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const orders = OrderPop<OrdersNav>._(_Screens.orders, OrdersNav._());
  static const account = OrderPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
}

final class SettingsNav extends AnyPlacement {
  const SettingsNav._() : super._();
  SettingsNav surface() {
    _Screens.graph.popTo(_Screens.settings);
    return const SettingsNav._();
  }

  AccountNav pop() {
    _Screens.graph.pop();
    return const AccountNav._();
  }
}

final class ListingNav extends AnyPlacement implements PopDestPlacement {
  const ListingNav._() : super._();
  ListingNav surface() {
    _Screens.graph.popTo(_Screens.listing);
    return const ListingNav._();
  }

  EditListingNav goEditListing() {
    _Screens.graph.popTo(_Screens.listing);
    _Screens.graph.go(_Screens.editListing, _idOf(_Screens.listing), true);
    return const EditListingNav._();
  }

  AccountNav pop() {
    _Screens.graph.pop();
    return const AccountNav._();
  }
}

final class EditListingNav extends AnyPlacement {
  const EditListingNav._() : super._();
  EditListingNav surface() {
    _Screens.graph.popTo(_Screens.editListing);
    return const EditListingNav._();
  }

  ListingNav pop() {
    _Screens.graph.pop();
    return const ListingNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  N popTo<N extends AnyNav>(EditListingPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EditListingPop<N extends AnyNav> {
  const EditListingPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const listing = EditListingPop<ListingNav>._(
    _Screens.listing,
    ListingNav._(),
  );
  static const account = EditListingPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
}

final class CartNav extends AnyPlacement implements PopDestPlacement {
  const CartNav._() : super._();
  CartNav surface() {
    _Screens.graph.popTo(_Checkout.cart);
    return const CartNav._();
  }

  CheckoutNav goCheckout() {
    _Screens.graph.popTo(_Checkout.cart);
    _Screens.graph.go(_Checkout.checkout, null, true);
    return const CheckoutNav._();
  }

  ConfirmationNav goConfirmation(String id) {
    _Screens.graph.go(_Checkout.checkout, null, true);
    _Screens.graph.go(_Checkout.payment, null, true);
    _Screens.graph.go(_Checkout.confirmation, id, true);
    return const ConfirmationNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class CheckoutNav extends AnyPlacement implements PopDestPlacement {
  const CheckoutNav._() : super._();
  CheckoutNav surface() {
    _Screens.graph.popTo(_Checkout.checkout);
    return const CheckoutNav._();
  }

  PaymentNav goPayment() {
    _Screens.graph.popTo(_Checkout.checkout);
    _Screens.graph.go(_Checkout.payment, null, true);
    return const PaymentNav._();
  }

  ConfirmationNav goConfirmation(String id) {
    _Screens.graph.go(_Checkout.payment, null, true);
    _Screens.graph.go(_Checkout.confirmation, id, true);
    return const ConfirmationNav._();
  }

  CartNav pop() {
    _Screens.graph.pop();
    return const CartNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(CheckoutPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CheckoutPop<N extends AnyNav> {
  const CheckoutPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const cart = CheckoutPop<CartNav>._(_Checkout.cart, CartNav._());
  static const home = CheckoutPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class PaymentNav extends AnyPlacement implements PopDestPlacement {
  const PaymentNav._() : super._();
  PaymentNav surface() {
    _Screens.graph.popTo(_Checkout.payment);
    return const PaymentNav._();
  }

  ConfirmationNav goConfirmation(String id) {
    _Screens.graph.popTo(_Checkout.payment);
    _Screens.graph.go(_Checkout.confirmation, id, true);
    return const ConfirmationNav._();
  }

  CheckoutNav pop() {
    _Screens.graph.pop();
    return const CheckoutNav._();
  }

  CartNav popToCart() {
    _Screens.graph.pop(_Checkout.cart);
    return const CartNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(PaymentPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class PaymentPop<N extends AnyNav> {
  const PaymentPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const checkout = PaymentPop<CheckoutNav>._(
    _Checkout.checkout,
    CheckoutNav._(),
  );
  static const cart = PaymentPop<CartNav>._(_Checkout.cart, CartNav._());
  static const home = PaymentPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class ConfirmationNav extends AnyPlacement {
  const ConfirmationNav._() : super._();
  ConfirmationNav surface() {
    _Screens.graph.popTo(_Checkout.confirmation);
    return const ConfirmationNav._();
  }

  PaymentNav pop() {
    _Screens.graph.pop();
    return const PaymentNav._();
  }

  CheckoutNav popToCheckout() {
    _Screens.graph.pop(_Checkout.checkout);
    return const CheckoutNav._();
  }

  CartNav popToCart() {
    _Screens.graph.pop(_Checkout.cart);
    return const CartNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(ConfirmationPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ConfirmationPop<N extends AnyNav> {
  const ConfirmationPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const payment = ConfirmationPop<PaymentNav>._(
    _Checkout.payment,
    PaymentNav._(),
  );
  static const checkout = ConfirmationPop<CheckoutNav>._(
    _Checkout.checkout,
    CheckoutNav._(),
  );
  static const cart = ConfirmationPop<CartNav>._(_Checkout.cart, CartNav._());
  static const home = ConfirmationPop<HomeNav>._(_Screens.home, HomeNav._());
}

extension type const ScreenId<I>._(Enum spec) {
  static const otp = ScreenId<String>._(_Screens.otp);
  static const category = ScreenId<CategoryId>._(_Screens.category);
  static const product = ScreenId<ProductId>._(_Screens.product);
  static const seller = ScreenId<SellerId>._(_Screens.seller);
  static const sellerChat = ScreenId<SellerChatId>._(_Screens.sellerChat);
  static const order = ScreenId<OrderId>._(_Screens.order);
  static const listing = ScreenId<ListingId>._(_Screens.listing);
  static const editListing = ScreenId<ListingId>._(_Screens.editListing);
  static const confirmation = ScreenId<String>._(_Checkout.confirmation);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));
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
      _Screens.otp.id != null,
      'otp is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.home.id == null,
      'home has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.search.id == null,
      'search has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.scan.id == null,
      'scan has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.category.id != null,
      'category is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.product.id != null,
      'product is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.seller.id != null,
      'seller is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.sellerChat.id != null,
      'sellerChat is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.wishlist.id == null,
      'wishlist has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.account.id == null,
      'account has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.orders.id == null,
      'orders has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.order.id != null,
      'order is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.settings.id == null,
      'settings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.listing.id != null,
      'listing is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.editListing.id != null,
      'editListing is missing its id codec — rerun build_runner',
    );
    assert(
      _Checkout.cart.id == null,
      'cart has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Checkout.checkout.id == null,
      'checkout has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Checkout.payment.id == null,
      'payment has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Checkout.confirmation.id != null,
      'confirmation is missing its id codec — rerun build_runner',
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

/// A URL the app understands: a [Place] or a [Link]. Build one with
/// `Url.<route>…` and `.toUri([domain])`; `parseUrl` returns one.
sealed class Url {
  const Url([this.domain]);
  Uri toUri([String? domain]);

  /// The inbound origin (`scheme://host[:port]`) when this came from
  /// `parseUrl` (read it in `Screen.resolver`); null when built locally.
  final String? domain;
  static _WLSplash get splash => _WLSplash._([_Screens.splash], [null]);
  static _WLSignIn get signIn => _WLSignIn._([_Screens.signIn], [null]);
  static _WLSignInOtp otp(String id) =>
      _WLSignInOtp._([_Screens.signIn, _Screens.otp], [null, id]);
  static _WLHome get home => _WLHome._([_Screens.home], [null]);
  static _WLHomeSearch get search =>
      _WLHomeSearch._([_Screens.home, _Screens.search], [null, null]);
  static _WLHomeScan get scan =>
      _WLHomeScan._([_Screens.home, _Screens.scan], [null, null]);
  static _WLHomeCategory category(CategoryId id) =>
      _WLHomeCategory._([_Screens.home, _Screens.category], [null, id]);
  static _WLHomeWishlist get wishlist =>
      _WLHomeWishlist._([_Screens.home, _Screens.wishlist], [null, null]);
  static _WLAccount get account => _WLAccount._([_Screens.account], [null]);
  static _WLAccountOrders get orders =>
      _WLAccountOrders._([_Screens.account, _Screens.orders], [null, null]);
  static _WLAccountOrdersOrder order(OrderId id) => _WLAccountOrdersOrder._(
    [_Screens.account, _Screens.orders, _Screens.order],
    [null, null, id],
  );
  static _WLAccountSettings get settings =>
      _WLAccountSettings._([_Screens.account, _Screens.settings], [null, null]);
  static _WLAccountListing listing(ListingId id) =>
      _WLAccountListing._([_Screens.account, _Screens.listing], [null, id]);
  static _WLAccountListingEditListing editListing(ListingId id) =>
      _WLAccountListingEditListing._(
        [_Screens.account, _Screens.listing, _Screens.editListing],
        [null, id, null],
      );
  static _WLHomeCart get cart =>
      _WLHomeCart._([_Screens.home, _Checkout.cart], [null, null]);
  static _WLHomeCartCheckout get checkout => _WLHomeCartCheckout._(
    [_Screens.home, _Checkout.cart, _Checkout.checkout],
    [null, null, null],
  );
  static _WLHomeCartCheckoutPayment get payment => _WLHomeCartCheckoutPayment._(
    [_Screens.home, _Checkout.cart, _Checkout.checkout, _Checkout.payment],
    [null, null, null, null],
  );
  static _WLHomeCartCheckoutPaymentConfirmation confirmation(String id) =>
      _WLHomeCartCheckoutPaymentConfirmation._(
        [
          _Screens.home,
          _Checkout.cart,
          _Checkout.checkout,
          _Checkout.payment,
          _Checkout.confirmation,
        ],
        [null, null, null, null, id],
      );
  static _LXProduct get product => _LXProduct(const <Object?>[], const <int>[]);
}

/// A POSITION in the tree — a screen with a widget to present and a nav
/// destination. Go-able: every `Place` is a [Hop], so `Screen.go(place)`
/// replays its root-down chain and lands the placement. Built root-down
/// (`Place.home.item(id)`); a parsed nav-mirror URL is one.
sealed class Place extends Url implements Hop<AnyNav> {
  const Place([super.domain]);
  @override
  List<(Enum, Object?)> get chain;
  @override
  Enum get spec => chain.last.$1;
  @override
  Object? get id => chain.last.$2;
  @override
  AnyNav get nav => _atOf(_Screens.graph.current);
  static _WLSplash get splash => _WLSplash._([_Screens.splash], [null]);
  static _WLSignIn get signIn => _WLSignIn._([_Screens.signIn], [null]);
  static _WLSignInOtp otp(String id) =>
      _WLSignInOtp._([_Screens.signIn, _Screens.otp], [null, id]);
  static _WLHome get home => _WLHome._([_Screens.home], [null]);
  static _WLHomeSearch get search =>
      _WLHomeSearch._([_Screens.home, _Screens.search], [null, null]);
  static _WLHomeScan get scan =>
      _WLHomeScan._([_Screens.home, _Screens.scan], [null, null]);
  static _WLHomeCategory category(CategoryId id) =>
      _WLHomeCategory._([_Screens.home, _Screens.category], [null, id]);
  static _WLHomeWishlist get wishlist =>
      _WLHomeWishlist._([_Screens.home, _Screens.wishlist], [null, null]);
  static _WLAccount get account => _WLAccount._([_Screens.account], [null]);
  static _WLAccountOrders get orders =>
      _WLAccountOrders._([_Screens.account, _Screens.orders], [null, null]);
  static _WLAccountOrdersOrder order(OrderId id) => _WLAccountOrdersOrder._(
    [_Screens.account, _Screens.orders, _Screens.order],
    [null, null, id],
  );
  static _WLAccountSettings get settings =>
      _WLAccountSettings._([_Screens.account, _Screens.settings], [null, null]);
  static _WLAccountListing listing(ListingId id) =>
      _WLAccountListing._([_Screens.account, _Screens.listing], [null, id]);
  static _WLAccountListingEditListing editListing(ListingId id) =>
      _WLAccountListingEditListing._(
        [_Screens.account, _Screens.listing, _Screens.editListing],
        [null, id, null],
      );
  static _WLHomeCart get cart =>
      _WLHomeCart._([_Screens.home, _Checkout.cart], [null, null]);
  static _WLHomeCartCheckout get checkout => _WLHomeCartCheckout._(
    [_Screens.home, _Checkout.cart, _Checkout.checkout],
    [null, null, null],
  );
  static _WLHomeCartCheckoutPayment get payment => _WLHomeCartCheckoutPayment._(
    [_Screens.home, _Checkout.cart, _Checkout.checkout, _Checkout.payment],
    [null, null, null, null],
  );
  static _WLHomeCartCheckoutPaymentConfirmation confirmation(String id) =>
      _WLHomeCartCheckoutPaymentConfirmation._(
        [
          _Screens.home,
          _Checkout.cart,
          _Checkout.checkout,
          _Checkout.payment,
          _Checkout.confirmation,
        ],
        [null, null, null, null, id],
      );
}

/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA
/// the resolver interprets. NOT a position — no widget, never navigable.
/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.
sealed class Link extends Url {
  const Link([super.domain]);
  static _LXProduct get product => _LXProduct(const <Object?>[], const <int>[]);
}

/// The bare root `/` — a plain app-open (no specific destination).
final class RootUrl extends Url {
  const RootUrl([super.domain]);
  @override
  Uri toUri([String? domain]) =>
      Uri.parse((domain ?? 'https://shop.example') + '/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class _NavPlace extends Place {
  const _NavPlace(this.chain, [super.domain]);
  @override
  final List<(Enum, Object?)> chain;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      [for (final c in chain) c.$1],
      [for (final c in chain) c.$2],
    ),
  );
}

sealed class ProductLink implements Url {}

final class ProductByUuidLink extends Link implements ProductLink {
  const ProductByUuidLink(this.uuid, [super.domain]);
  final String uuid;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://shop.example',
      'product/*',
      <Object?>[uuid],
      <int>[0],
    ),
  );
}

final class ProductByUsernameLink extends Link implements ProductLink {
  const ProductByUsernameLink(this.username, [super.domain]);
  final String username;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://shop.example',
      'product/*',
      <Object?>[username],
      <int>[1],
    ),
  );
}

/// Parses [url] into a [Url]: a declared [Link], a nav-mirror [Place]
/// (go-able), [RootUrl] for bare `/`, or null if it resolves to nothing.
/// The result carries the inbound origin in [Url.domain].
Url? parseUrl(String url) {
  final uri = Uri.parse(url);
  final origin = uri.hasAuthority ? '${uri.scheme}://${uri.authority}' : null;
  final m = _Screens.graph.parseLink(url);
  if (m != null) {
    final link = switch (m.template) {
      'product/*' => switch (m.branches[0]) {
        0 => ProductByUuidLink(m.path[0] as String, origin),
        1 => ProductByUsernameLink(m.path[0] as String, origin),
        _ => throw StateError('bad union branch'),
      },
      _ => null,
    };
    if (link != null) return link;
  }
  // Bare root → a plain app-open.
  if (uri.pathSegments.where((s) => s.isNotEmpty).isEmpty) {
    return RootUrl(origin);
  }
  // Nav-mirror path → a go-able Place.
  final chain = _Screens.graph.parsePath(url);
  if (chain != null) return _NavPlace(chain, origin);
  return null;
}

class _LXProduct {
  _LXProduct(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  _LXProductSlot byUuid(String uuid) =>
      _LXProductSlot([..._p, uuid], [..._b, 0]);
  _LXProductSlot byUsername(String username) =>
      _LXProductSlot([..._p, username], [..._b, 1]);
}

class _LXProductSlot {
  _LXProductSlot(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://shop.example',
      'product/*',
      _p,
      _b,
    ),
  );
}

final class _WLSplash implements Hop<SplashNav> {
  const _WLSplash._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SplashNav get nav => const SplashNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLSignIn implements Hop<SignInNav> {
  const _WLSignIn._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SignInNav get nav => const SignInNav._();
  _WLSignInOtp otp(String id) =>
      _WLSignInOtp._([..._s, _Screens.otp], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLSignInOtp implements Hop<OtpNav> {
  const _WLSignInOtp._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  OtpNav get nav => const OtpNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHome implements Hop<HomeNav> {
  const _WLHome._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeNav get nav => const HomeNav._();
  _WLHomeSearch get search =>
      _WLHomeSearch._([..._s, _Screens.search], [..._i, null]);
  _WLHomeCategory category(CategoryId id) =>
      _WLHomeCategory._([..._s, _Screens.category], [..._i, id]);
  _WLHomeScan get scan => _WLHomeScan._([..._s, _Screens.scan], [..._i, null]);
  _WLHomeWishlist get wishlist =>
      _WLHomeWishlist._([..._s, _Screens.wishlist], [..._i, null]);
  _WLHomeCart get cart => _WLHomeCart._([..._s, _Checkout.cart], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeSearch implements Hop<SearchNav> {
  const _WLHomeSearch._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SearchNav get nav => const SearchNav._();
  _WLHomeSearchProduct product(ProductId id) =>
      _WLHomeSearchProduct._([..._s, _Screens.product], [..._i, id]);
  _WLHomeSearchQ query(Set<SearchQueryArg> q) =>
      _WLHomeSearchQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

class _WLHomeSearchQ {
  _WLHomeSearchQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeSearchProduct implements Hop<HomeSearchProductNav> {
  const _WLHomeSearchProduct._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeSearchProductNav get nav => const HomeSearchProductNav._();
  _WLHomeSearchProductSeller seller(SellerId id) =>
      _WLHomeSearchProductSeller._([..._s, _Screens.seller], [..._i, id]);
  _WLHomeSearchProductQ query(Set<ProductQueryArg> q) => _WLHomeSearchProductQ(
    _s,
    _i,
    {for (final t in q) t.key: t.value},
    const {},
  );
  _WLHomeSearchProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeSearchProductF(_s, _i, const {}, {
        for (final t in f) t.key: t.value,
      });
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

class _WLHomeSearchProductQ {
  _WLHomeSearchProductQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLHomeSearchProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeSearchProductF(_s, _i, _q, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLHomeSearchProductF {
  _WLHomeSearchProductF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeSearchProductSeller
    implements Hop<HomeSearchProductSellerNav> {
  const _WLHomeSearchProductSeller._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeSearchProductSellerNav get nav => const HomeSearchProductSellerNav._();
  _WLHomeSearchProductSellerSellerChat sellerChat(SellerChatId id) =>
      _WLHomeSearchProductSellerSellerChat._(
        [..._s, _Screens.sellerChat],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeSearchProductSellerSellerChat
    implements Hop<HomeSearchProductSellerSellerChatNav> {
  const _WLHomeSearchProductSellerSellerChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeSearchProductSellerSellerChatNav get nav =>
      const HomeSearchProductSellerSellerChatNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCategory implements Hop<CategoryNav> {
  const _WLHomeCategory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CategoryNav get nav => const CategoryNav._();
  _WLHomeCategoryProduct product(ProductId id) =>
      _WLHomeCategoryProduct._([..._s, _Screens.product], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCategoryProduct implements Hop<HomeCategoryProductNav> {
  const _WLHomeCategoryProduct._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeCategoryProductNav get nav => const HomeCategoryProductNav._();
  _WLHomeCategoryProductSeller seller(SellerId id) =>
      _WLHomeCategoryProductSeller._([..._s, _Screens.seller], [..._i, id]);
  _WLHomeCategoryProductQ query(Set<ProductQueryArg> q) =>
      _WLHomeCategoryProductQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  _WLHomeCategoryProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeCategoryProductF(_s, _i, const {}, {
        for (final t in f) t.key: t.value,
      });
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

class _WLHomeCategoryProductQ {
  _WLHomeCategoryProductQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLHomeCategoryProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeCategoryProductF(_s, _i, _q, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLHomeCategoryProductF {
  _WLHomeCategoryProductF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeCategoryProductSeller
    implements Hop<HomeCategoryProductSellerNav> {
  const _WLHomeCategoryProductSeller._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeCategoryProductSellerNav get nav =>
      const HomeCategoryProductSellerNav._();
  _WLHomeCategoryProductSellerSellerChat sellerChat(SellerChatId id) =>
      _WLHomeCategoryProductSellerSellerChat._(
        [..._s, _Screens.sellerChat],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCategoryProductSellerSellerChat
    implements Hop<HomeCategoryProductSellerSellerChatNav> {
  const _WLHomeCategoryProductSellerSellerChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeCategoryProductSellerSellerChatNav get nav =>
      const HomeCategoryProductSellerSellerChatNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeScan implements Hop<ScanNav> {
  const _WLHomeScan._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ScanNav get nav => const ScanNav._();
  _WLHomeScanProduct product(ProductId id) =>
      _WLHomeScanProduct._([..._s, _Screens.product], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeScanProduct implements Hop<HomeScanProductNav> {
  const _WLHomeScanProduct._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeScanProductNav get nav => const HomeScanProductNav._();
  _WLHomeScanProductSeller seller(SellerId id) =>
      _WLHomeScanProductSeller._([..._s, _Screens.seller], [..._i, id]);
  _WLHomeScanProductQ query(Set<ProductQueryArg> q) => _WLHomeScanProductQ(
    _s,
    _i,
    {for (final t in q) t.key: t.value},
    const {},
  );
  _WLHomeScanProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeScanProductF(_s, _i, const {}, {
        for (final t in f) t.key: t.value,
      });
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

class _WLHomeScanProductQ {
  _WLHomeScanProductQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLHomeScanProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeScanProductF(_s, _i, _q, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLHomeScanProductF {
  _WLHomeScanProductF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeScanProductSeller implements Hop<HomeScanProductSellerNav> {
  const _WLHomeScanProductSeller._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeScanProductSellerNav get nav => const HomeScanProductSellerNav._();
  _WLHomeScanProductSellerSellerChat sellerChat(SellerChatId id) =>
      _WLHomeScanProductSellerSellerChat._(
        [..._s, _Screens.sellerChat],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeScanProductSellerSellerChat
    implements Hop<HomeScanProductSellerSellerChatNav> {
  const _WLHomeScanProductSellerSellerChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeScanProductSellerSellerChatNav get nav =>
      const HomeScanProductSellerSellerChatNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeWishlist implements Hop<WishlistNav> {
  const _WLHomeWishlist._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WishlistNav get nav => const WishlistNav._();
  _WLHomeWishlistProduct product(ProductId id) =>
      _WLHomeWishlistProduct._([..._s, _Screens.product], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeWishlistProduct implements Hop<HomeWishlistProductNav> {
  const _WLHomeWishlistProduct._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeWishlistProductNav get nav => const HomeWishlistProductNav._();
  _WLHomeWishlistProductSeller seller(SellerId id) =>
      _WLHomeWishlistProductSeller._([..._s, _Screens.seller], [..._i, id]);
  _WLHomeWishlistProductQ query(Set<ProductQueryArg> q) =>
      _WLHomeWishlistProductQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  _WLHomeWishlistProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeWishlistProductF(_s, _i, const {}, {
        for (final t in f) t.key: t.value,
      });
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

class _WLHomeWishlistProductQ {
  _WLHomeWishlistProductQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLHomeWishlistProductF fragment(Set<ProductFragmentArg> f) =>
      _WLHomeWishlistProductF(_s, _i, _q, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLHomeWishlistProductF {
  _WLHomeWishlistProductF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeWishlistProductSeller
    implements Hop<HomeWishlistProductSellerNav> {
  const _WLHomeWishlistProductSeller._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeWishlistProductSellerNav get nav =>
      const HomeWishlistProductSellerNav._();
  _WLHomeWishlistProductSellerSellerChat sellerChat(SellerChatId id) =>
      _WLHomeWishlistProductSellerSellerChat._(
        [..._s, _Screens.sellerChat],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeWishlistProductSellerSellerChat
    implements Hop<HomeWishlistProductSellerSellerChatNav> {
  const _WLHomeWishlistProductSellerSellerChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeWishlistProductSellerSellerChatNav get nav =>
      const HomeWishlistProductSellerSellerChatNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCart implements Hop<CartNav> {
  const _WLHomeCart._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CartNav get nav => const CartNav._();
  _WLHomeCartCheckout get checkout =>
      _WLHomeCartCheckout._([..._s, _Checkout.checkout], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCartCheckout implements Hop<CheckoutNav> {
  const _WLHomeCartCheckout._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CheckoutNav get nav => const CheckoutNav._();
  _WLHomeCartCheckoutPayment get payment =>
      _WLHomeCartCheckoutPayment._([..._s, _Checkout.payment], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCartCheckoutPayment implements Hop<PaymentNav> {
  const _WLHomeCartCheckoutPayment._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PaymentNav get nav => const PaymentNav._();
  _WLHomeCartCheckoutPaymentConfirmation confirmation(String id) =>
      _WLHomeCartCheckoutPaymentConfirmation._(
        [..._s, _Checkout.confirmation],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLHomeCartCheckoutPaymentConfirmation
    implements Hop<ConfirmationNav> {
  const _WLHomeCartCheckoutPaymentConfirmation._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ConfirmationNav get nav => const ConfirmationNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccount implements Hop<AccountNav> {
  const _WLAccount._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountNav get nav => const AccountNav._();
  _WLAccountOrders get orders =>
      _WLAccountOrders._([..._s, _Screens.orders], [..._i, null]);
  _WLAccountSettings get settings =>
      _WLAccountSettings._([..._s, _Screens.settings], [..._i, null]);
  _WLAccountListing listing(ListingId id) =>
      _WLAccountListing._([..._s, _Screens.listing], [..._i, id]);
  _WLAccountListingEditListing editListing(ListingId id) =>
      _WLAccountListingEditListing._(
        [..._s, _Screens.listing, _Screens.editListing],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountOrders implements Hop<OrdersNav> {
  const _WLAccountOrders._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  OrdersNav get nav => const OrdersNav._();
  _WLAccountOrdersOrder order(OrderId id) =>
      _WLAccountOrdersOrder._([..._s, _Screens.order], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountOrdersOrder implements Hop<OrderNav> {
  const _WLAccountOrdersOrder._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  OrderNav get nav => const OrderNav._();
  _WLAccountOrdersOrderProduct product(ProductId id) =>
      _WLAccountOrdersOrderProduct._([..._s, _Screens.product], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountOrdersOrderProduct
    implements Hop<AccountOrdersOrderProductNav> {
  const _WLAccountOrdersOrderProduct._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountOrdersOrderProductNav get nav =>
      const AccountOrdersOrderProductNav._();
  _WLAccountOrdersOrderProductSeller seller(SellerId id) =>
      _WLAccountOrdersOrderProductSeller._(
        [..._s, _Screens.seller],
        [..._i, id],
      );
  _WLAccountOrdersOrderProductQ query(Set<ProductQueryArg> q) =>
      _WLAccountOrdersOrderProductQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  _WLAccountOrdersOrderProductF fragment(Set<ProductFragmentArg> f) =>
      _WLAccountOrdersOrderProductF(_s, _i, const {}, {
        for (final t in f) t.key: t.value,
      });
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

class _WLAccountOrdersOrderProductQ {
  _WLAccountOrdersOrderProductQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLAccountOrdersOrderProductF fragment(Set<ProductFragmentArg> f) =>
      _WLAccountOrdersOrderProductF(_s, _i, _q, {
        for (final t in f) t.key: t.value,
      });
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLAccountOrdersOrderProductF {
  _WLAccountOrdersOrderProductF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://shop.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLAccountOrdersOrderProductSeller
    implements Hop<AccountOrdersOrderProductSellerNav> {
  const _WLAccountOrdersOrderProductSeller._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountOrdersOrderProductSellerNav get nav =>
      const AccountOrdersOrderProductSellerNav._();
  _WLAccountOrdersOrderProductSellerSellerChat sellerChat(SellerChatId id) =>
      _WLAccountOrdersOrderProductSellerSellerChat._(
        [..._s, _Screens.sellerChat],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountOrdersOrderProductSellerSellerChat
    implements Hop<AccountOrdersOrderProductSellerSellerChatNav> {
  const _WLAccountOrdersOrderProductSellerSellerChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountOrdersOrderProductSellerSellerChatNav get nav =>
      const AccountOrdersOrderProductSellerSellerChatNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountSettings implements Hop<SettingsNav> {
  const _WLAccountSettings._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SettingsNav get nav => const SettingsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountListing implements Hop<ListingNav> {
  const _WLAccountListing._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ListingNav get nav => const ListingNav._();
  _WLAccountListingEditListing get editListing =>
      _WLAccountListingEditListing._(
        [..._s, _Screens.editListing],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
}

final class _WLAccountListingEditListing implements Hop<EditListingNav> {
  const _WLAccountListingEditListing._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditListingNav get nav => const EditListingNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://shop.example', _s, _i),
  );
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

  static QueryCond<String> get q =>
      const QueryCond._('q', null, presence: true);
  static QueryCond<Sort> get sort =>
      const QueryCond._('sort', null, presence: true);
  static QueryCond<int> get minPrice =>
      const QueryCond._('minPrice', null, presence: true);
  static QueryCond<int> get maxPrice =>
      const QueryCond._('maxPrice', null, presence: true);
  static QueryCond<String> get variant =>
      const QueryCond._('variant', null, presence: true);
  static const QueryNot not = QueryNot._();
}

final class QueryNot {
  const QueryNot._();
  QueryCond<String> get q =>
      const QueryCond._('q', null, presence: true, negate: true);
  QueryCond<Sort> get sort =>
      const QueryCond._('sort', null, presence: true, negate: true);
  QueryCond<int> get minPrice =>
      const QueryCond._('minPrice', null, presence: true, negate: true);
  QueryCond<int> get maxPrice =>
      const QueryCond._('maxPrice', null, presence: true, negate: true);
  QueryCond<String> get variant =>
      const QueryCond._('variant', null, presence: true, negate: true);
}

/// GLOBAL fragment condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class FragmentCond<T> implements ViewCond {
  const FragmentCond._(
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
  FragmentCond<T> call(T v) => FragmentCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static FragmentCond<String> get tab =>
      const FragmentCond._('tab', null, presence: true);
  static const FragmentNot not = FragmentNot._();
}

final class FragmentNot {
  const FragmentNot._();
  FragmentCond<String> get tab =>
      const FragmentCond._('tab', null, presence: true, negate: true);
}

/// Screen-local query view-state for `search` (read-only).
class SearchQuery {
  const SearchQuery._();
  String? get q => _Screens.graph.viewGet(_Screens.search, 'q') as String?;
  Sort? get sort => _Screens.graph.viewGet(_Screens.search, 'sort') as Sort?;
  ({int minPrice, int maxPrice})? get group {
    final minPrice =
        _Screens.graph.viewGet(_Screens.search, 'minPrice') as int?;
    final maxPrice =
        _Screens.graph.viewGet(_Screens.search, 'maxPrice') as int?;
    return (minPrice != null && maxPrice != null)
        ? (minPrice: minPrice, maxPrice: maxPrice)
        : null;
  }
}

/// Mutable [SearchQuery] — set a key (null clears / removes from URL).
final class SearchQueryMut extends SearchQuery {
  const SearchQueryMut._() : super._();
  set q(String? v) => _Screens.graph.viewSet(_Screens.search, 'q', v);
  set sort(Sort? v) => _Screens.graph.viewSet(_Screens.search, 'sort', v);
  set group(({int minPrice, int maxPrice})? v) {
    _Screens.graph.viewSet(_Screens.search, 'minPrice', v?.minPrice);
    _Screens.graph.viewSet(_Screens.search, 'maxPrice', v?.maxPrice);
  }
}

/// `Search` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class SearchQueryCond<T> implements ViewCond {
  const SearchQueryCond._(
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
  SearchQueryCond<T> call(T v) => SearchQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static SearchQueryCond<String> get q =>
      const SearchQueryCond._('q', null, presence: true);
  static SearchQueryCond<Sort> get sort =>
      const SearchQueryCond._('sort', null, presence: true);
  static SearchQueryCond<int> get minPrice =>
      const SearchQueryCond._('minPrice', null, presence: true);
  static SearchQueryCond<int> get maxPrice =>
      const SearchQueryCond._('maxPrice', null, presence: true);
  static const SearchQueryNot not = SearchQueryNot._();
}

final class SearchQueryNot {
  const SearchQueryNot._();
  SearchQueryCond<String> get q =>
      const SearchQueryCond._('q', null, presence: true, negate: true);
  SearchQueryCond<Sort> get sort =>
      const SearchQueryCond._('sort', null, presence: true, negate: true);
  SearchQueryCond<int> get minPrice =>
      const SearchQueryCond._('minPrice', null, presence: true, negate: true);
  SearchQueryCond<int> get maxPrice =>
      const SearchQueryCond._('maxPrice', null, presence: true, negate: true);
}

/// `Search` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class SearchQueryArg {
  const SearchQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static SearchQueryArg q(String v) => SearchQueryArg._('q', v);
  static SearchQueryArg sort(Sort v) => SearchQueryArg._('sort', v);
  static SearchQueryArg minPrice(int v) => SearchQueryArg._('minPrice', v);
  static SearchQueryArg maxPrice(int v) => SearchQueryArg._('maxPrice', v);
}

/// Read-only view-state of `search` — the reactive reads return
/// this; the navigable `SearchNav` adds the setters.
abstract interface class SearchView implements AnyView {
  SearchQuery get query;
}

/// Screen-local query view-state for `product` (read-only).
class ProductQuery {
  const ProductQuery._();
  String? get variant =>
      _Screens.graph.viewGet(_Screens.product, 'variant') as String?;
}

/// Mutable [ProductQuery] — set a key (null clears / removes from URL).
final class ProductQueryMut extends ProductQuery {
  const ProductQueryMut._() : super._();
  set variant(String? v) =>
      _Screens.graph.viewSet(_Screens.product, 'variant', v);
}

/// Screen-local fragment view-state for `product` (read-only).
class ProductFragment {
  const ProductFragment._();
  String? get tab => _Screens.graph.viewGet(_Screens.product, 'tab') as String?;
}

/// Mutable [ProductFragment] — set a key (null clears / removes from URL).
final class ProductFragmentMut extends ProductFragment {
  const ProductFragmentMut._() : super._();
  set tab(String? v) => _Screens.graph.viewSet(_Screens.product, 'tab', v);
}

/// `Product` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ProductQueryCond<T> implements ViewCond {
  const ProductQueryCond._(
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
  ProductQueryCond<T> call(T v) =>
      ProductQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static ProductQueryCond<String> get variant =>
      const ProductQueryCond._('variant', null, presence: true);
  static const ProductQueryNot not = ProductQueryNot._();
}

final class ProductQueryNot {
  const ProductQueryNot._();
  ProductQueryCond<String> get variant =>
      const ProductQueryCond._('variant', null, presence: true, negate: true);
}

/// `Product` fragment condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ProductFragmentCond<T> implements ViewCond {
  const ProductFragmentCond._(
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
  ProductFragmentCond<T> call(T v) =>
      ProductFragmentCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static ProductFragmentCond<String> get tab =>
      const ProductFragmentCond._('tab', null, presence: true);
  static const ProductFragmentNot not = ProductFragmentNot._();
}

final class ProductFragmentNot {
  const ProductFragmentNot._();
  ProductFragmentCond<String> get tab =>
      const ProductFragmentCond._('tab', null, presence: true, negate: true);
}

/// `Product` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ProductQueryArg {
  const ProductQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static ProductQueryArg variant(String v) => ProductQueryArg._('variant', v);
}

/// `Product` fragment build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ProductFragmentArg {
  const ProductFragmentArg._(this.key, this.value);
  final String key;
  final Object? value;
  static ProductFragmentArg tab(String v) => ProductFragmentArg._('tab', v);
}

/// Read-only view-state of `product` — the reactive reads return
/// this; the navigable `ProductNav` adds the setters.
abstract interface class ProductView implements AnyView {
  ProductQuery get query;
  ProductFragment get fragment;
}

AnyView? _viewOf(Enum? screen) => switch (screen) {
  _Screens.search => const SearchNav._(),
  _Screens.product => _atOf(_Screens.product) as AnyView?,
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
