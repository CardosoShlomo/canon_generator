import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/shell.dart';

void main() {
  testWidgets('grafted sub-enum drives one unified surface', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.manager));

    // The generated _treeSignature is built from the VIRTUAL tree (graft
    // followed into Shop); it must match the runtime's spliced spec.
    expect(Screen.isCodegenFresh, isTrue);

    // Navigate across the graft via the unified surface — these verbs are
    // emitted exactly as if shop/catalog/product were native rows.
    Screen.goShop().goCatalog().goProduct('p1');
    await tester.pumpAndSettle();
    expect(find.text('Product'), findsOneWidget);

    // The live stack spans both enums.
    expect(
      Screen.stack.screens.map((s) => s.name).toList(),
      ['home', 'shop', 'catalog', 'product'],
    );
  });

  testWidgets('a ref collapses to its owner — one screen, reached from each '
      'placement', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.manager));

    // product is OWNED by Shop, under catalog:
    Screen.goShop().goCatalog().goProduct('p1');
    await tester.pumpAndSettle();
    expect(find.text('Product'), findsOneWidget);
    expect(Screen.stack.screens.map((s) => s.name).toList(),
        ['home', 'shop', 'catalog', 'product']);

    // the SAME product screen, reached via Wishlist's null-widget REF under saved:
    Screen.goSaved().goProduct('p2');
    await tester.pumpAndSettle();
    expect(find.text('Product'), findsOneWidget);
    expect(Screen.stack.screens.map((s) => s.name).toList(),
        ['home', 'saved', 'product']);
    expect(Screen.stack.currentId, 'p2'); // adopted the owner's String id type
  });
}
