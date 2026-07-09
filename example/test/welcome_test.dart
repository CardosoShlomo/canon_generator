import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canon_flutter/canon_flutter.dart' show Stability;
import 'package:canon_example/welcome.dart';

void main() {
  testWidgets('welcome: home -> todo(id) -> back; optimistic complete',
      (tester) async {
    verifyScreens();
    await tester.pumpWidget(MaterialApp.router(routerDelegate: Screen.manager));

    Screen.goHome();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'home');

    dispatch(TodoAdded(TodoId('001'), 'Buy milk'));
    await tester.pumpAndSettle();
    expect(find.text('Buy milk'), findsOneWidget);

    Screen.goTodo(TodoId('001'));
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'todo');
    expect(Screen.stack.currentId, '001');

    // The intent folds instantly (it states the TARGET)…
    dispatch(TodoAdded(TodoId('002'), 'Brew tea'));
    dispatch(const CompleteTodo(TodoId('002'), done: true));
    expect(todosStore[TodoId('002')]!.done, isTrue);
    // …and the echo lands as a no-op re-statement of the same fact.
    dispatch(const TodoToggled(TodoId('002'), done: true));
    expect(todosStore[TodoId('002')]!.done, isTrue);

    Screen.pop();
    await tester.pumpAndSettle();
    expect(Screen.stack.current.name, 'home');
  });
}
