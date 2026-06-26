import 'package:flutter_test/flutter_test.dart';
import 'package:canon_example/nav.dart';

void main() {
  // The top-level `Screen.goXx` verbs are plain STATIC methods, so Dart
  // canonicalizes their tear-offs — `Screen.goHome` is the same constant
  // reference everywhere, safe to store as a map value. This guards against a
  // refactor to a closure-returning getter, which would make each tear-off a
  // fresh closure and silently break action maps keyed by the verb.
  test('Screen.goXx tear-offs are stable, canonicalized references', () {
    expect(identical(Screen.goHome, Screen.goHome), isTrue);
    expect(identical(Screen.goFeed, Screen.goFeed), isTrue);
    expect(identical(Screen.goEditAccount, Screen.goEditAccount), isTrue); // takes an id

    final actions = <String, Function>{
      'home': Screen.goHome,
      'feed': Screen.goFeed,
    };
    expect(identical(actions['home'], Screen.goHome), isTrue);
    expect(identical(actions['feed'], Screen.goFeed), isTrue);
  });
}
