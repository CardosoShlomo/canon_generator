import 'package:flutter/material.dart';
import 'package:canon_flutter/canon_flutter.dart';

part 'welcome.canon.dart';

// ── The WELCOME example: the classic todo app, whole-stack canon ──────────
// Every canon idea in its smallest true form — compare it with the todo app
// you already know. Four tiny enums are the ENTIRE spec:
//
//   @IDs      the identity space (typed ids, URL codecs)
//   @entities what exists
//   @regents  the LEDGER's citizens, in traversal order: a coverage unit,
//             a veto standing above the rows it protects, a disk-cache
//             shadow store, the main store — plus the merge edge that lets
//             the shadow answer reads
//   @screens  the navigation grammar (illegal moves don't compile)
//
// State-side, the toggle is OPTIMISTIC with no wire ids: `CompleteTodo` is
// intent AND prediction (one dispatch sends and folds instantly); the echo
// settles it by state comparison; silence reverts it at the deadline.

// ── Identity ──
@IDs()
enum Ids with IdNode {
  todo(.uuid);

  const Ids(this.codec);
  @override
  final Codec codec;
}

// ── Facts (messages) ──
sealed class TodoMsg extends Msg {
  const TodoMsg();
}

/// The server's full list — the ABSENCE AUTHORITY: once it has spoken this
/// session, disk-cache facts are vetoed (see the gate row).
class TodosLoaded extends TodoMsg {
  const TodosLoaded(this.todos);
  final List<Todo> todos;
}

class TodoAdded extends TodoMsg {
  const TodoAdded(this.id, this.title);
  final TodoId id;
  final String title;
}

/// Intent AND prediction. It states the TARGET (`done: true`), never the
/// operation ("toggle") — absolute facts re-apply as no-ops, so the echo
/// below lands idempotently.
class CompleteTodo extends TodoMsg {
  const CompleteTodo(this.id, {required this.done});
  final TodoId id;
  final bool done;
}

/// The server's echo of the toggle.
class TodoToggled extends TodoMsg {
  const TodoToggled(this.id, {required this.done});
  final TodoId id;
  final bool done;
}

/// The disk cache speaking at boot — folds into the SHADOW, absent-only.
class CachedTodosMsg extends TodoMsg {
  const CachedTodosMsg(this.todos);
  final List<Todo> todos;
}

// ── State ──
class Todo with Identifiable<TodoId> {
  const Todo(this.id, this.title, {this.done = false});
  @override
  final TodoId id;
  final String title;
  final bool done;

  Todo completed(bool done) => Todo(id, title, done: done);

  @override
  bool operator ==(Object o) =>
      o is Todo && o.id == id && o.title == title && o.done == done;
  @override
  int get hashCode => Object.hash(id, title, done);
}

// ── The citizens ──
final class Todos extends Store<TodoId, Todo, TodoMsg> {
  const Todos();

  @override
  IdentifiableMap<TodoId, Todo> reduce(
          IdentifiableMap<TodoId, Todo> todos, TodoMsg msg) =>
      switch (msg) {
        TodosLoaded(:final todos) => todos.toMapById(),
        TodoAdded(:final id, :final title) => todos.upsert(Todo(id, title)),
        CompleteTodo(:final id, :final done) ||
        TodoToggled(:final id, :final done) =>
          todos.updateById(id, (t) => t.completed(done)),
        CachedTodosMsg() => todos,
      };
}

/// The disk-cache SHADOW: cache facts fold here (absent-only) and support
/// the main store's reads through the merge edge — never touching main.
final class LocalTodos extends Store<TodoId, Todo, TodoMsg> {
  const LocalTodos();

  @override
  IdentifiableMap<TodoId, Todo> reduce(
          IdentifiableMap<TodoId, Todo> todos, TodoMsg msg) =>
      switch (msg) {
        CachedTodosMsg(todos: final cached) => {
            for (final t in cached)
              if (!todos.containsKey(t.id)) t.id: t,
            ...todos,
          },
        _ => const Todos().reduce(todos, msg),
      };
}

/// Has the authority covered this session?
final class TodosCovered extends Unit<bool, TodoMsg> {
  const TodosCovered() : super(false);

  @override
  bool reduce(bool state, TodoMsg msg) =>
      switch (msg) { TodosLoaded() => true, _ => state };
}

/// The GATE — a veto row above the shadow: once the authority has spoken,
/// a late cache fact is dropped for every row below. Judges through `read` —
/// the ledger's own state by citizen identity; pure and replayable.
final class CachedTodosGate extends Veto<CachedTodosMsg> {
  const CachedTodosGate();
  @override
  bool block(CachedTodosMsg msg, ReadStore read) =>
      read(const TodosCovered());
}

final class LocalTodoSupports extends Projection<Todo, TodoId, Todo> {
  const LocalTodoSupports();
  @override
  Todo resolve(Todo? row, Todo local) => row ?? local;
}

// ── Entities: what exists ──
@entities
enum _Entities with EntityNode<_Entities> {
  todo(Todo, .todo),
  coverage(bool);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;

  // ignore: unused_field
  static final graph = EntityGraph({todo, coverage});
}

// ── Regents: the ledger's citizens, row order = traversal order ──
@regents
enum _Regents with RegentNode<_Regents> {
  todosCovered(TodosCovered()),
  cachedTodosGate(CachedTodosGate()), // protects every row below
  localTodos(LocalTodos()),
  todos(Todos());

  const _Regents(this.regent);
  @override
  final Regent regent;

  static final merges = {
    todos.from(localTodos, const LocalTodoSupports()),
  };
}

// ── Screens: the navigation grammar ──
@screens
enum _Screens with ScreenNode<_Screens> {
  home(TodoListScreen()),
  todo(TodoScreen(), .todo); // detail, keyed by the typed id — URL-real

  const _Screens(this.widget, [this.id]);
  @override
  final Widget widget;
  @override
  final Ids? id;

  static final graph = NavGraph(
    {
      home({todo}),
    },
    root: const ColoredBox(color: Colors.white),
    pageOf: (widget, ctx, key) => MaterialPage(key: key, child: widget),
  );
}

// ── Widgets ──
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ids = todosStore.of(context); // key sequence — structural rebuilds
    return Scaffold(
      appBar: AppBar(title: const Text('todos')),
      body: ListView(
        children: [
          for (final id in ids)
            _TodoTile(id: id), // per-key rebuilds inside
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dispatch(
            TodoAdded(TodoId(UniqueKey().toString()), 'New todo')),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TodoTile extends StatelessWidget {
  const _TodoTile({required this.id});
  final TodoId id;

  @override
  Widget build(BuildContext context) {
    final todo = todosStore.entityOf(context, id); // ONE entity — surgical
    if (todo == null) return const SizedBox.shrink();
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
        value: todo.done,
        // Optimistic: flips NOW; the echo confirms, silence reverts.
        onChanged: (v) => dispatch(CompleteTodo(id, done: v ?? false)),
      ),
      onTap: () => Screen.goTodo(id), // the only legal move — typed, URL-real
    );
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoId id = context.idOf(.todo); // ambient identity
    final todo = todosStore.entityOf(context, id);
    return Scaffold(
      appBar: AppBar(
        title: Text(todo?.title ?? '…'),
        leading: BackButton(onPressed: Screen.pop),
      ),
      body: Center(child: Text(todo?.done ?? false ? 'done' : 'not yet')),
    );
  }
}
