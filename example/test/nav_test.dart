import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/nav.dart';

void main() {
  testWidgets('grammar validates, renders, and navigates', (tester) async {
    verifyScreens();
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'splash');

    Screen.goHome();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'home');

    // parentOf: `item` has 2 distinct parents (home & feed), so it can't be
    // named off a single one — `.parentOf.item` resolves whichever we're on.
    Screen.on(.parentOf.item)?.goItem('42');
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'item');

    // inherit: editItem's id IS item's, so the push verb takes no id. editItem
    // has a single parent (item), so we just name it — no parentOf entry.
    Screen.on(.item('42'))!.goEditItem();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'editItem');
    expect(Screen.stack.currentId, '42'); // inherited from item, not passed

    expect(Screen.pop(), isNotNull); // typed global pop → back to item
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'item');
  });
}
