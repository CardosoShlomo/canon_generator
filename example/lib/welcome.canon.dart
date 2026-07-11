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
bool _chainIs(List<Enum> a, List<Enum> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

final class Screen<I> {
  const Screen._(this._spec);
  final Enum _spec;

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

  /// Reactive: is the screen THIS context is under the current foreground
  /// top? Rebuilds only when that flips. The self-vs-current gate —
  /// `if (Screen.isCurrentOf(context)) …` to act only while visible.
  static bool isCurrentOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));
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

  /// The active top screen's QUERY view-state, read-only and
  /// context-free (the headless peer of `Query.of(context, ...)`).
  static Map<String, Object?> get query => _Screens.graph.activeView('q');

  /// The active top screen's FRAGMENT view-state, read-only and
  /// context-free.
  static Map<String, Object?> get fragment => _Screens.graph.activeView('f');
  static const _treeSignature = 'home(todo())';

  /// True when this generated code still matches the live tree.
  /// Assert it in a test to fail CI on a stale (un-regenerated) tree:
  /// `test('nav codegen fresh', () => expect(Screen.isCodegenFresh, true));`
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
  /// `MaterialApp.router(routerDelegate: Screen.manager)`. It owns the
  /// in-memory stack, drives browser back/forward + the URL channel on
  /// web, and system back on mobile. (The placement may change; the name
  /// stays — always pass it where a `RouterDelegate` goes.)
  static NavDelegate get manager {
    assert(_fresh);
    return _Screens.graph.delegate;
  }

  /// A restoration-serializable snapshot of the whole nav state
  /// (no URLs; ids via each screen codec). Persist + [restore] it.
  static Map<String, Object?> snapshot() => _Screens.graph.toState();

  /// Rebuilds the stack from a [snapshot], best-effort. Returns
  /// false on a stale/incompatible snapshot.
  static bool restore(Map<String, Object?> state) =>
      _Screens.graph.restore(state);

  /// Executes a resolved [Hop] — the path a parsed [Place] carries.
  /// This is how a resolver commits an inbound link:
  /// `Screen.resolver = (url) { if (url case Place p) Screen.go(p); };`.
  static N go<N extends AnyNav>(Hop<N> hop) {
    for (final (s, i) in hop.chain) _Screens.graph.go<Object?>(s, i);
    return hop.nav;
  }

  /// If the live stack ends with this selector path (every pinned id and,
  /// for a cyclic terminal, its depth matching), its nav — else null.
  static N? on<N extends AnyNav>(On<N> which) {
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (specs.isEmpty) {
      for (final c in which.conds) {
        if (!c.test(_Screens.graph.viewGet(_Screens.graph.current, c.key)))
          return null;
      }
      return _atOf(_Screens.graph.current) as N;
    }
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    for (final c in which.conds) {
      if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) return null;
    }
    return _atOf(specs.last) as N;
  }

  /// The placement if this selector path is anywhere on the live stack
  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.
  static N? at<N extends AnyNav>(On<N> which) {
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (specs.isEmpty) {
      for (final entry in st) {
        if (which.conds.every(
          (c) => c.test(_Screens.graph.viewGet(entry.screen, c.key)),
        )) {
          return _atOf(entry.screen) as N;
        }
      }
      return null;
    }
    outer:
    for (var e = st.length - 1; e >= specs.length - 1; e--) {
      final off = e - specs.length + 1;
      for (var i = 0; i < specs.length; i++) {
        if (st[off + i].screen != specs[i]) continue outer;
        final wid = which.ids[i];
        if (wid != null && st[off + i].id != wid) continue outer;
      }
      for (final c in which.conds) {
        if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) continue outer;
      }
      return _atOf(specs.last) as N;
    }
    return null;
  }

  /// The placement OWNING [context] (this widget's screen), reactive.
  static AnyPlacement ownerOf(BuildContext context) {
    Placement.isOn(context, ScreenScope.of(context));
    return _atOf(ScreenScope.of(context));
  }

  /// Is the screen owning [context] the current foreground? Reactive.
  static bool isForegroundOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));

  /// Live-stack redirect: the chained verb REPLACES the current history
  /// entry instead of pushing. Decide it at the start —
  /// `Screen.replace.goHome()`, `Screen.replace.on(.user)?.goChat(id)`.
  static const replace = Replace._();

  /// The root (history bottom) controls: `Screen.root.anchor()` keeps the
  /// launch position returnable; `Screen.root.passthrough()` makes it a
  /// throwaway that exits on back.
  static const root = RootControls._();

  /// The current foreground placement (the front), as the sealed
  /// [AnyPlacement] — `switch (Screen.current) { … }` is exhaustive.
  static AnyPlacement get current => _atOf(_Screens.graph.current);

  /// The cold-start link, parsed from the launch URL — read it in the
  /// `root` boot UI to vary the loading screen by destination. Eager:
  /// available from the first build, independent of the Router callback.
  /// Null when the launch URL isn't a representable link.
  static Url? get rootUrl {
    final u =
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName;
    return parseUrl(u);
  }

  /// THE navigation resolver — assign once (ideally in `main` before
  /// `runApp`). Fires with the cold-start link (or null), then on every
  /// deep link — web URL + mobile app-link, one channel. Write plain
  /// `Screen.goX()` / `Screen.replace`. Single, last-wins, never disposed.
  static set resolver(void Function(Url? url) fn) => _Screens.graph.setResolver(
    (url) => fn(parseUrl(url)),
    boot:
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName,
  );

  /// The poppable handle if the active top is a non-root placement,
  /// else null (at a scope root). `.at` = current placement; `.pop()`
  /// executes the guaranteed pop and returns the destination.
  static CanPopNav? get canPop =>
      _Screens.graph.currentChain.length > 1 ? const CanPopNav._() : null;

  /// Documented sugar for `canPop?.pop()` — pops the active top if any,
  /// returns where it landed, or null at a root. Never throws.
  static PopDestPlacement? pop() => canPop?.pop();

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

