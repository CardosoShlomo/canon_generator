import 'dart:async';

import 'package:flutter/material.dart';
import 'package:canon_flutter/canon_flutter.dart'; // the facade — nav, state (ledger), and identity

part 'showcase.canon.dart';

// ── The SHOWCASE example ──────────────────────────────────────────────────
// A compact e-commerce app whose grammar trees exercise EVERY canon
// capability. Nav side: keep/forget, inherit, stacked/cycled, graft,
// query/fragment, links. State side, the numbered TOUR:
//
//   1. facts as sealed families (a msg IS a source: its TYPE is its rank)
//   2. stores & units: pure folds, nothing else lives in a memory
//   3. the @regents enum: row order is traversal order; gates protect below
//   4. gates judging via `read(const X())` — the ledger's own state by identity
//   5. COVERAGE: recorded permission to treat absence as knowledge
//   6. a shadow store + merge edge: disk cache answers until censored
//   7. an IN-FLIGHT row + dedupe gate: duplicate asks drop at the queue
//   8. OWNED children: reviews live inside their product (@entities)
//   9. a WRITE DOCK: optimism as rows — pending unit, settling gate,
//      deadline as a dispatched FACT (timers live in effects)
//  10. unit-from-unit merge: the pending promise answers reads instantly
//  11. scope entry as a FACT: committed navigation dispatches
//      `ProductEnteredMsg`; ask policy is an ordinary gate judging it
//  12. ledger-owned NAVIGATION: `nav(NavUnit())` — the stack is a citizen,
//      so replay carries the session whole
//  13. replay: order-(in)dependence as an executable LAW
//      (test/showcase_laws_test.dart)
//
// Most screens are a color + a row of nav buttons; `product` is a REAL
// consuming screen, so this doubles as the runnable app you test on.
//
// What only the running app shows (it's all runtime): every `Screen.goX`
// round-trips to a clean URL and back; browser back/forward and refresh restore
// the exact stack (refresh keeps state, a cold link rebuilds it); and
// `ledger.command(...)` applies an optimistic write instantly, then confirms or
// rolls back on the server's reply. Run `showcase_app.dart` on web to watch it.

// Search view-state: `?q=&sort=&minPrice=&maxPrice=`.
enum _Filter with QueryKeyBase { q, sort, minPrice, maxPrice }

// Product view-state: a `?variant=` query and a `#tab=` fragment.
enum _PV with QueryKeyBase { variant }
enum _Tab with QueryKeyBase { tab }

enum Sort { relevance, priceLow, priceHigh, newest }

// ── The IDENTITY space (@ids) ─────────────────────────────────────────────
// Hand-written: the enum IS the id-holder. Each row carries its codec (how the
// key serialises in a URL) and, because `IdNode implements Codec`, each node can
// be bound directly as a screen `id` AND as a registry key — the SAME node
// across the screens and registries trees, which is what lets data inject by nav.
@IDs()
enum Ids with IdNode {
  product(.uuid),
  review(.uuid),
  seller(.username),
  category(.string),
  order(.uuid),
  listing(.uuid);

  const Ids(this.codec);
  @override
  final Codec codec;
}

// ── The STORES (consumer-defined; pure `reduce` on the `ledger` engine) ───
// A review — an OWNED child: it lives inside its product as an id-keyed map
// field (never in a store of its own; the aggregate is the consistency unit).
class Review with Identifiable<ReviewId> {
  Review(this.id, this.author, this.text);
  @override
  final ReviewId id;
  final String author;
  final String text;

  @override
  bool operator ==(Object o) =>
      o is Review && o.id == id && o.author == author && o.text == text;
  @override
  int get hashCode => Object.hash(id, author, text);
}

class Product with Identifiable<ProductId> {
  Product(this.id, this.name, this.price,
      {this.reviews = const {}, this.hasMoreReviews = false});
  @override
  final ProductId id;
  final String name;
  final int price;
  final IdentifiableMap<ReviewId, Review> reviews;
  final bool hasMoreReviews;

  Product copyWith(
          {IdentifiableMap<ReviewId, Review>? reviews, bool? hasMoreReviews}) =>
      Product(id, name, price,
          reviews: reviews ?? this.reviews,
          hasMoreReviews: hasMoreReviews ?? this.hasMoreReviews);

