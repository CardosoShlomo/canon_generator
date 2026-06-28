import 'package:flutter/material.dart';
import 'package:canon/canon.dart';

part 'showcase.nav.dart';

// ── The SHOWCASE example ──────────────────────────────────────────────────
// A compact e-commerce app whose single grammar tree exercises EVERY canon
// capability. Screens are deliberately trivial (a color + a row of nav
// buttons) so this doubles as the runnable app you test navigation on.

// Search view-state: `?q=&sort=&minPrice=&maxPrice=`.
enum _Filter with QueryKeyBase { q, sort, minPrice, maxPrice }

// Product view-state: a `?variant=` query and a `#tab=` fragment.
enum _PV with QueryKeyBase { variant }
enum _Tab with QueryKeyBase { tab }

enum Sort { relevance, priceLow, priceHigh, newest }

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
  category(_S('Category', Color(0xFF43A047)), Codec.string),
  product(_S('Product', Color(0xFFE53935)), Codec.uuid),
  seller(_S('Seller', Color(0xFFD81B60)), Codec.username),

  wishlist(_S('Wishlist', Color(0xFFF4511E))),
  account(_S('Account', Color(0xFF6D4C41))),
  orders(_S('Orders', Color(0xFF757575))),
  order(_S('Order', Color(0xFF546E7A)), Codec.uuid),
  settings(_S('Settings', Color(0xFF7CB342))),
  listing(_S('My listing', Color(0xFFFB8C00)), Codec.uuid),
  editListing(_S('Edit listing', Color(0xFFFFB300)), Codec.uuid);

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
        // `query` combinators: `oneOf` (one sort) + `allOf` (price range).
        search({_product()}).query({
          _Filter.q(Codec.string),
          oneOf({_Filter.sort(Codec.enumValues(Sort.values))}),
          allOf({_Filter.minPrice(Codec.integer), _Filter.maxPrice(Codec.integer)}),
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
      product.link({
        slots({Codec.uuid, Codec.username})
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

// An extremely simple screen: a color, a title, and nav buttons.
class _S extends StatelessWidget {
  const _S(this.title, this.color);
  final String title;
  final Color color;

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
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (Screen.canPop != null)
                          FilledButton.tonal(
                              onPressed: Screen.pop, child: const Text('← back')),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
