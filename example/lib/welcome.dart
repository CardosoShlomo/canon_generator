import 'package:flutter/material.dart';
import 'package:canon_flutter/canon_flutter.dart';

part 'welcome.canon.dart';

// ── The WELCOME example: the classic todo app, whole-stack canon ──────────
// Every canon idea in its smallest true form — compare it with the todo app
// you already know. Four tiny declarations under ONE annotation (`@canon` —
// the mixin says which tier each is) are the ENTIRE spec:
//
//   Ids       the identity space (typed ids, URL codecs)
//   _Entities the id-node bindings (an app with none skips this enum)
//   app       the REGENCY: the ledger's regents, in traversal order — a coverage unit,
//             a veto standing above the rows it protects, a disk-cache
//             shadow store, the main store — plus the merge edge that lets
//             the shadow answer reads
//   _Screens  the navigation grammar (illegal moves don't compile)
//
// State-side, the toggle is OPTIMISTIC with no wire ids: `CompleteTodo` is
// intent AND prediction (one dispatch sends and folds instantly); the echo
// settles it by state comparison; silence reverts it at the deadline.

// ── Identity ──
@canon
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

// ── The regents ──
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
        // The shadow law: the delegation arm is TYPED, never a wildcard —
        // exhaustive by the sealed family, a new fact is a compile error.
        TodoMsg() => const Todos().reduce(todos, msg),
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
/// the ledger's own state by regent identity; pure and replayable.
final class CachedTodosGate extends Veto<CachedTodosMsg> {
  const CachedTodosGate();
  @override
  bool block(CachedTodosMsg msg, ReadStore read) =>
      read(todosCovered);
}

/// The projection IS the merge edge — it carries its endpoints.
final class LocalTodoSupports extends Projection<Todo, TodoId, Todo> {
  const LocalTodoSupports() : super(todos, localTodos);
  @override
  Todo resolve(Todo? row, Todo local) => row ?? local;
}

// ── Entities: what exists ──
@canon
enum _Entities with EntityNode<_Entities> {
  todo(Todo, .todo),
  coverage(bool);

  const _Entities(this.type, [this.key]);
  @override
  final Type type;
  @override
  final Ids? key;
}

// ── The REGENCY: the app's state tier as a const value ──
// The rows get NAMES — consumer-owned const globals (the audit list);
// `read(todosCovered)` in a judge, `todos.of(context)` in a build (the
// generated per-class extension), `super(todos, localTodos)` in a
// projection. Set order is traversal order — placement is protection.
const todosCovered = TodosCovered();
const localTodos = LocalTodos();
const todos = Todos();

@canon
const app = Regency({
  todosCovered,
  CachedTodosGate(), // protects every row below
  localTodos,
  todos,
}, merges: {LocalTodoSupports()});

// ── Screens: the navigation grammar ──
@canon
enum _Screens with ScreenNode<_Screens> {
  home(TodoListScreen()),
  todo(TodoScreen(), .todo); // detail, keyed by the typed id — URL-real

  const _Screens(this.widget, [this.id]);
  @override
  final Widget widget;
  @override
  final Ids? id;

  static final graph = ScreenGraph(
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
    final ids = todos.of(context); // key sequence — structural rebuilds
    return Scaffold(
      appBar: AppBar(title: const Text('todos')),
      body: ListView(
        children: [
          // The item PLANT: scopes one todo (data + identity) over its tile —
          // self-keyed, per-key rebuilds, and the subtree needs no arguments.
          for (final id in ids)
            todos.item(id, child: const _TodoTile()),
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
  const _TodoTile();

  @override
  Widget build(BuildContext context) {
    final todo = EntityScope.of<Todo>(context); // the scope's snapshot
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
        value: todo.done,
        // Optimistic: flips NOW; the echo confirms, silence reverts. The
        // WRITE is an explicit fact whose id was READ ambiently.
        onChanged: (v) =>
            dispatch(CompleteTodo(TodoID.of(context), done: v ?? false)),
      ),
      // DEICTIC: navigates from where this tile stands — no chain named,
      // no id passed; the fold enforces the edge. Typed, URL-real.
      onTap: () => TodoID.navOf(context).go(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The screen PLANTS its identity: both reads are ambient — the typed id
    // and the entity at it — no constructor threading anywhere.
    final todo = todos.entityOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(todo?.title ?? '…'),
        leading: BackButton(onPressed: Screen.pop),
      ),
      body: Center(child: Text(todo?.done ?? false ? 'done' : 'not yet')),
    );
  }
}
