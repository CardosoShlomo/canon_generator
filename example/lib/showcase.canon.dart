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

extension type const ShopperId(String _) implements String {
  static const Ids node = Ids.shopper;
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

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: annotate_overrides
Object? _idOf(Enum s) {
  for (final e in _Screens.graph.stack.reversed) {
    if (e.screen == s) return e.id;
  }
  return null;
}

bool _chainIs(List<Enum> a, List<Enum> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

final class const Screen<I>._(final Enum _spec) {
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
  static const _treeSignature =
      'accountK(listing(editListing()),orders(order(product(seller(productA(),sellerChat())))),settings());homeK(cart(checkout(payment(confirmation()))),category(categoryA(),product(seller(productA(),sellerChat()))),scanF(product(seller(productA(),sellerChat()))),search(product(seller(productA(),sellerChat()))),wishlist(product(seller(productA(),sellerChat()))));signIn(otp());splash()';

  /// True when this generated code still matches the live tree.
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
  /// `MaterialApp.router(routerDelegate: Screen.manager)`.
  static NavDelegate get manager {
    assert(_fresh);
    ledger.bind();
    return _Screens.graph.delegate;
  }

  /// Executes a resolved [Hop] — a kick-start or a parsed [Place].
  static N go<N extends AnyNav>(Hop<N> hop) {
    for (final (s, i) in hop.chain) _Screens.graph.go<Object?>(s, i);
    return hop.nav;
  }

  /// If the live stack ends with this selector path (every pinned id),
  /// its nav — else null.
  static N? on<N extends AnyNav>(On<N> which) {
    if (which is OnParentOf<N>) {
      return which.parents.contains(_Screens.graph.current) ? which.nav : null;
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
    return _atOf(specs.last) as N;
  }

  /// The placement if this selector path is anywhere on the live stack
  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.
  static N? at<N extends AnyNav>(On<N> which) {
    if (which is OnParentOf<N>) return null;
    final st = _Screens.graph.stack;
    final specs = which.specs;
    outer:
    for (var e = st.length - 1; e >= specs.length - 1; e--) {
      final off = e - specs.length + 1;
      for (var i = 0; i < specs.length; i++) {
        if (st[off + i].screen != specs[i]) continue outer;
        final wid = which.ids[i];
        if (wid != null && st[off + i].id != wid) continue outer;
      }
      return _atOf(specs.last) as N;
    }
    return null;
  }

  /// The nav of the screen OWNING [context] (this widget's screen),
  /// typed by [which]. Total: its verbs go from that screen.
  /// Throws a [StateError] when [context] stands at another placement.
  static N ownerOf<N extends AnyNav>(BuildContext context, On<N> which) {
    final entry = ScreenScope.entryOf(context);
    final own = entry.screen;
    if (which is OnParentOf<N>) {
      if (which.parents.contains(own)) return which.at(own);
      throw StateError('ownerOf: ${own.name} is no parent of this push');
    }
    final chain = _Screens.graph.chainOf(entry);
    final specs = which.specs;
    final off = chain.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (off < 0 || chain[off + i] != specs[i]) {
        throw StateError(
          'ownerOf(${specs.map((s) => s.name).join('.')}) at ${chain.map((s) => s.name).join('/')}',
        );
      }
    }
    return _placementOf(own, chain) as N;
  }

  /// THE navigation resolver — assign once (ideally in `main` before
  /// `runApp`). Fires with the cold-start link (or null), then on every
  /// deep link — web URL + mobile app-link, one channel.
  static set resolver(void Function(Url? url) fn) => _Screens.graph.setResolver(
    (url) => fn(parseUrl(url)),
    boot:
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName,
  );

  /// Pops the active top when it sits on a parent; a no-op at a root.
  static void pop() {
    if (_Screens.graph.currentChain.length > 1) _Screens.graph.pop();
  }

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);
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

/// One committed navigation as typed [ScreenEntry] stacks.
final class ScreenNavigation._(final Navigation _n) {
  List<ScreenEntry> get from => [
    for (final e in _n.from)
      if (e.$1 != BootScreen.root) _entryOf(e.$1, e.$2),
  ];
  List<ScreenEntry> get to => [
    for (final e in _n.to)
      if (e.$1 != BootScreen.root) _entryOf(e.$1, e.$2),
  ];
  ScreenEntry get source => _entryOf(_n.source.$1, _n.source.$2);
  ScreenEntry get destination => _entryOf(_n.destination.$1, _n.destination.$2);
  NavDirection get direction => _n.direction;
  bool get isForward => _n.isForward;
  bool get isBackward => _n.isBackward;
  bool get isRoundTrip => _n.isRoundTrip;
  bool get isJump => _n.isJump;
}

/// One typed entry per screen — `switch` it for the screen-specific id.
sealed class const ScreenEntry();
final class const SplashEntry() extends ScreenEntry;
final class const SignInEntry() extends ScreenEntry;
final class const OtpEntry(final String id) extends ScreenEntry;
final class const HomeEntry() extends ScreenEntry;
final class const SearchEntry() extends ScreenEntry;
final class const ScanEntry() extends ScreenEntry;
final class const CategoryEntry(final CategoryId id) extends ScreenEntry;
final class const ProductEntry(final ProductId id) extends ScreenEntry;
final class const SellerEntry(final SellerId id) extends ScreenEntry;
final class const SellerChatEntry(final SellerChatId id) extends ScreenEntry;
final class const WishlistEntry() extends ScreenEntry;
final class const AccountEntry() extends ScreenEntry;
final class const OrdersEntry() extends ScreenEntry;
final class const OrderEntry(final OrderId id) extends ScreenEntry;
final class const SettingsEntry() extends ScreenEntry;
final class const ListingEntry(final ListingId id) extends ScreenEntry;
final class const EditListingEntry(final ListingId id) extends ScreenEntry;
final class const CartEntry() extends ScreenEntry;
final class const CheckoutEntry() extends ScreenEntry;
final class const PaymentEntry() extends ScreenEntry;
final class const ConfirmationEntry(final String id) extends ScreenEntry;
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

final class const Hop<N extends AnyNav>._(
  final Enum spec,
  final Object? id,
  final N nav,
) {
  /// The root-down chain this hop replays. A single kick-start is one
  /// segment; a navigable `Place` (a `Place`) overrides it with its
  /// full path, so `Screen.go` lands the whole placement.
  List<(Enum, Object?)> get chain => [(spec, id)];

  /// The screen this hop lands on — the total projection
  /// (the inverse needs an id, so it stays a Hop ctor).
  Screen<Object?> get screen => Screen._forSpec(spec);
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

final class const Root._() extends AnyPlacement {
  this : super._();
}

final class const On<N extends AnyNav>._(
  final List<Enum> specs,
  final List<Object?> ids,
  final N? nav,
) {
  static On<SplashNav> get splash =>
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
  static On<SettingsNav> get settings =>
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

  /// Disambiguating push onto the current scope when a screen has
  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —
  /// `.parentOf` alone is not an `On`, so the bare form will not compile.
  static _ParentSel get parentOf => const _ParentSel._();
}

final class const OnParentOf<N extends AnyNav>._(
  final Set<_Screens> parents,
  N nav,
  final N Function(Enum) at,
) extends On<N> {
  this : super._(const [], const [], nav);
}

final class const _ParentSel._() {
  OnParentOf<CategoryNavParent> get category => OnParentOf._(
    const {.category, .home},
    const CategoryNavParent._(),
    CategoryNavParent._,
  );
  OnParentOf<ProductNavParent> get product => OnParentOf._(
    const {.category, .order, .scan, .search, .seller, .wishlist},
    const ProductNavParent._(),
    ProductNavParent._,
  );
}

final class const CategoryNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goCategory(CategoryId id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.category, id);
    } else {
      _Screens.graph.go(_Screens.category, id, true);
    }
  }
}

