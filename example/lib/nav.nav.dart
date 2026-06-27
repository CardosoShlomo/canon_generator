// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'nav.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

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
  const Screen._(this.spec);
  final Enum spec;
  String get name => spec.name;
  static const a = Screen<Never>._(_Screens.a);
  static const b = Screen<Never>._(_Screens.b);
  static const c = Screen<Never>._(_Screens.c);
  static const d = Screen<Never>._(_Screens.d);
  static const e = Screen<Never>._(_Screens.e);
  static const f = Screen<Never>._(_Screens.f);
  static const g = Screen<Never>._(_Screens.g);
  static Screen<Object?> _forSpec(Enum spec) => _bySpec[spec]!;

  /// Reactive: is the screen THIS context is under the current foreground
  /// top? Rebuilds only when that flips. The self-vs-current gate —
  /// `if (Screen.isCurrentOf(context)) …` to act only while visible.
  static bool isCurrentOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));
  static const _bySpec = <Enum, Screen<Object?>>{
    BootScreen.root: Screen<Never>._(BootScreen.root),
    _Screens.a: a,
    _Screens.b: b,
    _Screens.c: c,
    _Screens.d: d,
    _Screens.e: e,
    _Screens.f: f,
    _Screens.g: g,
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
  static const _treeSignature = 'a(b(c()),d());e(f(g()))';

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
  static set resolver(void Function(Url? url) fn) =>
      _Screens.graph.setResolver((url) => fn(parseUrl(url)));

  /// The poppable handle if the active top is a non-root placement,
  /// else null (at a scope root). `.at` = current placement; `.pop()`
  /// executes the guaranteed pop and returns the destination.
  static CanPopNav? get canPop =>
      _Screens.graph.currentChain.length > 1 ? const CanPopNav._() : null;

  /// Documented sugar for `canPop?.pop()` — pops the active top if any,
  /// returns where it landed, or null at a root. Never throws.
  static PopDestNav? pop() => canPop?.pop();

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);
  static ANav goA() {
    _Screens.graph.go(_Screens.a);
    return const ANav._();
  }

  static BNav goB() {
    _Screens.graph.go(_Screens.b);
    return const BNav._();
  }

  static CNav goC() {
    _Screens.graph.go(_Screens.c);
    return const CNav._();
  }

  static DNav goD() {
    _Screens.graph.go(_Screens.d);
    return const DNav._();
  }

  static ENav goE() {
    _Screens.graph.go(_Screens.e);
    return const ENav._();
  }

  static FNav goF() {
    _Screens.graph.go(_Screens.f);
    return const FNav._();
  }

  static GNav goG() {
    _Screens.graph.go(_Screens.g);
    return const GNav._();
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
  Widget? get front => _Screens.graph.frontWidget;
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

  ANav goA() {
    _Screens.graph.markReplace();
    return Screen.goA();
  }

  BNav goB() {
    _Screens.graph.markReplace();
    return Screen.goB();
  }

  CNav goC() {
    _Screens.graph.markReplace();
    return Screen.goC();
  }

  DNav goD() {
    _Screens.graph.markReplace();
    return Screen.goD();
  }

  ENav goE() {
    _Screens.graph.markReplace();
    return Screen.goE();
  }

  FNav goF() {
    _Screens.graph.markReplace();
    return Screen.goF();
  }

  GNav goG() {
    _Screens.graph.markReplace();
    return Screen.goG();
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

final class AEntry extends ScreenEntry {
  const AEntry();
}

final class BEntry extends ScreenEntry {
  const BEntry();
}

final class CEntry extends ScreenEntry {
  const CEntry();
}

final class DEntry extends ScreenEntry {
  const DEntry();
}

final class EEntry extends ScreenEntry {
  const EEntry();
}

final class FEntry extends ScreenEntry {
  const FEntry();
}

final class GEntry extends ScreenEntry {
  const GEntry();
}

ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.a => const AEntry(),
  _Screens.b => const BEntry(),
  _Screens.c => const CEntry(),
  _Screens.d => const DEntry(),
  _Screens.e => const EEntry(),
  _Screens.f => const FEntry(),
  _Screens.g => const GEntry(),
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
  static const a = Hop<ANav>._(_Screens.a, null, ANav._());
  static const b = Hop<BNav>._(_Screens.b, null, BNav._());
  static const c = Hop<CNav>._(_Screens.c, null, CNav._());
  static const d = Hop<DNav>._(_Screens.d, null, DNav._());
  static const e = Hop<ENav>._(_Screens.e, null, ENav._());
  static const f = Hop<FNav>._(_Screens.f, null, FNav._());
  static const g = Hop<GNav>._(_Screens.g, null, GNav._());
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
  static OnA get a => OnA._([_Screens.a], [null], const ANav._());
  static OnB get b => OnB._([_Screens.b], [null], const BNav._());
  static On<CNav> get c => On._([_Screens.c], [null], const CNav._());
  static On<DNav> get d => On._([_Screens.d], [null], const DNav._());
  static OnE get e => OnE._([_Screens.e], [null], const ENav._());
  static OnF get f => OnF._([_Screens.f], [null], const FNav._());
  static On<GNav> get g => On._([_Screens.g], [null], const GNav._());
}

final class OnA extends On<ANav> {
  const OnA._(super.specs, super.ids, super.nav) : super._();
  OnB get b => OnB._([...specs, _Screens.b], [...ids, null], const BNav._());
  On<DNav> get d =>
      On._([...specs, _Screens.d], [...ids, null], const DNav._());
}

final class OnB extends On<BNav> {
  const OnB._(super.specs, super.ids, super.nav) : super._();
  On<CNav> get c =>
      On._([...specs, _Screens.c], [...ids, null], const CNav._());
}

final class OnE extends On<ENav> {
  const OnE._(super.specs, super.ids, super.nav) : super._();
  OnF get f => OnF._([...specs, _Screens.f], [...ids, null], const FNav._());
}

final class OnF extends On<FNav> {
  const OnF._(super.specs, super.ids, super.nav) : super._();
  On<GNav> get g =>
      On._([...specs, _Screens.g], [...ids, null], const GNav._());
}

sealed class AnyPlacement extends AnyNav {
  const AnyPlacement._() : super._();
}

AnyPlacement _atOf(Enum s) {
  return switch (s) {
    _Screens.a => const ANav._(),
    _Screens.b => const BNav._(),
    _Screens.c => const CNav._(),
    _Screens.d => const DNav._(),
    _Screens.e => const ENav._(),
    _Screens.f => const FNav._(),
    _Screens.g => const GNav._(),
    BootScreen.root => const Root._(),
    _ => throw StateError('not a _Screens screen'),
  };
}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class CanPopPlacement {}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  CanPopPlacement get at => Screen.current as CanPopPlacement;
  PopDestNav pop() {
    _Screens.graph.pop();
    return const PopDestNav._();
  }
}

