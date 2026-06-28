import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/welcome.dart';

void main() {
  testWidgets('welcome: home -> item(id) -> back, and home -> settings',
      (tester) async {
    verifyScreens();
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.manager));

    Screen.goHome();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'home');

    Screen.goItem('001');
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'item');
    expect(Screen.stack.currentId, '001');

    Screen.pop();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'home');

    Screen.goSettings();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'settings');
  });
}
