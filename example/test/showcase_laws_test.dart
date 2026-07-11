import 'package:flutter_test/flutter_test.dart';
import 'package:canon_flutter/canon_flutter.dart';
import 'package:canon_example/showcase.dart';

// 13. The LAWS. The @regents enum is library-private (a generated app keeps
// its citizen list internal), so `replay(_Regents.values, …)` is unreachable
// from here. The mirror below registers the SAME citizen instances in the
// SAME row order on a bare public Ledger — the replay law stated through the
// public specs; row order, gates, and merge edges are identical.
typedef _Rows = ({
  Ledger ledger,
  UnitMemory<bool, ProductMsg> covered,
  UnitMemory<Set<ProductId>, Msg> inFlight,
  StoreMemory<ProductId, Product, ProductMsg> local,
  StoreMemory<ProductId, Product, ProductMsg> products,
  UnitMemory<CartWrite, CartMsg> write,
  UnitMemory<CartState, CartMsg> cart,
  UnitMemory<NavState?, Msg> nav,
});

_Rows _rows() {
  final ledger = Ledger();
  final covered = ledger.unit(const CatalogCovered());
  ledger.guard(const CatalogGate());
  ledger.guard(const ProductEntryGate());
  ledger.guard(const DedupeGetReviews());
  final inFlight = ledger.unit(const ReviewsInFlight());
  final local = ledger.store(const LocalProducts());
  final products = ledger.store(const Products());
  ledger.guard(const CartWriteGate());
  final write = ledger.unit(const CartWriteUnit());
  final cart = ledger.unit(const Cart());
  final nav = ledger.unit(const NavUnit());
  products.mergeStore(local, const LocalProductSupports());
  cart.merge(write, const WriteSupportsCart());
  return (
    ledger: ledger,
    covered: covered,
    inFlight: inFlight,
    local: local,
    products: products,
    write: write,
    cart: cart,
    nav: nav,
  );
}

/// Every citizen's state after folding [order] — the replay snapshot.
List<Object?> _replay(List<Msg> order) {
  final r = _rows();
  for (final msg in order) {
    r.ledger.dispatch(msg);
  }
  final snapshot = [
    r.covered.state,
    r.inFlight.state,
    {...r.local.entities},
    {...r.products.entities},
    r.write.state,
    r.cart.state,
    r.nav.state,
  ];
  r.ledger.close();
  return snapshot;
}

void main() {
  test('replay law: cache and authority converge in either order', () {
    final id = ProductId('p1');
    final cached = CatalogCacheMsg(id, 'Espresso kettle', 1999);
    final live = ProductLoaded(id, 'Espresso kettle', 1999);
    expect(_replay([cached, live]), equals(_replay([live, cached])));
  });

  test('dock law: the prediction never folds base; the echo settles clean',
      () {
    final r = _rows();
    final id = ProductId('p1');
    r.ledger.dispatch(const SetQty(ProductId('p1'), 3));
    // Base never folds a promise…
    expect(r.ledger.at(const Cart()).folded.qty, isEmpty);
    // …yet the merged read answers with it instantly (the dock's edge)…
    expect(r.cart.state.qty[id], 3);
    // …and the pending row holds the capture.
    expect(r.write.state.pending, isNotNull);

    // The echo re-applies the promise as a no-op → confirmed, dock clean.
    r.ledger.dispatch(const QtySaved(ProductId('p1'), 3));
    expect(r.ledger.at(const Cart()).folded.qty[id], 3);
    expect(r.write.state.pending, isNull);
    expect(r.write.state.tampered, isFalse);
    expect(r.cart.state.qty[id], 3);
    r.ledger.close();
  });

  test('dock law: silence reverts at the deadline fact', () {
    final r = _rows();
    final id = ProductId('p1');
    r.ledger.dispatch(const SetQty(ProductId('p1'), 3));
    r.ledger.dispatch(const QtyTimedOut());
    expect(r.write.state.pending, isNull);
    expect(r.write.state.reverted, isTrue);
    // The merged read is back to base — the promise left no trace.
    expect(r.cart.state.qty[id], isNull);
    r.ledger.close();
  });
}