final class const ProductNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goProduct(ProductId id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.product, id);
    } else {
      _Screens.graph.go(_Screens.product, id, true);
    }
  }
}

final class const OnSignIn._(super.specs, super.ids, super.nav)
    extends On<SignInNav> {
  this : super._();
  OnOtp get otp =>
      OnOtp._([...specs, _Screens.otp], [...ids, null], const OtpNav._());
}

final class const OnOtp._(super.specs, super.ids, super.nav)
    extends On<OtpNav> {
  this : super._();
  OnOtp call(String id) =>
      OnOtp._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnHome._(super.specs, super.ids, super.nav)
    extends On<HomeNav> {
  this : super._();
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

final class const OnSearch._(super.specs, super.ids, super.nav)
    extends On<SearchNav> {
  this : super._();
  OnProduct1 get product => OnProduct1._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav1._(),
  );
}

final class const OnProduct1._(super.specs, super.ids, super.nav)
    extends On<ProductNav1> {
  this : super._();
  OnSeller1 get seller => OnSeller1._(
    [...specs, _Screens.seller],
    [...ids, null],
    const SellerNav1._(),
  );
  OnProduct1 call(ProductId id) =>
      OnProduct1._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSeller1._(super.specs, super.ids, super.nav)
    extends On<SellerNav1> {
  this : super._();
  OnSellerChat1 get sellerChat => OnSellerChat1._(
    [...specs, _Screens.sellerChat],
    [...ids, null],
    const SellerChatNav1._(),
  );
  OnSeller1 call(SellerId id) =>
      OnSeller1._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerChat1._(super.specs, super.ids, super.nav)
    extends On<SellerChatNav1> {
  this : super._();
  OnSellerChat1 call(SellerChatId id) =>
      OnSellerChat1._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnCategory._(super.specs, super.ids, super.nav)
    extends On<CategoryNav> {
  this : super._();
  OnProduct2 get product => OnProduct2._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav2._(),
  );
  OnCategory call(CategoryId id) =>
      OnCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProduct2._(super.specs, super.ids, super.nav)
    extends On<ProductNav2> {
  this : super._();
  OnSeller2 get seller => OnSeller2._(
    [...specs, _Screens.seller],
    [...ids, null],
    const SellerNav2._(),
  );
  OnProduct2 call(ProductId id) =>
      OnProduct2._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSeller2._(super.specs, super.ids, super.nav)
    extends On<SellerNav2> {
  this : super._();
  OnSellerChat2 get sellerChat => OnSellerChat2._(
    [...specs, _Screens.sellerChat],
    [...ids, null],
    const SellerChatNav2._(),
  );
  OnSeller2 call(SellerId id) =>
      OnSeller2._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerChat2._(super.specs, super.ids, super.nav)
    extends On<SellerChatNav2> {
  this : super._();
  OnSellerChat2 call(SellerChatId id) =>
      OnSellerChat2._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnScan._(super.specs, super.ids, super.nav)
    extends On<ScanNav> {
  this : super._();
  OnProduct3 get product => OnProduct3._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav3._(),
  );
}

final class const OnProduct3._(super.specs, super.ids, super.nav)
    extends On<ProductNav3> {
  this : super._();
  OnSeller3 get seller => OnSeller3._(
    [...specs, _Screens.seller],
    [...ids, null],
    const SellerNav3._(),
  );
  OnProduct3 call(ProductId id) =>
      OnProduct3._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSeller3._(super.specs, super.ids, super.nav)
    extends On<SellerNav3> {
  this : super._();
  OnSellerChat3 get sellerChat => OnSellerChat3._(
    [...specs, _Screens.sellerChat],
    [...ids, null],
    const SellerChatNav3._(),
  );
  OnSeller3 call(SellerId id) =>
      OnSeller3._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerChat3._(super.specs, super.ids, super.nav)
    extends On<SellerChatNav3> {
  this : super._();
  OnSellerChat3 call(SellerChatId id) =>
      OnSellerChat3._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnWishlist._(super.specs, super.ids, super.nav)
    extends On<WishlistNav> {
  this : super._();
  OnProduct4 get product => OnProduct4._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav4._(),
  );
}

final class const OnProduct4._(super.specs, super.ids, super.nav)
    extends On<ProductNav4> {
  this : super._();
  OnSeller4 get seller => OnSeller4._(
    [...specs, _Screens.seller],
    [...ids, null],
    const SellerNav4._(),
  );
  OnProduct4 call(ProductId id) =>
      OnProduct4._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSeller4._(super.specs, super.ids, super.nav)
    extends On<SellerNav4> {
  this : super._();
  OnSellerChat4 get sellerChat => OnSellerChat4._(
    [...specs, _Screens.sellerChat],
    [...ids, null],
    const SellerChatNav4._(),
  );
  OnSeller4 call(SellerId id) =>
      OnSeller4._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerChat4._(super.specs, super.ids, super.nav)
    extends On<SellerChatNav4> {
  this : super._();
  OnSellerChat4 call(SellerChatId id) =>
      OnSellerChat4._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnCart._(super.specs, super.ids, super.nav)
    extends On<CartNav> {
  this : super._();
  OnCheckout get checkout => OnCheckout._(
    [...specs, _Checkout.checkout],
    [...ids, null],
    const CheckoutNav._(),
  );
}

final class const OnCheckout._(super.specs, super.ids, super.nav)
    extends On<CheckoutNav> {
  this : super._();
  OnPayment get payment => OnPayment._(
    [...specs, _Checkout.payment],
    [...ids, null],
    const PaymentNav._(),
  );
}

final class const OnPayment._(super.specs, super.ids, super.nav)
    extends On<PaymentNav> {
  this : super._();
  OnConfirmation get confirmation => OnConfirmation._(
    [...specs, _Checkout.confirmation],
    [...ids, null],
    const ConfirmationNav._(),
  );
}

final class const OnConfirmation._(super.specs, super.ids, super.nav)
    extends On<ConfirmationNav> {
  this : super._();
  OnConfirmation call(String id) =>
      OnConfirmation._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProduct._(super.specs, super.ids, super.nav)
    extends On<ProductPlacement> {
  this : super._();
  OnSeller get seller =>
      OnSeller._([...specs, _Screens.seller], [...ids, null], null);
  OnProduct call(ProductId id) =>
      OnProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSeller._(super.specs, super.ids, super.nav)
    extends On<SellerPlacement> {
  this : super._();
  OnSellerChat get sellerChat =>
      OnSellerChat._([...specs, _Screens.sellerChat], [...ids, null], null);
  OnSeller call(SellerId id) =>
      OnSeller._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerChat._(super.specs, super.ids, super.nav)
    extends On<SellerChatPlacement> {
  this : super._();
  OnSellerChat call(SellerChatId id) =>
      OnSellerChat._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnAccount._(super.specs, super.ids, super.nav)
    extends On<AccountNav> {
  this : super._();
  OnOrders get orders => OnOrders._(
    [...specs, _Screens.orders],
    [...ids, null],
    const OrdersNav._(),
  );
  On<SettingsNav> get settings => On._(
    [...specs, _Screens.settings],
    [...ids, null],
    const SettingsNav._(),
  );
  OnListing get listing => OnListing._(
    [...specs, _Screens.listing],
    [...ids, null],
    const ListingNav._(),
  );
}

final class const OnOrders._(super.specs, super.ids, super.nav)
    extends On<OrdersNav> {
  this : super._();
  OnOrder get order =>
      OnOrder._([...specs, _Screens.order], [...ids, null], const OrderNav._());
}

final class const OnOrder._(super.specs, super.ids, super.nav)
    extends On<OrderNav> {
  this : super._();
  OnProduct5 get product => OnProduct5._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav5._(),
  );
  OnOrder call(OrderId id) =>
      OnOrder._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProduct5._(super.specs, super.ids, super.nav)
    extends On<ProductNav5> {
  this : super._();
  OnSeller5 get seller => OnSeller5._(
    [...specs, _Screens.seller],
    [...ids, null],
    const SellerNav5._(),
  );
  OnProduct5 call(ProductId id) =>
      OnProduct5._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSeller5._(super.specs, super.ids, super.nav)
    extends On<SellerNav5> {
  this : super._();
  OnSellerChat5 get sellerChat => OnSellerChat5._(
    [...specs, _Screens.sellerChat],
    [...ids, null],
    const SellerChatNav5._(),
  );
  OnSeller5 call(SellerId id) =>
      OnSeller5._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerChat5._(super.specs, super.ids, super.nav)
    extends On<SellerChatNav5> {
  this : super._();
  OnSellerChat5 call(SellerChatId id) =>
      OnSellerChat5._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnListing._(super.specs, super.ids, super.nav)
    extends On<ListingNav> {
  this : super._();
  OnListing call(ListingId id) =>
      OnListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEditListing._(super.specs, super.ids, super.nav)
    extends On<EditListingNav> {
  this : super._();
  OnEditListing call(ListingId id) =>
      OnEditListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class const AnyPlacement._() extends AnyNav {
  this : super._();
}

AnyPlacement _atOf(Enum s) {
  final c = _Screens.graph.currentChain;
  return _placementOf(s, c.sublist(0, c.lastIndexOf(s) + 1));
}

AnyPlacement _placementOf(Enum s, List<Enum> p) => switch (s) {
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

abstract base class const AnyNav._();

final class const SplashNav._() extends AnyPlacement {
  this : super._();
  SplashNav surface() {
    _Screens.graph.popTo(_Screens.splash);
    return const SplashNav._();
  }
}

final class const SignInNav._() extends AnyPlacement {
  this : super._();
  SignInNav surface() {
    _Screens.graph.popTo(_Screens.signIn);
    return const SignInNav._();
  }

  OtpNav goOtp(String id) {
    _Screens.graph.goFrom(_Screens.signIn, _Screens.otp, id);
    return const OtpNav._();
  }
}

final class const OtpNav._() extends AnyPlacement {
  this : super._();
  OtpNav surface() {
    _Screens.graph.popTo(_Screens.otp);
    return const OtpNav._();
  }
}

final class const HomeNav._() extends AnyPlacement {
  this : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  SearchNav goSearch() {
    _Screens.graph.goFrom(_Screens.home, _Screens.search, null);
    return const SearchNav._();
  }

  CategoryNav goCategory(CategoryId id) {
    _Screens.graph.goFrom(_Screens.home, _Screens.category, id);
    return const CategoryNav._();
  }

  ScanNav goScan() {
    _Screens.graph.goFrom(_Screens.home, _Screens.scan, null);
    return const ScanNav._();
  }

  WishlistNav goWishlist() {
    _Screens.graph.goFrom(_Screens.home, _Screens.wishlist, null);
    return const WishlistNav._();
  }

  CartNav goCart() {
    _Screens.graph.goFrom(_Screens.home, _Checkout.cart, null);
    return const CartNav._();
  }
}

final class const SearchNav._() extends AnyPlacement {
  this : super._();
  SearchNav surface() {
    _Screens.graph.popTo(_Screens.search);
    return const SearchNav._();
  }

  SearchQueryMut get query => const SearchQueryMut._();
  ProductNav1 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.search, _Screens.product, id);
    return const ProductNav1._();
  }
}

final class const ScanNav._() extends AnyPlacement {
  this : super._();
  ScanNav surface() {
    _Screens.graph.popTo(_Screens.scan);
    return const ScanNav._();
  }

  ProductNav3 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.scan, _Screens.product, id);
    return const ProductNav3._();
  }
}

final class const CategoryNav._() extends AnyPlacement {
  this : super._();
  CategoryNav surface() {
    _Screens.graph.popTo(_Screens.category);
    return const CategoryNav._();
  }

  CategoryNav goCategory(CategoryId id) {
    _Screens.graph.goFrom(_Screens.category, _Screens.category, id);
    return const CategoryNav._();
  }

  ProductNav2 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.category, _Screens.product, id);
    return const ProductNav2._();
  }
}

ProductPlacement _resolveProductPlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.search, _Screens.product]))
    return const ProductNav1._();
  if (_chainIs(c, const [_Screens.home, _Screens.category, _Screens.product]))
    return const ProductNav2._();
  if (_chainIs(c, const [_Screens.home, _Screens.scan, _Screens.product]))
    return const ProductNav3._();
  if (_chainIs(c, const [_Screens.home, _Screens.wishlist, _Screens.product]))
    return const ProductNav4._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
  ]))
    return const ProductNav5._();
  throw StateError('unresolved product placement: $c');
}

sealed class ProductPlacement implements AnyPlacement {
  SellerPlacement goSeller(SellerId id);
  ProductPlacement surface();
  ProductQueryMut get query;
}

final class const ProductNav1._()
    extends AnyPlacement
    implements ProductPlacement {
  this : super._();
  ProductNav1 surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav1._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  SellerNav1 goSeller(SellerId id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.seller, id);
    return const SellerNav1._();
  }
}

final class const ProductNav2._()
    extends AnyPlacement
    implements ProductPlacement {
  this : super._();
  ProductNav2 surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav2._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  SellerNav2 goSeller(SellerId id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.seller, id);
    return const SellerNav2._();
  }
}

final class const ProductNav3._()
    extends AnyPlacement
    implements ProductPlacement {
  this : super._();
  ProductNav3 surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav3._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  SellerNav3 goSeller(SellerId id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.seller, id);
    return const SellerNav3._();
  }
}

final class const ProductNav4._()
    extends AnyPlacement
    implements ProductPlacement {
  this : super._();
  ProductNav4 surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav4._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  SellerNav4 goSeller(SellerId id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.seller, id);
    return const SellerNav4._();
  }
}

final class const ProductNav5._()
    extends AnyPlacement
    implements ProductPlacement {
  this : super._();
  ProductNav5 surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav5._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductFragmentMut get fragment => const ProductFragmentMut._();
  SellerNav5 goSeller(SellerId id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.seller, id);
    return const SellerNav5._();
  }
}

SellerPlacement _resolveSellerPlacement(List<Enum> c) {
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
  ]))
    return const SellerNav1._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
  ]))
    return const SellerNav2._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
  ]))
    return const SellerNav3._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
  ]))
    return const SellerNav4._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
  ]))
    return const SellerNav5._();
  throw StateError('unresolved seller placement: $c');
}