  @override
  bool operator ==(Object o) =>
      o is Product &&
      o.id == id &&
      o.name == name &&
      o.price == price &&
      o.hasMoreReviews == hasMoreReviews &&
      o.reviews.length == reviews.length &&
      reviews.entries.every((e) => o.reviews[e.key] == e.value);
  @override
  int get hashCode => Object.hash(id, name, price, hasMoreReviews);
}

sealed class ProductMsg extends Msg with Identifiable<ProductId> {
  ProductMsg(this.id);
  @override
  final ProductId id;
}

class ProductLoaded extends ProductMsg {
  ProductLoaded(super.id, this.name, this.price);
  final String name;
  final int price;
}

// The DISK CACHE speaking at boot. It folds into the SHADOW store (which
// supports the main store's reads through a merge edge) and is vetoed by
// the gate row once the live catalog has covered this session — the full
// shadow/coverage/gate pattern in three citizens.
class CatalogCacheMsg extends ProductMsg {
  CatalogCacheMsg(super.id, this.name, this.price);
  final String name;
  final int price;
}

// A page of OLDER reviews for one product — appends; the id-keyed map dedupes
// page overlaps by construction.
class ReviewsPage extends ProductMsg {
  ReviewsPage(super.id, this.reviews, {required this.hasMore});
  final List<Review> reviews;
  final bool hasMore;
}

// The REQUEST is NOT part of the reduce family — it has no state effect, so
// the reduce never carries a dead arm for it. The in-flight row below
// tracks it instead.
class GetReviews extends Msg {
  GetReviews(this.productId, {this.before});
  final ProductId productId;
  final ReviewId? before;
}

// 7. Request status as an HONEST ROW: dispatching `GetReviews` folds the
// key in, the page arriving folds it out. Presence = loading; no machinery,
// no `loading` field in Product.
final class ReviewsInFlight extends Unit<Set<ProductId>, Msg> {
  const ReviewsInFlight() : super(const {});

  @override
  Set<ProductId> reduce(Set<ProductId> state, Msg msg) => switch (msg) {
        GetReviews(:final productId) => {...state, productId},
        ReviewsPage(:final id) =>
          {for (final k in state) if (k != id) k},
        _ => state,
      };
}

/// 7. The DEDUPE gate: a duplicate ask is queue noise — dropped before it
/// can reach the wire (`ledger.on` taps the END of the queue, so the wire
/// effect never fires on a dropped ask).
final class DedupeGetReviews extends Veto<GetReviews> {
  const DedupeGetReviews();

  @override
  bool block(Envelope env, GetReviews msg, ReadStore read) =>
      read(const ReviewsInFlight()).contains(msg.productId);
}

/// 11. Scope entry is a FACT: a COMMITTED navigation to `product` dispatches
/// the generated [ProductEnteredMsg] (never a render). Ask policy is this
/// ordinary gate judging it: an unknown product with no ask in flight fans
/// out the request — the imperative fetch-on-entry, gone.
final class ProductEntryGate extends Guard<ProductEnteredMsg> {
  const ProductEntryGate();

  @override
  Set<Msg> judge(Envelope env, ProductEnteredMsg msg, ReadStore read) =>
      !read(const Products()).containsKey(msg.id) &&
              !read(const ReviewsInFlight()).contains(msg.id)
          ? {msg, GetReviews(msg.id)}
          : {msg};
}

final class Products extends Store<ProductId, Product, ProductMsg> {
  const Products();

  @override
  IdentifiableMap<ProductId, Product> reduce(
          IdentifiableMap<ProductId, Product> entities, ProductMsg msg) =>
      switch (msg) {
        ProductLoaded(:final id, :final name, :final price) =>
          entities.containsKey(id)
              ? entities
              : entities.upsert(Product(id, name, price)),
        CatalogCacheMsg() => entities, // the SHADOW folds it, not main
        ReviewsPage(:final id, :final reviews, :final hasMore) =>
          entities.updateById(
              id,
              (p) => p.copyWith(
                    reviews: {...p.reviews, for (final r in reviews) r.id: r},
                    hasMoreReviews: hasMore,
                  )),
      };
}

// ── The cart: a UNIT store + its WRITE DOCK ───────────────────────────
// The wire test: cart facts arrive KEYLESS (the session is the identity), so
// the cart is a `Unit` — one value, no key. Its optimism (9/10) lives in the
// dock rows BESIDE it, never inside it.
class CartState {
  const CartState({this.items = const [], this.qty = const {}});
  final List<String> items; // product names, kept trivial for the demo
  final Map<ProductId, int> qty; // per-product quantity — the dock's subject

