import 'package:flutter/material.dart';

import 'showcase.dart';

void main() {
  // `Screen.manager` owns the URL strategy and binds the ledger; the app supplies
  // its data source and the entry resolver — how a cold-start URL becomes a screen.
  demoBackend();
  Screen.resolver = (Url? url) => switch (url) {
        Place p => Screen.go(p),
        _ => Screen.goSplash(),
      };
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();
  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(routerDelegate: Screen.manager);
}
