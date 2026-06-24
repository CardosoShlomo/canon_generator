import 'package:flutter/material.dart';
import 'package:canon/canon.dart';

part 'nav.nav.dart';

// The whole navigation space is ONE Set literal on a private enum. The
// generator turns it into a typed surface where illegal navigation is a
// compile error (you can only `go` to a screen's real children, only `pop`
// to a real ancestor).
@Screens(domain: 'https://canon.example')
enum _Screens with ScreenNode<_Screens> {
  splash(_Page('Splash')),
  signIn(_Page('Sign in')),
  home(_Page('Home')),
  feed(_Page('Feed')),
  profile(_Page('Profile')),
  item(_Page('Item'), Codec.string), //a detail screen keyed by an id
  editItem(_Page('Edit item'), Codec.string), //its id IS item's (see .inherit below)
  settings(_Page('Settings')),
  about(_Page('About')),
  account(_Page('Account'), Codec.string), //single-placement, id-bearing root
  editAccount(_Page('Edit account'), Codec.string); // inherits account's id

  const _Screens(this.widget, [this.id]);
  final Widget widget;
  final Codec? id;

  static final graph = NavGraph(
    {
      splash,
      signIn,
      // `.keep` preserves a tab's stack when you switch away and back.
      // `.inherit(item)` makes editItem's id structurally item's: its push verb
      // takes no id (`goEditItem()`), reading the live item id instead.
      home.keep({item({editItem.inherit(item)}), settings({about})}),
      // `.query({...})` declares feed's screen-local view-state → `?category=&radius=`,
      // a historyless URL mirror. Set it via `Screen.feedView.category = ...`.
      feed.keep({item({editItem.inherit(item)})}).query(
          {_FeedKeys.category(Codec.string), _FeedKeys.radius(Codec.integer)}),
      // account (under profile) has a child editAccount that inherits its id →
      // reachable by global kick-start: Screen.goEditAccount(id) fills account
      // AND editAccount with the one id (the inherit kick-start rescue).
      profile.keep({settings({about}), account({editAccount.inherit(account)})}),
      // a shareable deep link → item, resolved by the generated parse layer.
      item.link({slots({Codec.literal('me'), Codec.uuid(#itemId), Codec.username})}),
    },
    // The boot loading UI: shown on blob-null cold-boot until the resolver (which
    // may read `Screen.initialUrl`) commits a real screen. `Screen.at` is
    // `Initial` until then; that first commit auto-replaces (no history entry).
    initial: const _Loading(),
    pageOf: (widget, ctx, key) => MaterialPage(key: key, child: widget),
  );
}

// feed's view-state keys (a QueryKeyBase enum): `key(codec)` = value key.
enum _FeedKeys with QueryKeyBase { category, radius }

// The boot loading UI (rule 2): a plain widget, NOT a screen — it has no place
// in the nav tree. Shown while `Screen.at` is `Initial`.
class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _Page extends StatelessWidget {
  const _Page(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // `goFeed` is a kick-start (single-placement). `item` lives under
            // two tabs (a union), so it has no global verb — you chain to it
            // off a kick-start handle, which picks the placement.
            ElevatedButton(
              onPressed: () => Screen.goHome().goItem('42'),
              child: const Text('Open item 42 (in Home)'),
            ),
            // Zero-arg kick-start verbs are tear-offs — no closure, no context,
            // no string path: `onPressed: Screen.goFeed`.
            ElevatedButton(
              onPressed: Screen.goFeed,
              child: const Text('Feed tab'),
            ),
            // Back is the typed global pop (also a tear-off), shown only when
            // there's somewhere to pop (null at a root).
            if (Screen.canPop != null)
              ElevatedButton(
                onPressed: Screen.pop,
                child: const Text('Back'),
              ),
          ],
        ),
      ),
    );
  }
}