  int get count => items.length;

  CartState withQty(ProductId id, int n) =>
      CartState(items: items, qty: {...qty, id: n});

  // Value equality — the write gate settles by STATE COMPARISON.
  @override
  bool operator ==(Object o) =>
      o is CartState &&
      o.items.length == items.length &&
      [for (var i = 0; i < items.length; i++) i]
          .every((i) => o.items[i] == items[i]) &&
      o.qty.length == qty.length &&
      qty.entries.every((e) => o.qty[e.key] == e.value);
  @override
  int get hashCode => Object.hash(Object.hashAll(items), qty.length);
}

sealed class CartMsg extends Msg {
  const CartMsg();
}

class CartItemAdded extends CartMsg {
  CartItemAdded(this.name);
  final String name;
}

/// 9. The optimistic PREDICTION — an ABSOLUTE fact: it states the TARGET
/// quantity, never an operation ("increment"), so the echo below re-applies
/// as a no-op and the gate can settle by comparison.
class SetQty extends CartMsg {
  const SetQty(this.productId, this.qty);
  final ProductId productId;
  final int qty;
}

/// The server's echo of the quantity write.
class QtySaved extends CartMsg {
  const QtySaved(this.productId, this.qty);
  final ProductId productId;
  final int qty;
}

/// The pending write's DEADLINE — dispatched by an effect's timer (the
/// ledger never holds a Timer); the gate judges it like any other fact.
class QtyTimedOut extends CartMsg {
  const QtyTimedOut();
}

/// The pending-write CAPTURE, minted by the write gate (never dispatch by
/// hand): the prediction and the confirmed world it promised over.
class CartPredictedMsg extends CartMsg {
  const CartPredictedMsg(this.prediction, this.base);
  final SetQty prediction;
  final CartState base;
}

enum WriteOutcome { confirmed, reverted, amended, tampered }

/// The write gate's settlement RULING on the pending cart write.
class CartSettledMsg extends CartMsg {
  const CartSettledMsg(this.outcome);
  final WriteOutcome outcome;
}

final class CartUnit extends Unit<CartState, CartMsg> {
  const CartUnit() : super(const CartState());

  @override
  CartState reduce(CartState state, CartMsg msg) => switch (msg) {
        CartItemAdded(:final name) =>
          CartState(items: [...state.items, name], qty: state.qty),
        // The echo is confirmed truth; the PREDICTION has no arm — base
        // never folds a promise, so confirmed state never lies.
        QtySaved(:final productId, :final qty) => state.withQty(productId, qty),
        _ => state,
      };
}

/// A prediction's diff — read-time only. ONE function serves both the
/// gate's settle check and the merge projection, so the promise the UI sees
/// and the promise the judge rules on can never drift apart.
CartState applyQty(CartState state, SetQty p) =>
    state.withQty(p.productId, p.qty);

/// 9. The dock's pending row: the promise riding over base, the world it
/// promised over, and the settled-optimism flags — honest state, so it
/// replays.
class CartWrite {
  const CartWrite({
    this.pending,
    this.base,
    this.reverted = false,
    this.amended = false,
    this.tampered = false,
  });

  final SetQty? pending;
  final CartState? base;
  final bool reverted;
  final bool amended;
  final bool tampered;

  @override
  bool operator ==(Object o) =>
      o is CartWrite &&
      o.pending == pending &&
      o.base == base &&
      o.reverted == reverted &&
      o.amended == amended &&
      o.tampered == tampered;
  @override
  int get hashCode => Object.hash(pending, base, reverted, amended, tampered);
}

/// One pending slot — a newer prediction supersedes. Any family fact speaks
/// over the settled flags.
final class CartWriteUnit extends Unit<CartWrite, CartMsg> {
  const CartWriteUnit() : super(const CartWrite());

  @override
  CartWrite reduce(CartWrite state, CartMsg msg) => switch (msg) {
        CartPredictedMsg(:final prediction, :final base) =>
          CartWrite(pending: prediction, base: base),
        CartSettledMsg(outcome: .tampered) => CartWrite(
            pending: state.pending, base: state.base, tampered: true),
        CartSettledMsg(:final outcome) => CartWrite(
            reverted: outcome == .reverted, amended: outcome == .amended),
        _ => state.reverted || state.amended
            ? CartWrite(pending: state.pending, base: state.base)
            : state,
      };
}

