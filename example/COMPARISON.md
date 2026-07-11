# The same todo app, twice

One spec: a todo list and a detail screen. Server list + adds, an
**optimistic** complete-toggle (flips instantly; the echo confirms; silence
reverts), a **disk cache** that fills the first frame but must never
overwrite server truth, request **loading** state, real **URLs** with
working back/refresh, and tests.

Left: `go_router` + `riverpod` (idiomatic — `Notifier`, typed ids kept
where possible). Right: canon (`lib/welcome.dart` in this example, runnable).

---

## 1. Routing

```dart
// go_router — routes are strings; ids travel as path fragments
final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const TodoListScreen(), routes: [
    GoRoute(
      path: 'todo/:id',
      builder: (_, s) => TodoScreen(id: TodoId(s.pathParameters['id']!)),
    ),
  ]),
]);

// navigating — a typo compiles; a wrong id type compiles:
onTap: () => context.go('/todo/${todo.id}'),
```

```dart
// canon — the grammar IS the router; illegal moves don't compile
@screens
enum _Screens with ScreenNode<_Screens> {
  home(TodoListScreen()),
  todo(TodoScreen(), .todo); // keyed by the typed id — URL-real
  static final graph = NavGraph({ home({todo}) }, …);
}

// navigating — deictic: no route string, no id passed
onTap: () => TodoID.navOf(context).go(),
```

The go_router side is fine until it isn't: `'/todo/$id'` is a stringly
contract re-stated at every call site, `:id` decodes by hand, and nothing
stops `context.go('/tood/$id')` from compiling. Canon's tree is the single
statement of the space — the verb surface is generated from it, so the
only expressible navigations are the legal ones, and every one is a URL.

## 2. State + the optimistic toggle

```dart
// riverpod — a Notifier owns the map; optimism is hand-rolled
class Todos extends Notifier<Map<TodoId, Todo>> {
  @override
  Map<TodoId, Todo> build() => {};

  final _reverts = <TodoId, Timer>{};      // revert bookkeeping
  final _predicted = <TodoId, bool>{};     // what we promised

  void loaded(List<Todo> list) =>
      state = {for (final t in list) t.id: t};

  void complete(TodoId id, bool done) {
    _predicted[id] = done;
    state = {...state, id: state[id]!.completed(done)};   // flip NOW
    ws.send({'type': 'complete_todo', 'id': id, 'done': done});
    _reverts[id]?.cancel();
    _reverts[id] = Timer(const Duration(seconds: 8), () {  // silence ⇒ revert
      final want = _predicted.remove(id);
      if (want != null) {
        state = {...state, id: state[id]!.completed(!want)};
      }
    });
  }

  void toggled(TodoId id, bool done) {                     // the echo
    _reverts.remove(id)?.cancel();
    _predicted.remove(id);
    state = {...state, id: state[id]!.completed(done)};
  }
}
```

```dart
// canon — the fold is the whole story; no timers, no bookkeeping fields
final class Todos extends Store<TodoId, Todo, TodoMsg> {
  const Todos();
  @override
  IdentifiableMap<TodoId, Todo> reduce(todos, TodoMsg msg) => switch (msg) {
        TodosLoaded(:final todos) => todos.toMapById(),
        TodoAdded(:final id, :final title) => todos.upsert(Todo(id, title)),
        CompleteTodo(:final id, :final done) ||   // intent AND prediction
        TodoToggled(:final id, :final done) =>    // …and the echo, same arm
          todos.updateById(id, (t) => t.completed(done)),
        CachedTodosMsg() => todos,                 // the shadow folds it
      };
}
// the deadline is an EFFECT dispatching a fact; the fold never holds a Timer
```

Same feature; the difference is *where the hard part lives*. In the
Notifier, optimism is three mutable side-tables (`_reverts`, `_predicted`,
the timer) woven through methods — none of it observable, none of it
replayable, each new optimistic field re-implements the weave. In canon it
is rows: the prediction is a fact, the echo is a fact, the timeout is a
fact an effect dispatches — the fold stays a pure table, and confirm /
revert / amend orders are statable as laws.

## 3. The disk cache that must not overwrite the server

