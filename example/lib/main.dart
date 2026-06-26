import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'nav.dart';

void main() {
  usePathUrlStrategy(); // /home instead of /#/home (web path URLs)

  // THE navigation resolver — set once, before runApp. canon fires it with the
  // cold-start link (or null) and on every deep link after: web address bar +
  // mobile app-links, one channel. It just writes Screen.goX(); the engine
  // leaves the Initial boot UI on the first commit. URLs never drive the stack.
  Screen.resolver = (Link? link) {
    switch (link) {
      case ItemMeLink():
        Screen.goHome().goItem('me');
      case ItemByIdLink(:final itemId):
        Screen.goHome().goItem(itemId);
      case ItemByUsernameLink(:final username):
        Screen.goHome().goItem(username);
      case _:
        Screen.goHome(); // no cold-start link (plain "/") → default landing
    }
  };

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    // routerConfig wires the URL channel (browser history + the deep-link
    // ingress that feeds the resolver).
    return MaterialApp.router(routerConfig: Screen.routerConfig);
  }
}