/// 9. The WRITE GATE — stands directly above its dock rows at the BOTTOM of
/// the enum, below every other reader: the prediction reaches them all, then
/// the gate mints the capture (base has no arm for the promise) and settles
/// it against echoes and the deadline fact by the three-way state check.
final class CartWriteGate extends Guard<CartMsg> {
  const CartWriteGate();

  @override
  Set<Msg> judge(Envelope env, CartMsg msg, ReadStore read) {
    switch (msg) {
      case final SetQty p:
        // The prediction PASSES — the wire effect still sends it; base
        // ignores it. The capture is the dock's copy.
        return {msg, CartPredictedMsg(p, read(const CartUnit()))};
      case final QtySaved echo:
        final write = read(const CartWriteUnit());
        final p = write.pending;
        if (p == null) return {msg};
        final a = read(const CartUnit());
        final b = const CartUnit().reduce(a, echo);
        final outcome = applyQty(b, p) == b
            ? WriteOutcome.confirmed
            : b == a
                ? WriteOutcome.reverted
                : WriteOutcome.tampered;
        return {msg, CartSettledMsg(outcome)};
      case QtyTimedOut():
        final write = read(const CartWriteUnit());
        final p = write.pending;
        if (p == null) return const {};
        final a = read(const CartUnit());
        final outcome = applyQty(a, p) == a
            ? WriteOutcome.confirmed
            : a == write.base
                ? WriteOutcome.reverted
                : WriteOutcome.amended;
        return {CartSettledMsg(outcome)};
      default:
        return {msg};
    }
  }
}

/// 10. The dock's merge edge — unit-from-unit: reads show the promise until
/// it settles; base is never copied, never touched.
final class WriteSupportsCart extends UnitProjection<CartWrite, CartState> {
  const WriteSupportsCart();

  @override
  CartState resolve(CartState value, CartWrite write) =>
      write.pending == null ? value : applyQty(value, write.pending!);
}

// ── The ENTITY grammar (@entities) ────────────────────────────────────
// Each row binds an entity TYPE to its id-node; the graph declares OWNERSHIP
// (roots are the aggregate boundaries stores may attach to). Key node, key
// type, and screen associations all derive from here.
@entities
enum _Entities with EntityNode<_Entities> {
  // A KEYLESS row is a UNIT — cardinality one, the session is its identity
  // (the wire test: its facts arrive without an id).
  cart(CartState),
  cartWrite(CartWrite),
  coverage(bool),
  inFlight(Set<ProductId>),
  product(Product, .product),
  review(Review, .review);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  // Generator-read (ownership derivation); runtime consumers arrive with the
  // tree-store surface.
  // ignore: unused_field
  static final graph = EntityGraph({
    cart,
    cartWrite,
    coverage,
    inFlight,
    // OWNERSHIP: reviews live inside their product (an id-keyed map field) —
    // the generator derives surgical tree ops (`addReview`, `updateReview`…).
    product({review}),
  });
}

// ── The CITIZENS grammar (@regents) ───────────────────────────────────
// A row declares the two things nothing derives: that this citizen exists,
// and its spec. ROW ORDER IS TRAVERSAL ORDER — the guard row protects the
// rows below it (readers fold what passes; judges decide what passes). The
// generator hangs typed reads on `ledger`; because the `product` screen
// binds the SAME node (via the entity), those reads inject by nav location
// (`productsOnProduct()`).
@regents
enum _Regents with RegentNode<_Regents> {
  // coverage first — the gate reads it
  catalogCovered(CatalogCovered()),
  // the gates: once the live catalog has covered, cache facts drop here;
  // the entry gate fans out asks; the dedupe veto drops duplicate asks —
  // every row below sees only admitted messages (placement IS protection)
  catalogGate(CatalogGate()),
  productEntryGate(ProductEntryGate()),
  dedupeGetReviews(DedupeGetReviews()),
  // the in-flight row — the dedupe gate reads it
  reviewsInFlight(ReviewsInFlight()),
  // the disk-cache SHADOW — absent-only folds, supports main via the merge
  localProducts(LocalProducts()),
  products(Products()),
  // the write dock — below every other reader: the prediction reaches them
  // all, then the gate mints the capture; base never folds the promise
  cartWriteGate(CartWriteGate()),
  cartWrite(CartWriteUnit()),
  cart(CartUnit()),
  // 12. the stack — the session's LAST reader: it folds only navigation
  // that survived every judge above; replay carries the session whole
  nav(NavUnit());