/// The `Screen.root` facade — controls for the root (the history bottom):
/// whether the launch position is a returnable root or a throwaway that
/// exits on back.
final class RootControls {
  const RootControls._();

  /// Persist the launch/root position as returnable — back returns to it
  /// (then exits), and trunk-switches stack above it.
  void anchor() => _Screens.graph.anchor();

  /// Make the launch/root a throwaway that exits on back (the default).
  void passthrough() => _Screens.graph.passthrough();

  /// On a BARE root the `root` widget renders — read this to branch
  /// (a `sentinel`/`fallthrough` kind), or null while boot-loading.
  FloorKind? get kind => _Screens.graph.rootKind;

  /// The current front screen's widget — `return Screen.root.front` from
  /// the `root` widget to keep showing it on a bare root.
  Widget? get front => _Screens.graph.frontWidget as Widget?;
}

/// The `Screen.replace` redirect facade — every verb mirrors `Screen`
/// but commits as a history REPLACE (web `replaceState`).
final class Replace {
  const Replace._();
  N go<N extends AnyNav>(Hop<N> hop) {
    _Screens.graph.markReplace();
    return Screen.go(hop);
  }

  /// Scoped redirect — replace is decided here, before scoping; a miss
  /// (null) commits nothing, so the pending flag is dropped, not leaked.
  N? on<N extends AnyNav>(On<N> which) {
    _Screens.graph.markReplace();
    return Screen.on(which);
  }

  /// Replace-mode reach: the placement anywhere on the stack, so the
  /// following `surface()` / `goX()` commits as a replace (or, on a miss,
  /// nothing — the flag drops, not leaks).
  N? at<N extends AnyNav>(On<N> which) {
    _Screens.graph.markReplace();
    return Screen.at(which);
  }

  HomeNav goHome() {
    _Screens.graph.markReplace();
    return Screen.goHome();
  }

