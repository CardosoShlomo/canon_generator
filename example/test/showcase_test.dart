import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/showcase.dart';

void main() {
  testWidgets('showcase grammar validates and navigates the whole tree',
      (tester) async {
    verifyScreens();
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.manager));

    Screen.goHome();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'home');

    // graft: cart/checkout/payment are emitted as native verbs from another enum
    Screen.goCart().goCheckout().goPayment();
    await tester.pumpAndSettle();
    expect(Screen.stack.screens.map((s) => s.name).toList(),
        ['home', 'cart', 'checkout', 'payment']);

    // inherit kick-start rescue: editListing stamps the listing id
    Screen.goEditListing('L1');
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'editListing');
    expect(Screen.stack.currentId, 'L1');

    // pop returns the sealed placement directly (no .at)
    expect(Screen.pop(), isNotNull);
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'listing');
  });
}
