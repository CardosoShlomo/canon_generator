import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'showcase.dart';

void main() {
  usePathUrlStrategy();
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