  TodoNav goTodo(TodoId id) {
    _Screens.graph.markReplace();
    return Screen.goTodo(id);
  }
}

/// One committed navigation as typed [ScreenEntry] stacks.
final class ScreenNavigation {
  ScreenNavigation._(this._n);
  final Navigation _n;
  List<ScreenEntry> get from => [for (final e in _n.from) _entryOf(e.$1, e.$2)];
  List<ScreenEntry> get to => [for (final e in _n.to) _entryOf(e.$1, e.$2)];
  ScreenEntry get source => _entryOf(_n.source.$1, _n.source.$2);
  ScreenEntry get destination => _entryOf(_n.destination.$1, _n.destination.$2);
  NavDirection get direction => _n.direction;
  bool get isForward => _n.isForward;
  bool get isBackward => _n.isBackward;
  bool get isRoundTrip => _n.isRoundTrip;
  bool get isJump => _n.isJump;
}

/// One typed entry per screen — `switch` it for the screen-specific id.
sealed class ScreenEntry {
  const ScreenEntry();
}

final class HomeEntry extends ScreenEntry {
  const HomeEntry();
}

final class TodoEntry extends ScreenEntry {
  const TodoEntry(this.id);
  final TodoId id;
}

ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.home => const HomeEntry(),
  _Screens.todo => TodoEntry(id as TodoId),
  _ => throw StateError('not a _Screens screen'),
};

final class Hop<N extends AnyNav> {
  const Hop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;

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

/// The root/boot placement: `Screen.current` returns it until the first
/// commit. `if (Screen.current case Root()) ...` gates blob-null cold-boot UI.
final class Root extends AnyPlacement {
  const Root._() : super._();
}

final class On<N extends AnyNav> {
  const On._(this.specs, this.ids, this.nav, [this.conds = const []]);
  final List<Enum> specs;
  final List<Object?> ids;

  /// The exact nav for a single-placement terminal; null for a multi-
  /// placement one — `Screen.on` resolves it from the live chain.
  final N? nav;

  /// View-state conditions on the terminal screen (`.query`/`.fragment`).
  final List<ViewCond> conds;
  static OnHome get home =>
      OnHome._([_Screens.home], [null], const HomeNav._());
  static OnTodo get todo =>
      OnTodo._([_Screens.todo], [null], const TodoNav._());
}

final class OnHome extends On<HomeNav> {
  const OnHome._(super.specs, super.ids, super.nav) : super._();
  OnTodo get todo =>
      OnTodo._([...specs, _Screens.todo], [...ids, null], const TodoNav._());
}

final class OnTodo extends On<TodoNav> {
  const OnTodo._(super.specs, super.ids, super.nav) : super._();
  OnTodo call(TodoId id) =>
      OnTodo._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class AnyPlacement extends AnyNav {
  const AnyPlacement._() : super._();
}

AnyPlacement _atOf(Enum s) {
  return switch (s) {
    _Screens.home => const HomeNav._(),
    _Screens.todo => const TodoNav._(),
    BootScreen.root => const Root._(),
    _ => throw StateError('not a _Screens screen'),
  };
}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

PopDestPlacement _resolvePopDest() {
  final c = _Screens.graph.currentChain;
  if (_chainIs(c, const [_Screens.home])) return const HomeNav._();
  throw StateError('unresolved pop destination: $c');
}

final class HomeNav extends AnyPlacement implements PopDestPlacement {
  const HomeNav._() : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  TodoNav goTodo(TodoId id) {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.todo, id, true);
    return const TodoNav._();
  }
}

final class TodoNav extends AnyPlacement {
  const TodoNav._() : super._();
  TodoNav surface() {
    _Screens.graph.popTo(_Screens.todo);
    return const TodoNav._();
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

extension type const ScreenId<I>._(Enum spec) {
  static const todo = ScreenId<TodoId>._(_Screens.todo);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));
}

void verifyScreens() {
  assert(() {
    assert(
      _Screens.home.id == null,
      'home has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.todo.id != null,
      'todo is missing its id codec — rerun build_runner',
    );
    return true;
  }());
}

/// A URL the app understands: a [Place] or a [Link]. Build one with
/// `Url.<route>…` and `.toUri([domain])`; `parseUrl` returns one.
sealed class Url {
  const Url([this.domain]);
  Uri toUri(String domain);

