// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'welcome.dart';

// **************************************************************************
// CanonGenerator
// **************************************************************************

// Typed ids — nominal identity in the value space, generated
// from the @ids grammar. Zero-cost: each erases to its codec's
// value type at runtime. `node` links back to the grammar
// (`XId.node.codec` reaches the codec).
extension type const TodoId(String _) implements String {
  static const Ids node = Ids.todo;
}

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: annotate_overrides
final class const Screen<I>._(final Enum _spec) {
  /// This screen's name, as written in the grammar enum — the
  /// readable identity of a stack entry (`Screen.stack.current.name`).
  String get name => _spec.name;
  static const home = Screen<Never>._(_Screens.home);
  static const todo = Screen<TodoId>._(_Screens.todo);
  static Screen<Object?> _forSpec(Enum spec) => _bySpec[spec]!;

  /// The [Screen] constant for a grammar row — `pageOf`'s bridge from
  /// `PageCtx.screen` to the typed surface (per-screen meta extensions
  /// switch on the constants).
  static Screen<Object?> from(Enum spec) => _bySpec[spec]!;
  static const _bySpec = <Enum, Screen<Object?>>{
    BootScreen.root: Screen<Never>._(BootScreen.root),
    _Screens.home: home,
    _Screens.todo: todo,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Screens.graph.stack) NavEntry(_forSpec(e.screen), e.id),
  ]);
  static const _treeSignature = 'home(todo())';

  /// True when this generated code still matches the live tree.
  static bool get isCodegenFresh =>
      _Screens.graph.structureSignature == _treeSignature;
  static final bool _fresh = () {
    assert(
      isCodegenFresh,
      'canon: the navigation tree changed but generated code is stale — run build_runner.',
    );
    return true;
  }();

  /// THE app host — a `RouterDelegate`. Wire it once:
  /// `MaterialApp.router(routerDelegate: Screen.manager)`.
  static NavDelegate get manager {
    assert(_fresh);
    ledger.bind();
    return _Screens.graph.delegate;
  }

  /// Executes a resolved [Hop] — a kick-start or a parsed [Place].
  static N go<N extends AnyNav>(Hop<N> hop) {
    for (final (s, i) in hop.chain) _Screens.graph.go<Object?>(s, i);
    return hop.nav;
  }

  /// If the live stack ends with this selector path (every pinned id),
  /// its nav — else null.
  static N? on<N extends AnyNav>(On<N> which) {
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    return _atOf(specs.last) as N;
  }

  /// The placement if this selector path is anywhere on the live stack
  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.
  static N? at<N extends AnyNav>(On<N> which) {
    final st = _Screens.graph.stack;
    final specs = which.specs;
    outer:
    for (var e = st.length - 1; e >= specs.length - 1; e--) {
      final off = e - specs.length + 1;
      for (var i = 0; i < specs.length; i++) {
        if (st[off + i].screen != specs[i]) continue outer;
        final wid = which.ids[i];
        if (wid != null && st[off + i].id != wid) continue outer;
      }
      return _atOf(specs.last) as N;
    }
    return null;
  }

  /// The nav of the screen OWNING [context] (this widget's screen),
  /// typed by [which]. Total: its verbs go from that screen.
  /// Throws a [StateError] when [context] stands at another placement.
  static N ownerOf<N extends AnyNav>(BuildContext context, On<N> which) {
    final entry = ScreenScope.entryOf(context);
    final own = entry.screen;
    final chain = _Screens.graph.chainOf(entry);
    final specs = which.specs;
    final off = chain.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (off < 0 || chain[off + i] != specs[i]) {
        throw StateError(
          'ownerOf(${specs.map((s) => s.name).join('.')}) at ${chain.map((s) => s.name).join('/')}',
        );
      }
    }
    return _placementOf(own, chain) as N;
  }

  /// THE navigation resolver — assign once (ideally in `main` before
  /// `runApp`). Fires with the cold-start link (or null), then on every
  /// deep link — web URL + mobile app-link, one channel.
  static set resolver(void Function(Url? url) fn) => _Screens.graph.setResolver(
    (url) => fn(parseUrl(url)),
    boot:
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName,
  );

  /// Pops the active top when it sits on a parent; a no-op at a root.
  static void pop() {
    if (_Screens.graph.currentChain.length > 1) _Screens.graph.pop();
  }

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);
  static HomeNav goHome() {
    _Screens.graph.go(_Screens.home);
    return const HomeNav._();
  }

  static TodoNav goTodo(TodoId id) {
    _Screens.graph.go(_Screens.todo, id);
    return const TodoNav._();
  }
}