sealed class SellerPlacement implements AnyPlacement {
  ProductPlacement goProduct(ProductId id);
  SellerChatPlacement goSellerChat(SellerChatId id);
  SellerPlacement surface();
}

final class const SellerNav1._()
    extends AnyPlacement
    implements SellerPlacement {
  this : super._();
  SellerNav1 surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const SellerNav1._();
  }

  ProductNav1 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.product, id);
    return const ProductNav1._();
  }

  SellerChatNav1 goSellerChat(SellerChatId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.sellerChat, id);
    return const SellerChatNav1._();
  }
}

final class const SellerNav2._()
    extends AnyPlacement
    implements SellerPlacement {
  this : super._();
  SellerNav2 surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const SellerNav2._();
  }

  ProductNav2 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.product, id);
    return const ProductNav2._();
  }

  SellerChatNav2 goSellerChat(SellerChatId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.sellerChat, id);
    return const SellerChatNav2._();
  }
}

final class const SellerNav3._()
    extends AnyPlacement
    implements SellerPlacement {
  this : super._();
  SellerNav3 surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const SellerNav3._();
  }

  ProductNav3 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.product, id);
    return const ProductNav3._();
  }

  SellerChatNav3 goSellerChat(SellerChatId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.sellerChat, id);
    return const SellerChatNav3._();
  }
}