  /// The inbound origin (`scheme://host[:port]`) when this came from
  /// `parseUrl` (read it in `Screen.resolver`); null when built locally.
  final String? domain;
  static _WLHome get home => _WLHome._([_Screens.home], [null]);
  static _WLHomeTodo todo(TodoId id) =>
      _WLHomeTodo._([_Screens.home, _Screens.todo], [null, id]);
}

/// A POSITION in the tree — a screen with a widget to present and a nav
/// destination. Go-able: every `Place` is a [Hop], so `Screen.go(place)`
/// replays its root-down chain and lands the placement. Built root-down
/// (`Place.home.item(id)`); a parsed nav-mirror URL is one.
sealed class Place extends Url implements Hop<AnyNav> {
  const Place([super.domain]);
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
  static _WLHome get home => _WLHome._([_Screens.home], [null]);
  static _WLHomeTodo todo(TodoId id) =>
      _WLHomeTodo._([_Screens.home, _Screens.todo], [null, id]);
}

/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA
/// the resolver interprets. NOT a position — no widget, never navigable.
/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.
sealed class Link extends Url {
  const Link([super.domain]);
}

/// The bare root `/` — a plain app-open (no specific destination).
final class RootUrl extends Url {
  const RootUrl([super.domain]);
  @override
  Uri toUri(String domain) => Uri.parse((domain) + '/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class _NavPlace extends Place {
  const _NavPlace(this.chain, [super.domain]);
  @override
  final List<(Enum, Object?)> chain;
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
  final uri = Uri.parse(url);
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

final class _WLHome implements Hop<HomeNav> {
  const _WLHome._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeNav get nav => const HomeNav._();
  @override
  Screen<Object?> get screen => Screen._forSpec(spec);
  _WLHomeTodo todo(TodoId id) =>
      _WLHomeTodo._([..._s, _Screens.todo], [..._i, id]);
  Uri toUri(String domain) =>
      Uri.parse(_Screens.graph.encodeNavUrl(domain, _s, _i));
}

final class _WLHomeTodo implements Hop<TodoNav> {
  const _WLHomeTodo._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TodoNav get nav => const TodoNav._();
  @override
  Screen<Object?> get screen => Screen._forSpec(spec);
  Uri toUri(String domain) =>
      Uri.parse(_Screens.graph.encodeNavUrl(domain, _s, _i));
}

// ignore_for_file: unused_element
/// The app-wide ledger, built from the `app` regency —
/// the runtime splices its rows in order and wires its merge
/// edges. `Screen.manager` binds the nav side. Reads hang on the
/// row CLASSES (`extension <Row>Reads`) — name your rows with const
/// globals (`const todos = Todos();`) and read `todos.of(context)`.
final ledger = Ledger.root(app);

/// States a fact — dispatch is the ONLY verb, so it needs no prefix.
/// (`ledger.` keeps the rarer surfaces: `on`, `veto`, `guard`, `journal`.)
void dispatch(Msg msg) => ledger.dispatch(msg);
bool _bound = false;

/// The `todo` screen was navigated to (never a render).
class TodoEnteredMsg extends Msg with Identifiable<TodoId> {
  const TodoEnteredMsg(this.id);
  final TodoId id;
}

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

  /// The key SEQUENCE, reactively — structural rebuilds only.
  List<TodoId> of(BuildContext context) => mem.of(context);

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

  /// The key SEQUENCE, reactively — structural rebuilds only.
  List<TodoId> of(BuildContext context) => mem.of(context);

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
    _Screens.graph.popTo(screen);
    _Screens.graph.go(_Screens.todo, id, true);
  }
}
