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

    // inherit kick-start selector: reach editItem directly under home, the id
    // pins the skipped item segment — `.home.editItem(id)` == `.home.item(id).editItem`.
    expect(Screen.on(.home.editItem('42')), isNotNull);
    expect(Screen.on(.home.editItem('99')), isNull); // wrong id → no match
    expect(Screen.on(.home.editItem('42')), isA<HomeItemEditItemNav>());

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

  test('WidgetLink.<route> mirrors the nav tree → a resolving URL', () {
    // every screen on the stack is a deep link; the chain walks the nav tree
    // root-down, an id-bearing screen takes its id (`.item(id)`), an inherited
    // segment is bare (`.editItem`), and `.toUri()` prints the full path.
    expect(WidgetLink.home.toUri().toString(), 'https://canon.example/home');
    expect(WidgetLink.home.settings.about.toUri().toString(),
        'https://canon.example/home/settings/about');
    expect(WidgetLink.home.item('42').toUri().toString(),
        'https://canon.example/home/item/42');
    // inherited editItem rides item's id → bare segment, no extra token
    expect(WidgetLink.home.item('42').editItem.toUri().toString(),
        'https://canon.example/home/item/42/edit-item');
    // kick-start shortcut: address editItem directly, the id back-fills item
    expect(WidgetLink.home.editItem('42').toUri().toString(),
        'https://canon.example/home/item/42/edit-item');
    // the SAME screen under a different parent → a different resolving path
    expect(WidgetLink.feed.item('42').toUri('https://x.io').toString(),
        'https://x.io/feed/item/42');

    // kick-start jump-over: account/editAccount sit under ONE parent (profile),
    // so they're addressable straight from the name — the id back-fills the path.
    expect(WidgetLink.account('u1').toUri().toString(),
        'https://canon.example/profile/account/u1');
    expect(WidgetLink.editAccount('u1').toUri().toString(),
        'https://canon.example/profile/account/u1/edit-account');
    expect(Link.editAccount('u1').toUri().toString(), // also on the superset
        'https://canon.example/profile/account/u1/edit-account');
  });

  test('WidgetLink view-state: a fluent .query chain mirrors into the URL', () {
    // no generated type named at the build site — each key autocompletes off the
    // chain; view-state lands on the target screen as ?query.
    expect(WidgetLink.feed.query.category('books').radius(7).toUri().toString(),
        'https://canon.example/feed?category=books&radius=7');
    // unset keys are simply absent; order follows the schema
    expect(WidgetLink.feed.query.category('books').toUri().toString(),
        'https://canon.example/feed?category=books');
    // item carries its own view-state (sort), under its full nav path
    expect(WidgetLink.home.item('42').query.sort('name').toUri().toString(),
        'https://canon.example/home/item/42?sort=name');

    // fragments too: `.fragment` opens the same builder; a flag key takes no arg
    expect(WidgetLink.feed.fragment.tab('chat').toUri().toString(),
        'https://canon.example/feed#tab=chat');
    // query + fragment in one chain → ?…#… ; the `.fragment` sentinel separates
    // the stages (query keys, then fragment keys — never mixed).
    expect(
        WidgetLink.feed.query
            .category('books')
            .fragment
            .tab('chat')
            .pinned()
            .toUri()
            .toString(),
        'https://canon.example/feed?category=books#tab=chat&pinned');
  });

  test('Link.<route> builder chain encodes the same URL as the flat link', () {
    // fluent path → URL; per-branch methods (canon's sibling model) replace
    // canon_link's single typed `call`.
    expect(Link.item.byId('550e8400-e29b-41d4-a716-446655440000').toUri().toString(),
        const ItemByIdLink('550e8400-e29b-41d4-a716-446655440000').toUri().toString());
    expect(Link.item.me().toUri().toString(),
        const ItemMeLink().toUri().toString());
    expect(Link.item.byUsername('ann').toUri('https://x.io').toString(),
        const ItemByUsernameLink('ann').toUri('https://x.io').toString());

    // family-filtered roots: every item branch is widgetless, so it lives on
    // WidgetlessLink, never WidgetLink (family-closed).
    expect(WidgetlessLink.item.byId('550e8400-e29b-41d4-a716-446655440001').toUri().toString(),
        Link.item.byId('550e8400-e29b-41d4-a716-446655440001').toUri().toString());

    // `Link.<route>` is the superset: the nav tree (WidgetLink) AND the resolve
    // leaves (WidgetlessLink) under one root.
    expect(Link.home.item('42').toUri().toString(), // nav-target path
        WidgetLink.home.item('42').toUri().toString());
    expect(Link.item.me().toUri().toString(), // resolve-branch leaf
        WidgetlessLink.item.me().toUri().toString());
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