final class const SellerNav4._()
    extends AnyPlacement
    implements SellerPlacement {
  this : super._();
  SellerNav4 surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const SellerNav4._();
  }

  ProductNav4 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.product, id);
    return const ProductNav4._();
  }

  SellerChatNav4 goSellerChat(SellerChatId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.sellerChat, id);
    return const SellerChatNav4._();
  }
}

final class const SellerNav5._()
    extends AnyPlacement
    implements SellerPlacement {
  this : super._();
  SellerNav5 surface() {
    _Screens.graph.popTo(_Screens.seller);
    return const SellerNav5._();
  }

  ProductNav5 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.product, id);
    return const ProductNav5._();
  }

  SellerChatNav5 goSellerChat(SellerChatId id) {
    _Screens.graph.goFrom(_Screens.seller, _Screens.sellerChat, id);
    return const SellerChatNav5._();
  }
}

SellerChatPlacement _resolveSellerChatPlacement(List<Enum> c) {
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.search,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const SellerChatNav1._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.category,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const SellerChatNav2._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.scan,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const SellerChatNav3._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.wishlist,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const SellerChatNav4._();
  if (_chainIs(c, const [
    _Screens.account,
    _Screens.orders,
    _Screens.order,
    _Screens.product,
    _Screens.seller,
    _Screens.sellerChat,
  ]))
    return const SellerChatNav5._();
  throw StateError('unresolved sellerChat placement: $c');
}

