import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/welcome.dart';

void main() {
  // Top-level `Screen.goXx` verbs are plain STATIC methods, so Dart
  // canonicalizes their tear-offs — safe to store in maps keyed by the verb.
  test('Screen.goXx tear-offs are stable, canonicalized references', () {
    expect(identical(Screen.goHome, Screen.goHome), isTrue);
    expect(identical(Screen.goSettings, Screen.goSettings), isTrue);
    expect(identical(Screen.goItem, Screen.goItem), isTrue); // takes an id

    final actions = <String, Function>{'home': Screen.goHome, 'settings': Screen.goSettings};
    expect(identical(actions['home'], Screen.goHome), isTrue);
  });
}
