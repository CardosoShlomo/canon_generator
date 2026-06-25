import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/nav.dart';

// Compile-only: the reactive stack reads are TYPED (`FeedView?`, not `AnyView?`).
// `context.on` = foreground, `context.at` = anywhere on the stack. Never called —
// its mere compilation proves the types line up.
// ignore: unused_element
FeedView? _typecheck(BuildContext c) {
  final FeedView? front = c.on(.feed.query({.category('books')}));
  final FeedView? anywhere = c.at(.feed);
  return front ?? anywhere;
}

void main() {
  testWidgets('grammar validates, renders, and navigates', (tester) async {
    verifyScreens();
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    // boots to Initial (the _Loading widget); don't settle — its spinner never
    // does. The resolver drives the first nav out of boot.
    expect(Screen.current, isA<Initial>());
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

    // present / absent (`.category` / `.not.category` — callable getters)
    expect(Screen.on(.feed.query({.category})), isNotNull); // set → present
    expect(Screen.on(.feed.query({.not.category})), isNull); // not absent

    // clear → condition no longer holds
    Screen.on(.feed)!.query.category = null;
    await tester.pumpAndSettle();
    expect(Screen.on(.feed.query({.category('books')})), isNull);
    expect(Screen.on(.feed.query({.category})), isNull); // not present
    expect(Screen.on(.feed.query({.not.category})), isNotNull); // now absent
    expect(Screen.query['category'], isNull);
  });

  testWidgets('multi-parent view-state: .at resolves the live placement', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));

    // tests share the one static graph; collapse home's kept stack to its root
    // so this starts from a known place.
    Screen.goHome();
    await tester.pumpAndSettle();
    while (Screen.canPop != null) {
      Screen.pop();
      await tester.pumpAndSettle();
    }

    // reach `item` THROUGH home → its placement is HomeItemNav
    Screen.goHome().goItem('42');
    await tester.pumpAndSettle();
    expect(Screen.current, isA<HomeItemNav>());
    expect(Screen.current, isA<ItemPlacement>()); // …a subtype of the screen's sealed set
    expect(Screen.current, isA<AnyPlacement>()); // …and of the global sealed root

    // the item nav's `.at` resolves the same leaf off the live chain
    final ItemPlacement here = Screen.on(.item('42'))!;
    expect(here, isA<HomeItemNav>());

    // write item's screen-local view-state through its mutable query
    Screen.on(.item('42'))!.query.sort = 'name';
    await tester.pumpAndSettle();
    expect(Screen.query['sort'], 'name');
    expect(Screen.on(.item('42').query({.sort('name')})), isNotNull); // equals holds
    expect(Screen.on(.item('42').query({.sort('date')})), isNull);
    expect(Screen.on(.item('42').query({.sort})), isNotNull); // present

    // reach the SAME screen through feed → its placement is now FeedItemNav
    Screen.goFeed().goItem('42');
    await tester.pumpAndSettle();
    expect(Screen.current, isA<FeedItemNav>());
    expect(Screen.on(.item('42'))!, isA<FeedItemNav>());
  });

  testWidgets('Screen.at reaches a buried placement; surface() brings it up', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    Screen.goFeed().goItem('7').goEditItem(); // feed → item → editItem (front)
    await tester.pumpAndSettle();
    expect(Screen.current, isA<FeedItemEditItemNav>());

    // feed/item are now BURIED under editItem: `on` (front-only) misses them,
    // `at` (anywhere on the stack) finds them.
    expect(Screen.on(.item('7')), isNull); // not the front
    expect(Screen.at(.item('7')), isNotNull); // but on the stack
    expect(Screen.at(.feed), isNotNull);
    expect(Screen.at(.item('9')), isNull); // wrong id → not reached

    // surface() brings the buried item up and returns it forward-capable
    Screen.at(.item('7'))!.surface();
    await tester.pumpAndSettle();
    expect(Screen.current, isA<FeedItemNav>());
    expect(Screen.stack.current.name, 'item');
  });

  testWidgets('placement-less On.query: global view-state, on=foreground/at=anywhere', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    Screen.goFeed();
    await tester.pumpAndSettle();
    Screen.on(.feed)!.query.category = 'books'; // feed's category (a global key)
    await tester.pumpAndSettle();

    // placement-less query against the FOREGROUND (feed): on matches.
    expect(Screen.on(.query({.category('books')})), isNotNull);
    expect(Screen.on(.query({.category('clothes')})), isNull);
    expect(Screen.at(.query({.category('books')})), isNotNull); // also on the stack

    // push item ON TOP (feed now buried); set item's sort (another global key).
    Screen.goFeed().goItem('5');
    await tester.pumpAndSettle();
    Screen.on(.item('5'))!.query.sort = 'name';
    await tester.pumpAndSettle();

    // `on` (foreground = item) doesn't see feed's category; `at` (anywhere) does.
    expect(Screen.on(.query({.category('books')})), isNull); // feed is buried
    expect(Screen.at(.query({.category('books')})), isNotNull); // …but found by at
    expect(Screen.on(.query({.sort('name')})), isNotNull); // item is the front
    expect(Screen.at(.query({.sort('missing')})), isNull);
  });

  testWidgets('at(chain).goXx() is a smart jump (pop-to-self then go)', (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.delegate));
    Screen.goFeed().goItem('3').goEditItem(); // feed → item → editItem
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'editItem');

    // editItem is the front; item is buried. `at(.item).goEditItem()` jumps back
    // to item (popping editItem) then re-navigates — one atomic minimal diff.
    Screen.at(.item('3'))!.goEditItem(); // direct, no popToMe
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'editItem');
    expect(
      Screen.stack.screens.map((s) => s.name).toList(),
      ['feed', 'item', 'editItem'],
    );
  });
}