sealed class SellerChatPlacement implements AnyPlacement {
  SellerChatPlacement surface();
}

final class const SellerChatNav1._()
    extends AnyPlacement
    implements SellerChatPlacement {
  this : super._();
  SellerChatNav1 surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const SellerChatNav1._();
  }
}

final class const SellerChatNav2._()
    extends AnyPlacement
    implements SellerChatPlacement {
  this : super._();
  SellerChatNav2 surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const SellerChatNav2._();
  }
}

final class const SellerChatNav3._()
    extends AnyPlacement
    implements SellerChatPlacement {
  this : super._();
  SellerChatNav3 surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const SellerChatNav3._();
  }
}

final class const SellerChatNav4._()
    extends AnyPlacement
    implements SellerChatPlacement {
  this : super._();
  SellerChatNav4 surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const SellerChatNav4._();
  }
}

final class const SellerChatNav5._()
    extends AnyPlacement
    implements SellerChatPlacement {
  this : super._();
  SellerChatNav5 surface() {
    _Screens.graph.popTo(_Screens.sellerChat);
    return const SellerChatNav5._();
  }
}

final class const WishlistNav._() extends AnyPlacement {
  this : super._();
  WishlistNav surface() {
    _Screens.graph.popTo(_Screens.wishlist);
    return const WishlistNav._();
  }

  ProductNav4 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.wishlist, _Screens.product, id);
    return const ProductNav4._();
  }
}

final class const AccountNav._() extends AnyPlacement {
  this : super._();
  AccountNav surface() {
    _Screens.graph.popTo(_Screens.account);
    return const AccountNav._();
  }

  OrdersNav goOrders() {
    _Screens.graph.goFrom(_Screens.account, _Screens.orders, null);
    return const OrdersNav._();
  }

  SettingsNav goSettings() {
    _Screens.graph.goFrom(_Screens.account, _Screens.settings, null);
    return const SettingsNav._();
  }

  ListingNav goListing(ListingId id) {
    _Screens.graph.goFrom(_Screens.account, _Screens.listing, id);
    return const ListingNav._();
  }
}

final class const OrdersNav._() extends AnyPlacement {
  this : super._();
  OrdersNav surface() {
    _Screens.graph.popTo(_Screens.orders);
    return const OrdersNav._();
  }

  OrderNav goOrder(OrderId id) {
    _Screens.graph.goFrom(_Screens.orders, _Screens.order, id);
    return const OrderNav._();
  }
}

final class const OrderNav._() extends AnyPlacement {
  this : super._();
  OrderNav surface() {
    _Screens.graph.popTo(_Screens.order);
    return const OrderNav._();
  }