  const _Regents(this.regent);
  @override
  final Regent regent;

  // Merge edges — read-time projections, state is never copied: the dock's
  // promise answers the cart's reads (unit-from-unit), the shadow answers
  // the catalog's gaps (store-from-store).
  static final merges = {
    cart.from(cartWrite, const WriteSupportsCart()),
    products.from(localProducts, const LocalProductSupports()),
  };
}

/// Has the LIVE catalog covered this session? (Any live product load counts.)
final class CatalogCovered extends Unit<bool, ProductMsg> {
  const CatalogCovered() : super(false);

  @override
  bool reduce(bool state, ProductMsg msg) =>
      switch (msg) { ProductLoaded() => true, _ => state };
}

/// A VETO row: judges [CatalogCacheMsg] against the coverage unit through
/// `read` — the ledger's own state by citizen identity — pure, replayable,
/// positional.
final class CatalogGate extends Veto<CatalogCacheMsg> {
  const CatalogGate();

  @override
  bool block(Envelope env, CatalogCacheMsg msg, ReadStore read) =>
      read(const CatalogCovered());
}

/// The disk-cache SHADOW: cache facts fold here absent-only; live-family
/// facts delegate to the main spec so the shadow tracks the same truth.
final class LocalProducts extends Store<ProductId, Product, ProductMsg> {
  const LocalProducts();

  @override
  IdentifiableMap<ProductId, Product> reduce(
          IdentifiableMap<ProductId, Product> entities, ProductMsg msg) =>
      switch (msg) {
        CatalogCacheMsg(:final id, :final name, :final price) =>
          entities.containsKey(id)
              ? entities
              : entities.upsert(Product(id, name, price)),
        _ => const Products().reduce(entities, msg),
      };
}

/// Row-or-local: the main store's row wins; the shadow answers the gaps.
final class LocalProductSupports
    extends Projection<Product, ProductId, Product> {
  const LocalProductSupports();

  @override
  Product resolve(Product? row, Product local) => row ?? local;
}

// The app's data SOURCE — faked for this runnable demo (the engine ships none;
// the app owns transport). It answers entry facts and asks by dispatching
// SOURCE messages (members of the sealed reduce families), which the stores
// reduce in. A real app pipes a socket through the same dispatch — and
// because the wire is just another subscriber, `ledger.dispatch` is the app's
// only verb: the same call states a fact, sends a request, and (via the
// in-flight row) marks its key in flight.
void demoBackend() {
  // The entry FACT is the wire's cue too: the same admitted feed the entry
  // gate shaped — no nav plumbing, no stack walking.
  ledger.on<ProductEnteredMsg>().listen((e) {
    dispatch(ProductLoaded(e.id, 'Product ${e.id}', 1999));
  });
  // The dock's wire half: the echo after a beat; the DEADLINE is a timer
  // HERE in effects — the ledger judges the fact, it never holds a Timer.
  // (A settled dock drops the late timeout at the gate.)
  ledger.on<SetQty>().listen((p) async {
    Timer(const Duration(seconds: 3), () => dispatch(const QtyTimedOut()));
    await Future<void>.delayed(const Duration(milliseconds: 400));
    dispatch(QtySaved(p.productId, p.qty));
  });
  // The "server" answers a reviews request after a beat — long enough to watch
  // the derived `loading` status flip on and off.
  ledger.on<GetReviews>().listen((req) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final page = req.before == null ? 0 : 1;
    dispatch(ReviewsPage(
      req.productId,
      [
        for (var i = 0; i < 3; i++)
          Review(ReviewId('${req.productId}-r$page$i'), 'buyer$page$i',
              'Review ${page * 3 + i + 1} — solid product.'),
      ],
      hasMore: page == 0,
    ));
  });
}

// A grafted subsystem: the whole checkout flow lives in its own enum and is
// spliced into the main tree with `graft` — the generated surface is blind to
// the split (`Screen.goCart()` etc. are emitted as if native).
enum _Checkout with SubScreenNode<_Checkout> {
  cart(_S('Cart', Color(0xFF8E24AA))),
  checkout(_S('Checkout', Color(0xFF5E35B1))),
  payment(_S('Payment', Color(0xFF3949AB))),
  confirmation(_S('Confirmation', Color(0xFF1E88E5)), .uuid);