/// One committed navigation as typed [ScreenEntry] stacks.
final class ScreenNavigation._(final Navigation _n) {
  List<ScreenEntry> get from => [
    for (final e in _n.from)
      if (e.$1 != BootScreen.root) _entryOf(e.$1, e.$2),
  ];
  List<ScreenEntry> get to => [
    for (final e in _n.to)
      if (e.$1 != BootScreen.root) _entryOf(e.$1, e.$2),
  ];
  ScreenEntry get source => _entryOf(_n.source.$1, _n.source.$2);
  ScreenEntry get destination => _entryOf(_n.destination.$1, _n.destination.$2);
  NavDirection get direction => _n.direction;
  bool get isForward => _n.isForward;
  bool get isBackward => _n.isBackward;
  bool get isRoundTrip => _n.isRoundTrip;
  bool get isJump => _n.isJump;
}

/// One typed entry per screen — `switch` it for the screen-specific id.
sealed class const ScreenEntry();
final class const HomeEntry() extends ScreenEntry;
final class const TodoEntry(final TodoId id) extends ScreenEntry;
ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.home => const HomeEntry(),
  _Screens.todo => TodoEntry(id as TodoId),
  _ => throw StateError('not a _Screens screen'),
};

final class const Hop<N extends AnyNav>._(
  final Enum spec,
  final Object? id,
  final N nav,
) {
  /// The root-down chain this hop replays. A single kick-start is one
  /// segment; a navigable `Place` (a `Place`) overrides it with its
  /// full path, so `Screen.go` lands the whole placement.
  List<(Enum, Object?)> get chain => [(spec, id)];

  /// The screen this hop lands on — the total projection
  /// (the inverse needs an id, so it stays a Hop ctor).
  Screen<Object?> get screen => Screen._forSpec(spec);
  static const home = Hop<HomeNav>._(_Screens.home, null, HomeNav._());
  static Hop<TodoNav> todo(TodoId id) =>
      Hop._(_Screens.todo, id, const TodoNav._());
}

final class const Root._() extends AnyPlacement {
  this : super._();
}

final class const On<N extends AnyNav>._(
  final List<_Screens> specs,
  final List<Object?> ids,
  final N? nav,
) {
  static OnHome get home => OnHome._([.home], [null], const HomeNav._());
  static OnTodo get todo => OnTodo._([.todo], [null], const TodoNav._());
}

final class const OnHome._(super.specs, super.ids, super.nav)
    extends On<HomeNav> {
  this : super._();
  OnTodo get todo =>
      OnTodo._([...specs, .todo], [...ids, null], const TodoNav._());
}

final class const OnTodo._(super.specs, super.ids, super.nav)
    extends On<TodoNav> {
  this : super._();
  OnTodo call(TodoId id) =>
      OnTodo._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class const AnyPlacement._() extends AnyNav {
  this : super._();
}

AnyPlacement _atOf(Enum s) {
  final c = _Screens.graph.currentChain;
  return _placementOf(s, c.sublist(0, c.lastIndexOf(s) + 1));
}

AnyPlacement _placementOf(Enum s, List<Enum> p) => switch (s) {
  _Screens.home => const HomeNav._(),
  _Screens.todo => const TodoNav._(),
  BootScreen.root => const Root._(),
  _ => throw StateError('not a _Screens screen'),
};

abstract base class const AnyNav._();

final class const HomeNav._() extends AnyPlacement {
  this : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  TodoNav goTodo(TodoId id) {
    _Screens.graph.goFrom(_Screens.home, _Screens.todo, id);
    return const TodoNav._();
  }
}

final class const TodoNav._() extends AnyPlacement {
  this : super._();
  TodoNav surface() {
    _Screens.graph.popTo(_Screens.todo);
    return const TodoNav._();
  }
}

extension type const ScreenId<I>._(_Screens spec) {
  static const todo = ScreenId<TodoId>._(.todo);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));
}