  ProductNav5 goProduct(ProductId id) {
    _Screens.graph.goFrom(_Screens.order, _Screens.product, id);
    return const ProductNav5._();
  }
}

final class const SettingsNav._() extends AnyPlacement {
  this : super._();
  SettingsNav surface() {
    _Screens.graph.popTo(_Screens.settings);
    return const SettingsNav._();
  }
}

final class const ListingNav._() extends AnyPlacement {
  this : super._();
  ListingNav surface() {
    _Screens.graph.popTo(_Screens.listing);
    return const ListingNav._();
  }

  EditListingNav goEditListing() {
    _Screens.graph.goFrom(
      _Screens.listing,
      _Screens.editListing,
      _idOf(_Screens.listing),
    );
    return const EditListingNav._();
  }
}

final class const EditListingNav._() extends AnyPlacement {
  this : super._();
  EditListingNav surface() {
    _Screens.graph.popTo(_Screens.editListing);
    return const EditListingNav._();
  }
}

final class const CartNav._() extends AnyPlacement {
  this : super._();
  CartNav surface() {
    _Screens.graph.popTo(_Checkout.cart);
    return const CartNav._();
  }

  CheckoutNav goCheckout() {
    _Screens.graph.goFrom(_Checkout.cart, _Checkout.checkout, null);
    return const CheckoutNav._();
  }
}

final class const CheckoutNav._() extends AnyPlacement {
  this : super._();
  CheckoutNav surface() {
    _Screens.graph.popTo(_Checkout.checkout);
    return const CheckoutNav._();
  }

  PaymentNav goPayment() {
    _Screens.graph.goFrom(_Checkout.checkout, _Checkout.payment, null);
    return const PaymentNav._();
  }
}

final class const PaymentNav._() extends AnyPlacement {
  this : super._();
  PaymentNav surface() {
    _Screens.graph.popTo(_Checkout.payment);
    return const PaymentNav._();
  }

  ConfirmationNav goConfirmation(String id) {
    _Screens.graph.goFrom(_Checkout.payment, _Checkout.confirmation, id);
    return const ConfirmationNav._();
  }
}

