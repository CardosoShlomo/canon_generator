import 'package:flutter/material.dart';
import 'package:canon/canon.dart';

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

  static final graph = NavGraph<InitialScreen>(
    {
      home.keep({
        settings,
        graft(Shop.subtree),
        graft(Wishlist.subtree),
      }),
    },
    initial: .home,
    pageOf: (widget, ctx, key) => MaterialPage(
      key: key,
      child: ScreenScope(entry: ctx.entry, child: widget),
    ),
  );
}

// Owns `product` — it carries the widget and the String id.
enum Shop with SubScreenNode<Shop> {
  shop(_P('Shop')),
  catalog(_P('Catalog')),
  product(_P('Product'), String);

  const Shop(this.widget, [this.id]);
  @override
  final Widget? widget;
  final Type? id;

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