/// A URL the app understands: a [Place] or a [Link]; `parseUrl`
/// returns one.
sealed class const Url([final String? domain]) {
  Uri toUri(String domain);
}

/// A POSITION in the tree — a parsed nav-mirror URL. Go-able: every
/// `Place` is a [Hop], so `Screen.go(place)` replays its chain.
sealed class const Place([super.domain]) extends Url implements Hop<AnyNav> {
  @override
  List<(Enum, Object?)> get chain;
  @override
  Enum get spec => chain.last.$1;
  @override
  Object? get id => chain.last.$2;
  @override
  AnyNav get nav => _atOf(_Screens.graph.current);
  @override
  Screen<Object?> get screen => Screen._forSpec(spec);
}

/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA
/// the resolver interprets. NOT a position — no widget, never navigable.
/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.
sealed class const Link([super.domain]) extends Url {}

/// The bare root `/` — a plain app-open (no specific destination).
final class const RootUrl([super.domain]) extends Url {
  @override
  Uri toUri(String domain) => Uri.parse('$domain/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class const _NavPlace(
  @override final List<(Enum, Object?)> chain, [
  super.domain,
]) extends Place {
  @override
  Uri toUri(String domain) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain,
      [for (final c in chain) c.$1],
      [for (final c in chain) c.$2],
    ),
  );
}

/// Parses [url] into a [Url]: a declared [Link], a nav-mirror [Place]
/// (go-able), [RootUrl] for bare `/`, or null if it resolves to nothing.
/// The result carries the inbound origin in [Url.domain].
Url? parseUrl(String url) {
  final uri = tryParseUri(url);
  if (uri == null) return null;
  final origin = uri.hasAuthority ? '${uri.scheme}://${uri.authority}' : null;
  final m = _Screens.graph.parseLink(url);
  if (m != null) {
    final link = switch (m.template) {
      _ => null,
    };
    if (link != null) return link;
  }
  // Bare root → a plain app-open.
  if (uri.pathSegments.where((s) => s.isNotEmpty).isEmpty) {
    return RootUrl(origin);
  }
  // Nav-mirror path → a go-able Place.
  final chain = _Screens.graph.parsePath(url);
  if (chain != null) return _NavPlace(chain, origin);
  return null;
}

// ignore_for_file: unused_element
/// The app-wide ledger, built from the `app` regency —
/// the runtime splices its rows in order and wires its merge
/// edges. `Screen.manager` binds the nav side. Reads hang on the
/// row CLASSES (`extension <Row>Reads`) — name your rows with const
/// globals (`const todos = Todos();`) and read `todos.idsOf(context)`.
final ledger = Ledger.root(app);

/// States a fact — dispatch is the ONLY verb, so it needs no prefix.
/// (`ledger.` keeps the rarer surfaces: `on`, `veto`, `guard`, `journal`.)
void dispatch(Msg msg) => ledger.dispatch(msg);
bool _bound = false;

/// The `todo` screen was navigated to (never a render).
class const TodoEnteredMsg(final TodoId id)
    extends Msg
    with Identifiable<TodoId>;

/// Reads for a `TodosCovered` row — sugar over `ledger.at(this)`.
extension TodosCoveredReads on TodosCovered {
  UnitMemory<bool, TodoMsg> get mem => ledger.at(this);

  /// The state, now — merge-resolved.
  bool get state => mem.state;

  Stream<void> get changes => mem.changes;
  Stream<UnitEvent<bool, TodoMsg>> get events => mem.events;

  /// The value, reactively — rebuilds on every change.
  bool of(BuildContext context) => mem.of(context);
}

/// Reads for a `LocalTodos` row — sugar over `ledger.at(this)`.
extension LocalTodosReads on LocalTodos {
  StoreMemory<TodoId, Todo, TodoMsg> get mem => ledger.at(this);

  /// The keyed collection, merge-resolved.
  IdentifiableMap<TodoId, Todo> get entities => mem.entities;
  Iterable<Todo> get values => mem.values;
  List<TodoId> get ids => mem.ids;
  Todo? operator [](TodoId key) => mem[key];

  Stream<TodoId> get changes => mem.changes;
  Stream<void> get structure => mem.structure;
  Stream<StoreEvent<TodoId, Todo, TodoMsg>> get events => mem.events;