final class const ConfirmationNav._() extends AnyPlacement {
  this : super._();
  ConfirmationNav surface() {
    _Screens.graph.popTo(_Checkout.confirmation);
    return const ConfirmationNav._();
  }
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

/// A URL the app understands: a [Place] or a [Link]; `parseUrl`
/// returns one.
sealed class const Url([final String? domain]) {
  Uri toUri([String? domain]);
}

/// A POSITION in the tree — a parsed nav-mirror URL. Go-able: every
/// `Place` is a [Hop], so `Screen.go(place)` replays its chain.
sealed class const Place([super.domain]) extends Url implements Hop<AnyNav> {
  @override
  List<(Enum, Object?)> get chain;
  @override
  Enum get spec => chain.last.$1;
  @override
  Object? get id => chain.last.$2;
  @override
  AnyNav get nav => _atOf(_Screens.graph.current);
  @override
  Screen<Object?> get screen => Screen._forSpec(spec);
}

/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA
/// the resolver interprets. NOT a position — no widget, never navigable.
/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.
sealed class const Link([super.domain]) extends Url {
  static _LXProduct get product => _LXProduct(const <Object?>[], const <int>[]);
}

/// The bare root `/` — a plain app-open (no specific destination).
final class const RootUrl([super.domain]) extends Url {
  @override
  Uri toUri([String? domain]) =>
      Uri.parse('${domain ?? 'https://shop.example'}/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class const _NavPlace(
  @override final List<(Enum, Object?)> chain, [
  super.domain,
]) extends Place {
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

final class const ProductByUuidLink(final String uuid, [super.domain])
    extends Link
    implements ProductLink {
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

final class const ProductByUsernameLink(final String username, [super.domain])
    extends Link
    implements ProductLink {
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
  final uri = tryParseUri(url);
  if (uri == null) return null;
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

class _LXProduct(final List<Object?> _p, final List<int> _b) {
  _LXProductSlot byUuid(String uuid) =>
      _LXProductSlot([..._p, uuid], [..._b, 0]);
  _LXProductSlot byUsername(String username) =>
      _LXProductSlot([..._p, username], [..._b, 1]);
}

class _LXProductSlot(final List<Object?> _p, final List<int> _b) {
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://shop.example',
      'product/*',
      _p,
      _b,
    ),
  );
}

/// Screen-local query view-state for `search` (read-only).
class const SearchQuery._() {
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
final class const SearchQueryMut._() extends SearchQuery {
  this : super._();
  set q(String? v) => _Screens.graph.viewSet(_Screens.search, 'q', v);
  set sort(Sort? v) => _Screens.graph.viewSet(_Screens.search, 'sort', v);
  set group(({int minPrice, int maxPrice})? v) {
    _Screens.graph.viewSet(_Screens.search, 'minPrice', v?.minPrice);
    _Screens.graph.viewSet(_Screens.search, 'maxPrice', v?.maxPrice);
  }
}

/// Screen-local query view-state for `product` (read-only).
class const ProductQuery._() {
  String? get variant =>
      _Screens.graph.viewGet(_Screens.product, 'variant') as String?;
}

/// Mutable [ProductQuery] — set a key (null clears / removes from URL).
final class const ProductQueryMut._() extends ProductQuery {
  this : super._();
  set variant(String? v) =>
      _Screens.graph.viewSet(_Screens.product, 'variant', v);
}

/// Screen-local fragment view-state for `product` (read-only).
class const ProductFragment._() {
  String? get tab => _Screens.graph.viewGet(_Screens.product, 'tab') as String?;
}

/// Mutable [ProductFragment] — set a key (null clears / removes from URL).
final class const ProductFragmentMut._() extends ProductFragment {
  this : super._();
  set tab(String? v) => _Screens.graph.viewSet(_Screens.product, 'tab', v);
}

// ignore_for_file: unused_element
/// The app-wide ledger, built from the `app` regency —
/// the runtime splices its rows in order and wires its merge
/// edges. `Screen.manager` binds the nav side. Reads hang on the
/// row CLASSES (`extension <Row>Reads`) — name your rows with const
/// globals (`const todos = Todos();`) and read `todos.idsOf(context)`.
final ledger = Ledger.root(app);

/// States a fact — dispatch is the ONLY verb, so it needs no prefix.
/// (`ledger.` keeps the rarer surfaces: `on`, `veto`, `guard`, `journal`.)
void dispatch(Msg msg) => ledger.dispatch(msg);
bool _bound = false;

/// The `product` screen was navigated to (never a render).
class const ProductEnteredMsg(final ProductId id)
    extends Msg
    with Identifiable<ProductId>
    implements ProductAskMsg;

/// The `sellerChat` screen was navigated to (never a render).
class const SellerChatEnteredMsg(final SellerChatId id)
    extends Msg
    with Identifiable<SellerChatId>;

/// Reads for a `CatalogCovered` row — sugar over `ledger.at(this)`.
extension CatalogCoveredReads on CatalogCovered {
  UnitMemory<bool, ProductMsg> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  bool get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<bool, ProductMsg>> get events => mem.events;

  /// The value, reactively — rebuilds on every change.
  bool of(BuildContext context) => mem.of(context);
}

/// Reads for a `ReviewsInFlight` row — sugar over `ledger.at(this)`.
extension ReviewsInFlightReads on ReviewsInFlight {
  UnitMemory<Set<ProductId>, ReviewsInFlightMsg> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  Set<ProductId> get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<Set<ProductId>, ReviewsInFlightMsg>> get events =>
      mem.events;

  /// The value, reactively — rebuilds on every change.
  Set<ProductId> of(BuildContext context) => mem.of(context);

  /// Membership of the ambient id — the in-flight idiom.
  bool containsIdOf(BuildContext context) => mem.containsIdOf(context);
}

/// Reads for a `LocalProducts` row — sugar over `ledger.at(this)`.
extension LocalProductsReads on LocalProducts {
  StoreMemory<ProductId, Product, ProductMsg> get mem => ledger.at(this);

  /// The keyed collection, merge-resolved.
  IdentifiableMap<ProductId, Product> get entities => mem.entities;
  Iterable<Product> get values => mem.values;
  List<ProductId> get ids => mem.ids;
  Product? operator [](ProductId key) => mem[key];

  Stream<ProductId> get changes => mem.changes;
  Stream<void> get structure => mem.structure;
  Stream<StoreEvent<ProductId, Product, ProductMsg>> get events => mem.events;

  /// The key SEQUENCE, reactively — structural rebuilds only;
  /// value changes never fire, so scope rows with [item].
  List<ProductId> idsOf(BuildContext context) => mem.idsOf(context);

  /// The ROWS, reactively — rebuilds on shape AND on ANY
  /// row's value change.
  List<Product> entitiesOf(BuildContext context) => mem.entitiesOf(context);

  /// One entity, reactively — id omitted reads the AMBIENT identity.
  Product? entityOf(BuildContext context, [ProductId? id]) =>
      mem.entityOf(context, id);

  /// Plants the item scope over [child] — the list-tile spelling.
  Widget item(ProductId id, {required Widget child}) =>
      mem.item(id, child: child);

  /// The enclosing item scope's id, when planted from THIS row.
  ProductId? idOf(BuildContext context) => mem.idOf(context);

  /// The entry on screen `product`, at its live nav id.
  Product? onProduct() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.product) return mem[e.id as ProductId];
    }
    return null;
  }
}

/// Reads for a `Products` row — sugar over `ledger.at(this)`.
extension ProductsReads on Products {
  StoreMemory<ProductId, Product, ProductMsg> get mem => ledger.at(this);

  /// The keyed collection, merge-resolved.
  IdentifiableMap<ProductId, Product> get entities => mem.entities;
  Iterable<Product> get values => mem.values;
  List<ProductId> get ids => mem.ids;
  Product? operator [](ProductId key) => mem[key];

  Stream<ProductId> get changes => mem.changes;
  Stream<void> get structure => mem.structure;
  Stream<StoreEvent<ProductId, Product, ProductMsg>> get events => mem.events;

  /// The key SEQUENCE, reactively — structural rebuilds only;
  /// value changes never fire, so scope rows with [item].
  List<ProductId> idsOf(BuildContext context) => mem.idsOf(context);

  /// The ROWS, reactively — rebuilds on shape AND on ANY
  /// row's value change.
  List<Product> entitiesOf(BuildContext context) => mem.entitiesOf(context);

  /// One entity, reactively — id omitted reads the AMBIENT identity.
  Product? entityOf(BuildContext context, [ProductId? id]) =>
      mem.entityOf(context, id);

  /// Plants the item scope over [child] — the list-tile spelling.
  Widget item(ProductId id, {required Widget child}) =>
      mem.item(id, child: child);

  /// The enclosing item scope's id, when planted from THIS row.
  ProductId? idOf(BuildContext context) => mem.idOf(context);

