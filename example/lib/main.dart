import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'nav.dart';

void main() {
  // Path URLs (/home not /#/home).
  usePathUrlStrategy();

  // Resolver: a nav-mirror Place (e.g. pasted /b/c/d) → go straight there; a bare
  // root / link / unparseable → land on `a`. Places are go-able Hops.
  Screen.resolver = (Url? url) => switch (url) {
        Place p => Screen.go(p),
        _ => Screen.goA(),
      };

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerDelegate: Screen.delegate);
  }
}