  const _Checkout(this.widget, [this.id]);
  @override
  final Widget? widget;
  final Codec? id;

  static final subtree = cart({
    checkout({payment({confirmation})})
  });
}

@Screens(domain: 'https://shop.example')
enum _Screens with ScreenNode<_Screens> {
  splash(_S('Splash', Color(0xFF263238))),
  signIn(_S('Sign in', Color(0xFF37474F))),
  otp(_S('OTP', Color(0xFF455A64)), .string),

  home(_S('Home', Color(0xFF00897B))),
  search(_S('Search', Color(0xFF00ACC1), body: [_ProductsStrip()])),
  scan(_S('Scan', Color(0xFF039BE5))),
  category(_S('Category', Color(0xFF43A047)), Ids.category),
  product(_Product(), Ids.product),
  seller(_S('Seller', Color(0xFFD81B60)), Ids.seller),

  wishlist(_S('Wishlist', Color(0xFFF4511E))),
  account(_S('Account', Color(0xFF6D4C41))),
  orders(_S('Orders', Color(0xFF757575))),
  order(_S('Order', Color(0xFF546E7A)), Ids.order),
  settings(_S('Settings', Color(0xFF7CB342))),
  listing(_S('My listing', Color(0xFFFB8C00)), Ids.listing),
  editListing(_S('Edit listing', Color(0xFFFFB300)), Ids.listing);

  const _Screens(this.widget, [this.id]);
  @override
  final Widget widget;
  @override
  final Codec? id;

  // `product` lives under several parents (search, category, wishlist, order,
  // scan) — multi-parent, so it has no global `goProduct`; reach it via
  // `parentOf` or a chain. It cycles back through its seller (collapsed by
  // `.cycled`) and carries `?variant=` + `#tab=` view-state.
  static _Screens _product() => product({
        seller({product.cycled}),
      }).query({_PV.variant(.string)}).fragment({_Tab.tab(.string)});

  static final graph = NavGraph(
    {
      splash,
      signIn({otp}),

      // `keep`: the shop's tab stack survives switching to another trunk.
      home.keep({
        // `query` terms: independent keys stay comma-separated. `&` = allOf, the
        // co-present price range (a record — both or neither). `q` and `sort` are
        // their own optional keys.
        search({_product()}).query({
          _Filter.q(.string),
          _Filter.sort(.enumValues(Sort.values)),
          _Filter.minPrice(.integer) & _Filter.maxPrice(.integer),
        }),
        // `stacked`: drill category → subcategory in fresh frames.
        category({category.stacked, _product()}),
        // `forget`: the scanner subtree is rebuilt fresh on every visit.
        scan.forget({_product()}),
        wishlist({_product()}),
        graft(_Checkout.subtree),
      }),

      account.keep({
        orders({order({_product()})}),
        settings,
        // `inherit`: editListing's id is structurally the listing's.
        listing({editListing.inherit(listing)}),
      }),

      // A resolve-only deep link: `/product/<uuid>` or `/product/@<handle>`.
      // The union slot is a single `slot` whose `|` lists the branches.
      product.link({
        slot(Codec.uuid | Codec.username),
      }),
    },
    root: const _Boot(),
    pageOf: (widget, ctx, key) => MaterialPage(key: key, child: widget),
  );
}