  /// The key SEQUENCE, reactively — structural rebuilds only;
  /// value changes never fire, so scope rows with [item].
  List<TodoId> idsOf(BuildContext context) => mem.idsOf(context);

  /// The ROWS, reactively — rebuilds on shape AND on ANY
  /// row's value change.
  List<Todo> entitiesOf(BuildContext context) => mem.entitiesOf(context);

  /// One entity, reactively — id omitted reads the AMBIENT identity.
  Todo? entityOf(BuildContext context, [TodoId? id]) =>
      mem.entityOf(context, id);

  /// Plants the item scope over [child] — the list-tile spelling.
  Widget item(TodoId id, {required Widget child}) => mem.item(id, child: child);

  /// The enclosing item scope's id, when planted from THIS row.
  TodoId? idOf(BuildContext context) => mem.idOf(context);

  /// The entry on screen `todo`, at its live nav id.
  Todo? onTodo() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.todo) return mem[e.id as TodoId];
    }
    return null;
  }
}

/// Reads for a `Todos` row — sugar over `ledger.at(this)`.
extension TodosReads on Todos {
  StoreMemory<TodoId, Todo, TodoMsg> get mem => ledger.at(this);

  /// The keyed collection, merge-resolved.
  IdentifiableMap<TodoId, Todo> get entities => mem.entities;
  Iterable<Todo> get values => mem.values;
  List<TodoId> get ids => mem.ids;
  Todo? operator [](TodoId key) => mem[key];

  Stream<TodoId> get changes => mem.changes;
  Stream<void> get structure => mem.structure;
  Stream<StoreEvent<TodoId, Todo, TodoMsg>> get events => mem.events;

  /// The key SEQUENCE, reactively — structural rebuilds only;
  /// value changes never fire, so scope rows with [item].
  List<TodoId> idsOf(BuildContext context) => mem.idsOf(context);

  /// The ROWS, reactively — rebuilds on shape AND on ANY
  /// row's value change.
  List<Todo> entitiesOf(BuildContext context) => mem.entitiesOf(context);

  /// One entity, reactively — id omitted reads the AMBIENT identity.
  Todo? entityOf(BuildContext context, [TodoId? id]) =>
      mem.entityOf(context, id);

  /// Plants the item scope over [child] — the list-tile spelling.
  Widget item(TodoId id, {required Widget child}) => mem.item(id, child: child);

  /// The enclosing item scope's id, when planted from THIS row.
  TodoId? idOf(BuildContext context) => mem.idOf(context);

  /// The entry on screen `todo`, at its live nav id.
  Todo? onTodo() {
    for (final e in _Screens.graph.stack) {
      if (e.screen == _Screens.todo) return mem[e.id as TodoId];
    }
    return null;
  }
}

/// The nav-side wiring. Idempotent — `Screen.manager` calls it.
extension AppLedger on Ledger {
  void bind() {
    if (_bound) return;
    _bound = true;
    IdScope.tag(ledger.at(localTodos), Ids.todo);
    IdScope.tag(ledger.at(todos), Ids.todo);
    _Screens.graph.navigations.listen((n) {
      final (screen, id) = n.destination;
      if (screen == _Screens.todo) {
        dispatch(TodoEnteredMsg(id as TodoId));
      }
    });
  }
}

/// Canon's `todo` identity face: `of` reads the ambient
/// typed id, `navOf` mints the deictic handle for the verbs.
abstract final class TodoID {
  static TodoId of(BuildContext context) =>
      IdScope.of<TodoId>(context, Ids.todo);
  static IdNav<TodoId> navOf(BuildContext context) =>
      IdScope.navOf<TodoId>(context, Ids.todo);
  static TodoId screenOf(BuildContext context) =>
      IdScope.screenOf<TodoId>(context);
  static TodoId itemOf(BuildContext context) => IdScope.itemOf<TodoId>(context);
}

/// Deictic forward verbs for the `todo` identity —
/// obtain via `TodoID.navOf(context)`; the id is ambient.
extension TodoIdNav on IdNav<TodoId> {
  void go() {
    _Screens.graph.goFrom(screen, _Screens.todo, id);
  }
}