```dart
// riverpod — precedence is a flag and a prayer
bool _serverSpoke = false;
void loaded(List<Todo> list) { _serverSpoke = true; /* … */ }
void cached(List<Todo> list) {
  if (_serverSpoke) return;                 // ordering bug lives here:
  state = {                                 // what if the echo of an add
    for (final t in list) t.id: t,          // arrived before the cache?
    ...state,                               // (partially handled by spread)
  };
}
```

```dart
// canon — precedence is a ROW ORDER, checked by a law
@canon
const app = Regency({
  TodosCovered(),        // has the authority spoken?
  CachedTodosGate(),     // drops late cache for rows below
  LocalTodos(),          // the shadow: fills ABSENCE only
  Todos(),               // main truth
}, merges: {LocalTodoSupports()});

// and the law that would catch the riverpod bug, executable:
expect(replay(app, [cache, serverList]),
       equals(replay(app, [serverList, cache])));
```

The riverpod flag is the same idea — "coverage" — as private mutable state
with its race conditions hand-managed. Canon makes it a regent: the gate's
*position* is the precedence rule, and the convergence claim is a one-line
test that actually runs.

## 4. Ids in the UI

```dart
// riverpod — the id threads through every layer
TodoTile(id: id, onToggle: (d) => ref.read(todosProvider.notifier)
    .complete(id, d));
// …and TodoScreen(id:) …and '/todo/:id' parsing …
```

```dart
// canon — identity is ambient, node-verified
ledger.todos.item(id, child: const _TodoTile()); // the one plant
// inside the tile / the detail screen:
EntityScope.of<Todo>(context);                   // the entity
dispatch(CompleteTodo(TodoID.of(context), done: v)); // write: id READ ambiently
ledger.todos.entityOf(context);                  // detail: entity at the screen's id
```

## 5. Loading

```dart
// riverpod — a field, or an AsyncValue wrapping the whole list
final loading = ref.watch(todosLoadingProvider);   // one more provider
```

```dart
// canon — presence in an in-flight ROW; replay-visible like everything else
final loading = ledger.todosInFlight.containsIdOf(context);
```

## 6. Restoration & the web

go_router restores the top route from the URL; everything else — scroll-adjacent
view state, the *stack* below the top, optimistic state in flight — is yours to
rebuild. Canon's URL is a projection of the committed stack: back/forward walk
real history entries, refresh restores the exact stack (state blob), and a cold
link rebuilds the legal chain from the grammar.

## 7. Tests

```dart
// riverpod — construct the container, poke notifiers, hope the timers
// don't fire; the optimistic weave needs fakes for ws + clock
```

```dart
// canon — the ledger is a pure value; the whole app replays in a unit test
final z = replay(app, [cache, TodosLoaded(…), CompleteTodo(…)]);
expect(z[const Todos()], …);    // and permutation laws state convergence
```

---

## The honest column

Where go_router + riverpod wins:

- **Setup**: no build_runner, no enums, running in minutes. Canon's four
  declarations (`@IDs` `@entities` the regency `@screens`) are ~60 lines of
  ceremony before the first frame.
- **Familiarity**: every Flutter dev reads a Notifier cold; canon's
  vocabulary (regents, gates, folds, plants) must be learned.
- **Escape hatches**: ad-hoc mutation is one method away when you want to
  cheat. Canon makes cheating a compile error — which is the product, but
  on day one it feels like friction.

Where the spec above stops being comparable at all:

- The riverpod optimistic weave shown is the *minimal* version — it still
  mishandles a second toggle racing the first echo (keyed by id only), and
  every store that wants optimism re-implements it. The canon dock is the
  same rows every time, and the tricky orders are laws.
- Nothing on the left is replayable, and no claim on the left is testable
  without faking the world. On the right, `replay` is the world.
- Every id on the left is threaded by hand and `'/todo/$id'` is typed at
  every call site. On the right, identity is planted once and verified by
  node — a read can't answer with another identity's id.

Line counts for THIS spec (state + routing + widgets, comments stripped):
riverpod/go_router twin ≈ 210 lines with the bugs noted above; canon
`welcome.dart` ≈ 250 lines with none of them, plus the replay law suite the
left side cannot express. The ceremony gap buys the law gap.