final class PopDestNav extends AnyNav {
  const PopDestNav._() : super._();
  PopDestPlacement get at {
    final c = _Screens.graph.currentChain;
    if (_chainIs(c, const [_Screens.a, _Screens.b])) return const BNav._();
    if (_chainIs(c, const [_Screens.e, _Screens.f])) return const FNav._();
    if (_chainIs(c, const [_Screens.a])) return const ANav._();
    if (_chainIs(c, const [_Screens.e])) return const ENav._();
    throw StateError('unresolved PopDestNav: $c');
  }
}

final class ANav extends AnyPlacement implements PopDestPlacement {
  const ANav._() : super._();
  ANav surface() {
    _Screens.graph.popTo(_Screens.a);
    return const ANav._();
  }

  BNav goB() {
    _Screens.graph.popTo(_Screens.a);
    _Screens.graph.go(_Screens.b, null, true);
    return const BNav._();
  }

  DNav goD() {
    _Screens.graph.popTo(_Screens.a);
    _Screens.graph.go(_Screens.d, null, true);
    return const DNav._();
  }

  N go<N extends AnyNav>(AHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class AHop<N extends AnyNav> {
  const AHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const b = AHop<BNav>._(_Screens.b, null, BNav._());
  static const d = AHop<DNav>._(_Screens.d, null, DNav._());
}

final class BNav extends AnyPlacement
    implements CanPopPlacement, PopDestPlacement {
  const BNav._() : super._();
  BNav surface() {
    _Screens.graph.popTo(_Screens.b);
    return const BNav._();
  }

  CNav goC() {
    _Screens.graph.popTo(_Screens.b);
    _Screens.graph.go(_Screens.c, null, true);
    return const CNav._();
  }

  ANav pop() {
    _Screens.graph.pop();
    return const ANav._();
  }
}

final class CNav extends AnyPlacement implements CanPopPlacement {
  const CNav._() : super._();
  CNav surface() {
    _Screens.graph.popTo(_Screens.c);
    return const CNav._();
  }

  BNav pop() {
    _Screens.graph.pop();
    return const BNav._();
  }

  ANav popToA() {
    _Screens.graph.pop(_Screens.a);
    return const ANav._();
  }

  N popTo<N extends AnyNav>(CPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CPop<N extends AnyNav> {
  const CPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const b = CPop<BNav>._(_Screens.b, BNav._());
  static const a = CPop<ANav>._(_Screens.a, ANav._());
}

final class DNav extends AnyPlacement implements CanPopPlacement {
  const DNav._() : super._();
  DNav surface() {
    _Screens.graph.popTo(_Screens.d);
    return const DNav._();
  }

  ANav pop() {
    _Screens.graph.pop();
    return const ANav._();
  }
}

final class ENav extends AnyPlacement implements PopDestPlacement {
  const ENav._() : super._();
  ENav surface() {
    _Screens.graph.popTo(_Screens.e);
    return const ENav._();
  }

  FNav goF() {
    _Screens.graph.popTo(_Screens.e);
    _Screens.graph.go(_Screens.f, null, true);
    return const FNav._();
  }
}

final class FNav extends AnyPlacement
    implements CanPopPlacement, PopDestPlacement {
  const FNav._() : super._();
  FNav surface() {
    _Screens.graph.popTo(_Screens.f);
    return const FNav._();
  }

  GNav goG() {
    _Screens.graph.popTo(_Screens.f);
    _Screens.graph.go(_Screens.g, null, true);
    return const GNav._();
  }

  ENav pop() {
    _Screens.graph.pop();
    return const ENav._();
  }
}

final class GNav extends AnyPlacement implements CanPopPlacement {
  const GNav._() : super._();
  GNav surface() {
    _Screens.graph.popTo(_Screens.g);
    return const GNav._();
  }

  FNav pop() {
    _Screens.graph.pop();
    return const FNav._();
  }

  ENav popToE() {
    _Screens.graph.pop(_Screens.e);
    return const ENav._();
  }

  N popTo<N extends AnyNav>(GPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class GPop<N extends AnyNav> {
  const GPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const f = GPop<FNav>._(_Screens.f, FNav._());
  static const e = GPop<ENav>._(_Screens.e, ENav._());
}

extension ScreenIdOf on BuildContext {
  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));
}

void verifyScreens() {
  assert(() {
    return true;
  }());
}

/// A URL the app understands: a [Place] or a [Link]. Build one with
/// `Url.<route>…` and `.toUri([domain])`; `parseUrl` returns one.
sealed class Url {
  const Url([this.domain]);
  Uri toUri([String? domain]);

  /// The inbound origin (`scheme://host[:port]`) when this came from
  /// `parseUrl` (read it in `Screen.resolver`); null when built locally.
  final String? domain;
  static _WLA get a => _WLA._([_Screens.a], [null]);
  static _WLAB get b => _WLAB._([_Screens.a, _Screens.b], [null, null]);
  static _WLABC get c =>
      _WLABC._([_Screens.a, _Screens.b, _Screens.c], [null, null, null]);
  static _WLAD get d => _WLAD._([_Screens.a, _Screens.d], [null, null]);
  static _WLE get e => _WLE._([_Screens.e], [null]);
  static _WLEF get f => _WLEF._([_Screens.e, _Screens.f], [null, null]);
  static _WLEFG get g =>
      _WLEFG._([_Screens.e, _Screens.f, _Screens.g], [null, null, null]);
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
  static _WLA get a => _WLA._([_Screens.a], [null]);
  static _WLAB get b => _WLAB._([_Screens.a, _Screens.b], [null, null]);
  static _WLABC get c =>
      _WLABC._([_Screens.a, _Screens.b, _Screens.c], [null, null, null]);
  static _WLAD get d => _WLAD._([_Screens.a, _Screens.d], [null, null]);
  static _WLE get e => _WLE._([_Screens.e], [null]);
  static _WLEF get f => _WLEF._([_Screens.e, _Screens.f], [null, null]);
  static _WLEFG get g =>
      _WLEFG._([_Screens.e, _Screens.f, _Screens.g], [null, null, null]);
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
  Uri toUri([String? domain]) =>
      Uri.parse((domain ?? 'https://canon.example') + '/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class _NavPlace extends Place {
  const _NavPlace(this.chain, [super.domain]);
  @override
  final List<(Enum, Object?)> chain;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://canon.example',
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

final class _WLA implements Hop<ANav> {
  const _WLA._(this._s, this._i);
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
  ANav get nav => const ANav._();
  _WLAB get b => _WLAB._([..._s, _Screens.b], [..._i, null]);
  _WLAD get d => _WLAD._([..._s, _Screens.d], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}

final class _WLAB implements Hop<BNav> {
  const _WLAB._(this._s, this._i);
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
  BNav get nav => const BNav._();
  _WLABC get c => _WLABC._([..._s, _Screens.c], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}

final class _WLABC implements Hop<CNav> {
  const _WLABC._(this._s, this._i);
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
  CNav get nav => const CNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}

final class _WLAD implements Hop<DNav> {
  const _WLAD._(this._s, this._i);
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
  DNav get nav => const DNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}

final class _WLE implements Hop<ENav> {
  const _WLE._(this._s, this._i);
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
  ENav get nav => const ENav._();
  _WLEF get f => _WLEF._([..._s, _Screens.f], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}

final class _WLEF implements Hop<FNav> {
  const _WLEF._(this._s, this._i);
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
  FNav get nav => const FNav._();
  _WLEFG get g => _WLEFG._([..._s, _Screens.g], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}

final class _WLEFG implements Hop<GNav> {
  const _WLEFG._(this._s, this._i);
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
  GNav get nav => const GNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://canon.example', _s, _i),
  );
}
