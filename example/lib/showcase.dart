import 'dart:async';

import 'package:flutter/material.dart';
import 'package:canon_flutter/canon_flutter.dart'; // the facade — nav, state (ledger), and identity

part 'showcase.canon.dart';

// ── The SHOWCASE example ──────────────────────────────────────────────────
// A compact e-commerce app whose grammar trees exercise EVERY canon
// capability — nav (keep/forget, inherit, stacked/cycled, graft,
// query/fragment, links) AND state (a keyed store with OWNED children and
// tree ops, a keyless UNIT store, derived request status via an `Awaits`
// twin, reactive per-key reads). Most screens are a color + a row of nav
// buttons; `product` is a REAL consuming screen, so this doubles as the
// runnable app you test on.
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

// Request status as an HONEST ROW: dispatching `GetReviews` folds the key
// in, the page arriving folds it out. Presence = loading; no machinery,
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

// ── The cart: a UNIT store ────────────────────────────────────────────
// The wire test: cart facts arrive KEYLESS (the session is the identity), so
// the cart is a `Unit` — one value, no key.
class CartState {
  const CartState({this.items = const []});
  final List<String> items; // product names, kept trivial for the demo

  int get count => items.length;
}

sealed class CartMsg extends Msg {}

class CartItemAdded extends CartMsg {
  CartItemAdded(this.name);
  final String name;
}

final class CartUnit extends Unit<CartState, CartMsg> {
  const CartUnit() : super(const CartState());


  @override
  CartState reduce(CartState state, CartMsg msg) => switch (msg) {
        CartItemAdded(:final name) =>
          CartState(items: [...state.items, name]),
      };
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
  cart(CartUnit()),
  // coverage first — the gate reads it
  catalogCovered(CatalogCovered()),
  // the gate: once the live catalog has covered, cache facts drop here —
  // every row below sees only admitted messages (placement IS protection)
  catalogGate(CatalogGate()),
  // the disk-cache SHADOW — absent-only folds, supports main via the merge
  localProducts(LocalProducts()),
  products(Products()),
  reviewsInFlight(ReviewsInFlight());

  const _Regents(this.regent);
  @override
  final Regent regent;

  // Merge edges — STORE rows only: the target reads-from the source through
  // a projection, at read time (state is never copied).
  static final merges = {
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
// the app owns transport). On each nav commit it loads the live product by
// dispatching a SOURCE message (implements the sealed reduce family), which the
// store reduces in. A real app pipes a socket through the same dispatch — and
// because the wire is just another subscriber, `ledger.dispatch` is the app's
// only verb: the same call states a fact, sends a request, and (via the
// `Awaits` twin) marks its key in flight.
void demoBackend() {
  _Screens.graph.navigations.listen((_) {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.product) {
        final id = ProductId(e.id as String);
        dispatch(ProductLoaded(id, 'Product $id', 1999));
      }
    }
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