  /// The entry on screen `product`, at its live nav id.
  Product? onProduct() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.product) return mem[e.id as ProductId];
    }
    return null;
  }
}

/// Reads for a `SellerThreads` row — sugar over `ledger.at(this)`.
extension SellerThreadsReads on SellerThreads {
  StoreMemory<SellerChatId, SellerThread, SellerChatMsg> get mem =>
      ledger.at(this);

  /// The keyed collection, merge-resolved.
  IdentifiableMap<SellerChatId, SellerThread> get entities => mem.entities;
  Iterable<SellerThread> get values => mem.values;
  List<SellerChatId> get ids => mem.ids;
  SellerThread? operator [](SellerChatId key) => mem[key];

  Stream<SellerChatId> get changes => mem.changes;
  Stream<void> get structure => mem.structure;
  Stream<StoreEvent<SellerChatId, SellerThread, SellerChatMsg>> get events =>
      mem.events;

  /// The key SEQUENCE, reactively — structural rebuilds only;
  /// value changes never fire, so scope rows with [item].
  List<SellerChatId> idsOf(BuildContext context) => mem.idsOf(context);

  /// The ROWS, reactively — rebuilds on shape AND on ANY
  /// row's value change.
  List<SellerThread> entitiesOf(BuildContext context) =>
      mem.entitiesOf(context);

  /// One entity, reactively — id omitted reads the AMBIENT identity.
  SellerThread? entityOf(BuildContext context, [SellerChatId? id]) =>
      mem.entityOf(context, id);

  /// Plants the item scope over [child] — the list-tile spelling.
  Widget item(SellerChatId id, {required Widget child}) =>
      mem.item(id, child: child);

  /// The enclosing item scope's id, when planted from THIS row.
  SellerChatId? idOf(BuildContext context) => mem.idOf(context);

  /// The entry on screen `sellerChat`, at its live nav id.
  SellerThread? onSellerChat() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.sellerChat) return mem[e.id as SellerChatId];
    }
    return null;
  }
}

/// Reads for a `Shopper` row — sugar over `ledger.at(this)`.
extension ShopperReads on Shopper {
  UnitMemory<ShopperState?, ShopperMsg> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  ShopperState? get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<ShopperState?, ShopperMsg>> get events => mem.events;

  /// The identity the state carries, now.
  ShopperId? get id => state?.id;

  /// The value, reactively — rebuilds on every change.
  ShopperState? of(BuildContext context) => mem.of(context);

  /// The identity, reactively — rebuilds only
  /// when the id changes, never on field churn.
  ShopperId? idOf(BuildContext context) => mem.idOf(context);
}

/// Reads for a `CartWriteUnit` row — sugar over `ledger.at(this)`.
extension CartWriteUnitReads on CartWriteUnit {
  UnitMemory<CartWrite, CartMsg> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  CartWrite get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<CartWrite, CartMsg>> get events => mem.events;

  /// The value, reactively — rebuilds on every change.
  CartWrite of(BuildContext context) => mem.of(context);
}

/// Reads for a `Cart` row — sugar over `ledger.at(this)`.
extension CartReads on Cart {
  UnitMemory<CartState, CartMsg> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  CartState get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<CartState, CartMsg>> get events => mem.events;

  /// The value, reactively — rebuilds on every change.
  CartState of(BuildContext context) => mem.of(context);
}

/// Reads for a `NavUnit` row — sugar over `ledger.at(this)`.
extension NavUnitReads on NavUnit {
  UnitMemory<NavState?, NavOp> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  NavState? get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<NavState?, NavOp>> get events => mem.events;

  /// The value, reactively — rebuilds on every change.
  NavState? of(BuildContext context) => mem.of(context);
}

/// The nav-side wiring. Idempotent — `Screen.manager` calls it.
extension AppLedger on Ledger {
  void bind() {
    if (_bound) return;
    _bound = true;
    IdScope.tag(ledger.at(localProducts), Ids.product);
    IdScope.tag(ledger.at(products), Ids.product);
    IdScope.tag(ledger.at(sellerThreads), Ids.sellerChat);
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
      final s = ledger.at(const NavUnit()).state;
      if (s != null) _Screens.graph.applyState(s);
    });
    ledger.at(const NavUnit()).events.listen((e) {
      final s = e.after;
      if (s != null) _Screens.graph.applyState(s);
    });
    dispatch(SeedOp(_Screens.graph.navState));
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
}

/// Deictic forward verbs for the `product` identity —
/// obtain via `ProductID.navOf(context)`; the id is ambient.
extension ProductIdNav on IdNav<ProductId> {
  void go() {
    _Screens.graph.goFrom(screen, _Screens.product, id);
  }

  void goSellerChat() {
    final e = _Screens.graph.stack.lastWhere(
      (e) => const {_Screens.seller, _Screens.sellerChat}.contains(e.screen),
    );
    final other = const {_Screens.sellerChat}.contains(e.screen)
        ? (e.id as SellerChatId).seller
        : e.id as SellerId;
    _Screens.graph.goFrom(
      screen,
      _Screens.sellerChat,
      SellerChatId.of(id, other),
    );
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
    _Screens.graph.goFrom(screen, _Screens.sellerChat, id);
  }

  void goProduct() {
    _Screens.graph.goFrom(screen, _Screens.product, id.product);
  }

  void goSeller() {
    _Screens.graph.goFrom(screen, _Screens.seller, id.seller);
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
    _Screens.graph.goFrom(
      screen,
      _Screens.sellerChat,
      SellerChatId.of(other, id),
    );
  }
}
