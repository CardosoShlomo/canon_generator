import 'package:flutter/material.dart';
import 'package:canon/canon.dart';

part 'welcome.canon.dart';

// ── The WELCOME example ─────────────────────────────────────────────────────
// The smallest canon app. The whole navigation space is the ONE grammar tree
// below — the methods that exist (`Screen.goItem('001')`, `Screen.goSettings()`,
// `Screen.pop()`) are the only legal moves, so an illegal route or a missing /
// mistyped id is a COMPILE error, never a runtime crash.
@screens
enum _Screens with ScreenNode<_Screens> {
  home(HomeScreen()),
  item(ItemScreen(), .uuid), // a detail screen, keyed by a typed id
  settings(SettingsScreen());

  const _Screens(this.widget, [this.id]);
  @override
  final Widget widget;
  @override
  final Codec? id;

  static final graph = NavGraph(
    {
      home({item, settings}),
    },
    root: const _Splash(),
    pageOf: (widget, ctx, key) => MaterialPage(key: key, child: widget),
  );
}

class _Splash extends StatelessWidget {
  const _Splash();
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to canon'),
          actions: [
            // A typed kick-start tear-off — no string path, no closure.
            IconButton(icon: const Icon(Icons.settings), onPressed: Screen.goSettings),
          ],
        ),
        body: ListView(
          children: [
            for (final id in ['001', '002', '003'])
              ListTile(
                leading: const Icon(Icons.inventory_2_outlined),
                title: Text('Item $id'),
                trailing: const Icon(Icons.chevron_right),
                // `goItem` REQUIRES an id — calling it without one won't compile.
                onTap: () => Screen.goItem(id),
              ),
          ],
        ),
      );
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final id = context.idOf(.item); // typed, never null for an id screen
    return Scaffold(
      appBar: AppBar(title: Text('Item $id')), // back button is automatic
      body: Center(child: Text('Item $id', style: const TextStyle(fontSize: 28))),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: const Center(child: Text('Settings')),
      );
}
