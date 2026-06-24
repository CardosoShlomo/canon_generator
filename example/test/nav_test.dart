import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/nav.dart';

void main() {
  testWidgets('grammar validates, renders, and navigates', (tester) async {
    verifyScreens();
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    // boots to Initial (the _Loading widget); don't settle — its spinner never
    // does. The resolver drives the first nav out of boot.
    expect(Screen.at, isA<Initial>());
    Screen.goHome().goSettings().goAbout(); // seed home → settings → about
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'about');
    expect(
      Screen.stack.screens.map((s) => s.name).toList(),
      ['home', 'settings', 'about'],
    );
    Screen.pop();
    await tester.pumpAndSettle();
    Screen.pop();
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

    // inherit kick-start rescue: editAccount inherits its single id-bearing
    // parent, so one global id fills the whole chain.
    Screen.goEditAccount('u1');
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'editAccount');
    expect(Screen.stack.currentId, 'u1');
    expect(Screen.pop(), isNotNull);
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'account');
    expect(Screen.stack.currentId, 'u1'); // ancestor id stamped, not null
  });

  testWidgets('view-state: write off the nav + conditioned Screen.on', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    Screen.goFeed(); // out of boot; feed declares `.query({category, radius})`
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'feed');

    // write view-state through the nav's mutable query (top-scoped)
    Screen.on(.feed)!.query.category = 'books';
    Screen.on(.feed)!.query.radius = 7;
    await tester.pumpAndSettle();

    // read it back, both context-free and via the conditioned selector
    expect(Screen.query['category'], 'books');
    expect(Screen.on(.feed)!.query.radius, 7);

    // conditioned navigation: matches only when the view-state condition holds
    expect(Screen.on(.feed.query({.category('books')})), isNotNull);
    expect(Screen.on(.feed.query({.category('clothes')})), isNull);
    expect(Screen.on(.feed.query({.not.category('clothes')})), isNotNull); // negated
    expect(Screen.on(.feed.query({.category('books'), .radius(99)})), isNull); // AND

    // clear → condition no longer holds
    Screen.on(.feed)!.query.category = null;
    await tester.pumpAndSettle();
    expect(Screen.on(.feed.query({.category('books')})), isNull);
    expect(Screen.query['category'], isNull);
  });
}
