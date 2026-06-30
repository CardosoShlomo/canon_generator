import 'dart:async';

import 'package:flutter/material.dart';
import 'package:canon/canon.dart';
import 'package:ledger/ledger.dart';

part 'showcase.nav.dart';

// ── The SHOWCASE example ──────────────────────────────────────────────────
// A compact e-commerce app whose single grammar tree exercises EVERY canon
// capability. Most screens are a color + a row of nav buttons; `product` is a
// REAL consuming screen, so this doubles as the runnable app you test on.
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
  product(Codec.uuid),
  seller(Codec.username),
  category(Codec.string),
  order(Codec.uuid),
  listing(Codec.uuid);

  const Ids(this.codec);
  @override
  final Codec codec;
}

// ── The STORES (consumer-defined; pure `reduce` on the `ledger` engine) ───
class Product with Identifiable<String> {
  Product(this.id, this.name, this.price);
  @override
  final String id;
  final String name;
  final int price;
}

sealed class ProductMsg extends Msg with Identifiable<String> {
  ProductMsg(this.id);
  @override
  final String id;
}

class ProductLoaded extends ProductMsg {
  ProductLoaded(super.id, this.name, this.price);
  final String name;
  final int price;
}

class Products extends Store<Product, ProductMsg> {
  const Products();
  @override
  IdentifiableMap<Product, String> reduce(
          IdentifiableMap<Product, String> entities, ProductMsg msg) =>
      switch (msg) {
        ProductLoaded(:final id, :final name, :final price) =>
          entities.upsert(Product(id, name, price)),
      };
}

class Review with Identifiable<String> {
  Review(this.id, this.at, this.text);
  @override
  final String id;
  final int at;
  final String text;
}

class ReviewMsg extends Msg {
  ReviewMsg(this.product, this.review);
  final String product; // the connection key
  final Review review;
}

class ReviewsConnection
    extends ConnectionRegistry<String, Review, String, int, ReviewMsg> {
  const ReviewsConnection();
  @override
  String keyOf(ReviewMsg msg) => msg.product;
  @override
  int sortKeyOf(Review entity) => entity.at;
  @override
  void apply(Connection<Review, String, int> connection, ReviewMsg msg) =>
      connection.receive(msg.review);
}

// ── The STORE grammar (@registries) ───────────────────────────────────────
// Each row holds a const store/connection + the @ids node it is keyed by. The
// generator hangs typed reads on `ledger`; because `product` screens bind the
// SAME nodes, it also wires nav-keyed reads + Door 2 demand triggers.
@registries
enum _Registries with RegistryNode<_Registries, Ids> {
  products(Products(), Ids.product),
  reviews(ReviewsConnection(), Ids.product);

  const _Registries(this.registry, this.key);
  final Object registry;
  @override
  final Ids key;
}

// The app's data SOURCE — faked for this runnable demo (the engine ships none;
// the app owns transport). Navigating emits a `…SurfaceMsg` demand when a key
// needs refreshing; each handler answers with canned data, dispatched back as a
// normal Msg so the reactive reads light up. A real app pipes a socket here.
void demoBackend() {
  ledger.on<ProductSurfaceMsg>((m, _) => scheduleMicrotask(
      () => ledger.dispatch(ProductLoaded(m.key, 'Product ${m.key}', 1999))));
  ledger.on<ReviewSurfaceMsg>((m, _) => scheduleMicrotask(() =>
      ledger.dispatch(ReviewMsg(m.key, Review('${m.key}-r1', 5, 'Great find.')))));
}

// A grafted subsystem: the whole checkout flow lives in its own enum and is
// spliced into the main tree with `graft` — the generated surface is blind to
// the split (`Screen.goCart()` etc. are emitted as if native).
enum _Checkout with SubScreenNode<_Checkout> {
  cart(_S('Cart', Color(0xFF8E24AA))),
  checkout(_S('Checkout', Color(0xFF5E35B1))),
  payment(_S('Payment', Color(0xFF3949AB))),
  confirmation(_S('Confirmation', Color(0xFF1E88E5)), Codec.uuid);

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
  otp(_S('OTP', Color(0xFF455A64)), Codec.string),

  home(_S('Home', Color(0xFF00897B))),
  search(_S('Search', Color(0xFF00ACC1))),
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
      }).query({_PV.variant(Codec.string)}).fragment({_Tab.tab(Codec.string)});

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
          _Filter.q(Codec.string),
          _Filter.sort(Codec.enumValues(Sort.values)),
          _Filter.minPrice(Codec.integer) & _Filter.maxPrice(Codec.integer),
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
  const _S(this.title, this.color, {this.extra = const []});
  final String title;
  final Color color;
  final List<Widget> extra;

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
                        ...extra,
                        if (extra.isNotEmpty)
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

// A REAL consuming screen — the payoff of sharing one @ids node across the
// screens and registries trees. It takes NO id: `ledger.reviewsOnProduct()`
// resolves the live `product` frame's id (that same node) and streams its
// connection, and landing here fires the Door 2 demand so the data loads itself.
// (`productsOnProduct` is a snapshot read; the StreamBuilder re-reads it as the
// reviews arrive — `ledger.consume` is the value-stream when you want one.)
class _Product extends StatelessWidget {
  const _Product();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectionView<Review, int>>(
      stream: ledger.reviewsOnProduct(),
      builder: (context, snap) {
        final product = ledger.productsOnProduct();
        final reviews = snap.data?.window ?? const <Review>[];
        const style = TextStyle(color: Colors.white70, fontSize: 16);
        return _S(
          product?.name ?? 'Product',
          const Color(0xFFE53935),
          extra: [
            Text('\$${((product?.price ?? 0) / 100).toStringAsFixed(2)}',
                style: style),
            const SizedBox(height: 8),
            if (reviews.isEmpty)
              const Text('loading reviews…', style: style)
            else
              for (final r in reviews)
                Text('★ ${r.text}', style: style),
          ],
        );
      },
    );
  }
}