class _Boot extends StatelessWidget {
  const _Boot();
  @override
  Widget build(BuildContext context) {
    if (Screen.root.kind != null) {
      return Screen.root.front ?? const Scaffold(backgroundColor: Colors.black);
    }
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

// The global single-placement kick-starts — the buttons every screen shows.
final Map<String, VoidCallback> _nav = {
  'signIn': Screen.goSignIn,
  'home': Screen.goHome,
  'search': Screen.goSearch,
  'scan': Screen.goScan,
  'wishlist': Screen.goWishlist,
  'account': Screen.goAccount,
  'orders': Screen.goOrders,
  'settings': Screen.goSettings,
  'cart': Screen.goCart,
  'checkout': Screen.goCheckout,
  'payment': Screen.goPayment,
};

// An extremely simple screen: a color, a title, optional data rows, nav buttons.
class _S extends StatelessWidget {
  const _S(this.title, this.color, {this.body = const []});
  final String title;
  final Color color;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: color,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...body,
                        if (body.isNotEmpty)
                          const Divider(color: Colors.white24, height: 32),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            if (Screen.canPop != null)
                              FilledButton.tonal(
                                  onPressed: Screen.pop,
                                  child: const Text('← back')),
                            for (final e in _nav.entries)
                              OutlinedButton(
                                onPressed: e.value,
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.white54)),
                                child: Text(e.key),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

// A keyed-store LIST, the EntityScope pattern. `productsStore.of(context)`
// yields the key SEQUENCE and rebuilds this strip ONLY when it changes —
// add/remove/reorder (the engine's structure feed); a value change never
// fires here. Each item sits under an `EntityScope` (self-keyed by the id),
// so a price change rebuilds ONE tile — no selectors, no listEquals.
class _ProductsStrip extends StatelessWidget {
  const _ProductsStrip();

  @override
  Widget build(BuildContext context) {
    final ids = productsStore.of(context);
    const style = TextStyle(color: Colors.white70, fontSize: 14);
    if (ids.isEmpty) {
      return const Text('products you visit collect here', style: style);
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final id in ids)
          EntityScope(productsStore, id, child: const _ProductTile()),
      ],
    );
  }
}

// Inside the scope the entity is AMBIENT — the tile takes no arguments.
class _ProductTile extends StatelessWidget {
  const _ProductTile();

  @override
  Widget build(BuildContext context) {
    final product = EntityScope.of<Product>(context);
    return OutlinedButton(
      onPressed: () => Screen.on(.search)?.goProduct(product.id),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white54)),
      child: Text(
          '${product.name} · \$${(product.price / 100).toStringAsFixed(2)}'),
    );
  }
}

// A REAL consuming screen — the payoff of sharing one @ids node across the
// screens, entities, and stores trees. It takes NO id: `context.idOf(.product)`
// is the AMBIENT identity (the live nav frame's), and `productsStore(id)
// .of(context)` is the reactive per-key read — this widget rebuilds when THIS
// product changes, not when any other does. No subscription, no setState, no
// selector: the engine decided the granularity once.
class _Product extends StatelessWidget {
  const _Product();

  @override
  Widget build(BuildContext context) {
    final id = context.idOf(.product);
    final product = productsStore(id).of(context);
    // Request status is an honest ROW: in the set from
    // `dispatch(GetReviews(...))` until the page folds it out.
    final loading = reviewsInFlightStore.of(context).contains(id);
    final cart = cartStore.of(context);
    const style = TextStyle(color: Colors.white70, fontSize: 16);
    return _S(
      product?.name ?? 'Product',
      const Color(0xFFE53935),
      body: [
        Text(
            product == null
                ? 'loading…'
                : '\$${(product.price / 100).toStringAsFixed(2)}',
            style: style),
        const SizedBox(height: 8),
        FilledButton.tonal(
          // States a fact; the cart UNIT folds it. The badge below reads the
          // unit reactively — `cartStore.of(context)`.
          onPressed: product == null
              ? null
              : () => dispatch(CartItemAdded(product.name)),
          child: Text('add to cart (${cart.count})'),
        ),
        const SizedBox(height: 8),
        FilledButton.tonal(
          // OPTIMISTIC via the write dock: an ABSOLUTE target quantity. The
          // merged read shows it NOW; the echo confirms; silence reverts at
          // the deadline fact.
          onPressed: () => dispatch(SetQty(id, (cart.qty[id] ?? 0) + 1)),
          child: Text('qty ${cart.qty[id] ?? 0} +'),
        ),
        const SizedBox(height: 8),
        // OWNED children: reviews live INSIDE the product (the entity graph's
        // `product({review})`), folded from `ReviewsPage` facts.
        for (final r in [...?product?.reviews.values])
          Text('★ ${r.author}: ${r.text}', style: style),
        if (loading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text('loading reviews…',
                style: TextStyle(color: Colors.white38, fontSize: 14)),
          )
        else if (product != null &&
            (product.reviews.isEmpty || product.hasMoreReviews))
          OutlinedButton(
            // ONE verb for everything: this dispatch sends the request (the
            // wire is a subscriber) AND marks the key in flight (Awaits).
            onPressed: () => dispatch(GetReviews(id,
                before: product.reviews.values.lastOrNull?.id)),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54)),
            child: Text(
                product.reviews.isEmpty ? 'load reviews' : 'more reviews'),
          ),
      ],
    );
  }
}
