import 'package:flutter/material.dart';
import 'package:canon/canon.dart';

part 'nav.nav.dart';

// Two root trees for web-history testing:
//   a → { b → c, d }      e → { f → g }
// A shared bottom bar jumps to any screen via its global kick-start verb.
@Screens(domain: 'https://canon.example')
enum _Screens with ScreenNode<_Screens> {
  a(_Page('A', Colors.red)),
  b(_Page('B', Colors.green)),
  c(_Page('C', Colors.blue)),
  d(_Page('D', Colors.orange)),
  e(_Page('E', Colors.purple)),
  f(_Page('F', Colors.teal)),
  g(_Page('G', Colors.brown));

  const _Screens(this.widget);
  final Widget widget;

  static final graph = NavGraph(
    {
      a({
        b({c}),
        d,
      }),
      e({
        f({g}),
      }),
    },
    initial: const _Loading(),
    pageOf: (widget, ctx, key) => MaterialPage(key: key, child: widget),
  );
}

// The base/initial widget: a spinner while booting, and the face of a bare floor.
// On a bare floor (`Screen.base.kind != null`) we keep showing the current front
// screen; the consumer could instead return a home or anything here.
class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    if (Screen.base.kind != null) {
      return Screen.base.front ?? const Scaffold(backgroundColor: Colors.black);
    }
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _Page extends StatelessWidget {
  const _Page(this.title, this.color);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 140, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: const _Bar(),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar();

  @override
  Widget build(BuildContext context) {
    final go = <String, VoidCallback>{
      'A': Screen.goA,
      'B': Screen.goB,
      'C': Screen.goC,
      'D': Screen.goD,
      'E': Screen.goE,
      'F': Screen.goF,
      'G': Screen.goG,
    };
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final entry in go.entries)
            TextButton(onPressed: entry.value, child: Text(entry.key)),
        ],
      ),
    );
  }
}
