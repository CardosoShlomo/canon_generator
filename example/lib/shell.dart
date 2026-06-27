import 'package:flutter/material.dart';
import 'package:canon/canon.dart'; // re-exports Codec

part 'shell.nav.dart';

// Root enum: grafts the Shop and Wishlist sub-enums under `home`. The generated
// surface is blind to the split — Screen.goShop()/goProduct() etc. are emitted
// exactly as if those screens were native rows.
@screens
enum _Shell with ScreenNode<_Shell> {
  home(_P('Home')),
  settings(_P('Settings'));

  const _Shell(this.widget);
  @override
  final Widget widget;

  static final graph = NavGraph(
    {
      home.keep({
        settings,
        graft(Shop.subtree),
        graft(Wishlist.subtree),
      }),
    },
    root: const _Boot(),
    pageOf: (widget, ctx, key) => MaterialPage(key: key, child: widget),
  );
}

// Boot loading UI for the shell graph.
class _Boot extends StatelessWidget {
  const _Boot();
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}

// Owns `product` — it carries the widget and a uuid id codec.
enum Shop with SubScreenNode<Shop> {
  shop(_P('Shop')),
  catalog(_P('Catalog')),
  product(_P('Product'), Codec.uuid);

  const Shop(this.widget, [this.id]);
  @override
  final Widget? widget;
  final Codec? id;

  static final subtree = shop({
    catalog({product})
  });
}

// REFERENCES `product` via a null-widget ref: it collapses to Shop.product, so
// the one product screen is reachable under `saved` too (multi-placement).
enum Wishlist with SubScreenNode<Wishlist> {
  saved(_P('Saved')),
  product; // ref — no widget, id adopted from the owner

  const Wishlist([this.widget]);
  @override
  final Widget? widget;

  static final subtree = saved({product});
}

class _P extends StatelessWidget {
  const _P(this.title);
  final String title;
  @override
  Widget build(BuildContext context) => Text(title);
}
