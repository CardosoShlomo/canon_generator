## 0.34.0

- Scope entry is a FACT: the nav trigger dispatches a generated `<Screen>EnteredMsg` per id-keyed screen; ask/refetch policy is a consumer guard's, `surface` is never consulted.
- The generated `dispatch` wrapper is `dispatch(msg)` — no transit metadata exists.
- A `NavUnit` row wires ledger-owned navigation in `bind()`: verbs route through the queue, the unit folds, the graph mirrors and reseeds. `NavState` is auto-admitted — the engine's entity, never a consumer declaration. A ledger without a nav row gets a build-time hint (local-fold navigation stays a conscious choice).
- canon ^0.28.0, regent ^0.10.0.

## 0.33.0

- Unit-to-unit merge edges in the regents merges set.
- Nav trigger consults `surface(key, row)` — dedupe belongs to an in-flight gate, never the trigger.

## 0.32.0

- Guard binds drop the facade (no generated `Stores`); regent 0.8 `read` wave.
- Build-time read citizenship: every `read(const X())` in an enrolled guard must name a citizen of the regents enum.

## 0.31.0

- `@canon`: one mark for every spec enum, dispatched by node mixin.
- `SegBase` address trees generate typed builder faces; slots read concat (`+`) and union (`|`) codecs.

## 0.30.0

- Tree reader unwraps `fragment.path`; syntactic fallback for unit type args.

## 0.29.1

- Fix: `Screen.manager` binds the ledger under `@regents`; todo welcome + showcase shadow/coverage/merges examples.

## 0.29.0

- `@regents` replaces `@stores`: ordered citizens, guard rows, `from` merges.

## 0.28.0

- Composite ids generate nominal extension types with named component getters (`key.ad`, never `.\$1`).
- Build workflow note documented (two-pass regeneration).

## 0.27.0

- `Screen.resolver` fires at cold start on mobile (boot fallback).

## 0.26.0

- Wire graph merge edges: `row.merge(source, projection)` binds the memories in `bind()`.
- Emit the nav trigger: a committed navigation consults each associated store's `Awaits.surface` on the raw row.
- Emit the top-level `dispatch` verb next to the `ledger` global.
- `Unit`/`UnitMemory` vocabulary (renamed from ValueStore); typed navigation snapshots (`ScreenEntry`, `Screen.navigations`).
- Requires canon ^0.20.0 and regent ^0.1.1.

## 0.25.1

- `pop()` returns the sealed `…Placement`/`PopDestPlacement` directly (resolved internally) — drop the `…PopNav`/`PopDestNav` wrappers and `.at`. Remove the view `.at` accessor too; `Screen.at`/`context.at` are the placement-reach API.

## 0.25.0

- Read `requireAllOf`/`requireOneOf` link query/fragment groups; reject them on screen view-state with a build error (they gate route matching — link branches only). Requires canon ^0.19.0.

## 0.24.1

- Example: restore the full-feature demo tree (parentOf / inherit / view-state / links) and align its tests to the current `Place` / `Link` / `Url` surface.

## 0.24.0

- Parse nav-mirror paths to a go-able `Place`; `parseUrl` returns `Url?` carrying `url.domain` (the inbound origin), and `Screen.go(place)` replays it. Drop `ParsedUrl`. Breaking.
- Single host `Screen.manager` (a `RouterDelegate`); drop `Screen.delegate`, `routerConfig`, and the `MaterialApp(home:)` form. Breaking.
- `Initial`/`base` surface → `Root` (`Screen.root` controls, `Screen.rootUrl`, `BootScreen.root`); grammar `root` → `trunk`. Breaking.

## 0.23.0

- Rename the link surface: `Link` → `Url` (base), `WidgetLink` → `Place` (the navigable `Hop`), `WidgetlessLink` → `Link` (resolver data); `parseLink`/`ParsedLink` → `parseUrl`/`ParsedUrl`; the resolver takes `(Url? url)`. Per-entity markers keep their `…Link` names. **Breaking (rename only).**

## 0.22.0

- `Screen.resolver` — a single, lifetime navigation resolver (`Screen.resolver = (Link? link) {…}`) for every external URL / deep-link plus the cold-start link; `Screen.initialUrl` now reads eagerly for the boot UI. Removes `Screen.observe` (use `Screen.navigations`). **Breaking.**
- `Screen.go(Hop)` / `Screen.replace.go(Hop)` return the Hop's typed nav (`N`), not `KickstartNav` (removed) — a known target stays typed and chains; a dynamic (ternary) Hop's LUB is `AnyNav`, switched exhaustively. **Breaking.**
- A `WidgetLink` is a navigable `Hop`: `Screen.go(WidgetLink.x(id))` lands the full root-down chain and returns its nav (Hop carries a multi-segment `chain`).
- Requires `canon ^0.17.0`.

## 0.21.0

- View-state combinators are now typed: `oneOf({…})` emits a sealed exactly-one `<Screen>QueryChoice` (setter clears siblings); `allOf({…})` emits a co-present record getter (null unless all set) — previously both were flattened to independent keys.
- Drop the unused `conds` parameter from non-view selector steps, clearing `unused_element_parameter` warnings on large grammars.
- Requires `canon ^0.16.0`.

## 0.20.0

- Typed deep-link builders: `Link` / `WidgetLink` / `WidgetlessLink` with `.toUri()`, root-down + kick-start + smart minimal-parent addressing.
- View-state URL chains: `.query({…})` / `.fragment({…})` (On-shape term set) + reactive typed `context.on` / `context.at` reads.
- Placement selectors reworked: `Screen.current` / `on` / `at` / `surface()` over a sealed `AnyPlacement` (exhaustive switching); `Screen.replace.at`, instance `Link.toUri()`.
- Grammar guards: position-specific `.link`, empty `slots({})` and empty `X()` calls rejected; widget-form id leads its union.
- Requires `canon ^0.16.0`.

## 0.19.1

- Widen the canon constraint to `^0.15.0` (matches the 0.19.0 surface).

## 0.19.0

- `Screen.go(Hop)` now returns a `KickstartNav` — `.at` narrows to the exact (single-placement) target it landed on, for an exhaustive switch on a dynamic/ternary kick-start.

## 0.18.0

- Broad reach: a single-placement id screen gets `goX(id)` on every ancestor that can reach it with that one id (id-free intermediates auto-filled); inherit chains flatten to the ultimate id source.

## 0.17.0

- `Screen.manager()` emits restoration on by default (`restorationId` defaults to `'nav'`). Requires canon ^0.14.0.

## 0.16.0

- Emit `Screen.snapshot()` / `Screen.restore(state)` (restoration facade) and `Screen.manager()` (standalone `MaterialApp(home: ...)` host). Requires canon ^0.13.0.

## 0.15.0

- Emit `ScreenId<I>` (id-bearing screens only) + a `context.idOf(.x)` that delegates to canon — typed, non-null id reads; asking the id of an id-free screen no longer compiles. Raw ids are no longer touched in generated consumer code. Requires canon ^0.12.0.

## 0.14.0

- **Id is now a `Codec`, not a `Type`.** A screen declares `name(widget, Codec.uuid)`; the generator reads the verb id type `T` off the codec (records via `Record2Codec`/`Codec<(...)>`), replacing the old Type/sample-value form. `Codec.list` as an id fails the build (use `Codec.csv`).
- Restoration is built into canon at runtime, so no `Restoration` wiring is generated.
- Requires canon ^0.11.0.

## 0.13.0

- **Subtree-enums: split a graph across enums.** The reader follows `graft(Sub.subtree)` into sub-enums to build ONE virtual tree and emits a unified `Screen` surface blind to the split — a grafted screen gets the same `goX` verb as a native one (qualified only by its home enum in emitted values). Requires canon ^0.10.0 (erased engine).
- **Shared screens collapse to their owner.** Same-named screens across enums are one screen: a null-widget ref collapses to the single widget-bearing owner — errors on two owners, a dangling ref, or conflicting id types — and the surface emits one verb at the owner value.
- Emitted runtime types track canon's erasure (`NavGraph<I>`, `pageOf(widget, …)`, `Enum`-keyed maps and switches).

## 0.12.3

- Validate `inherit` id types at build time — mismatched or id-free sources now fail codegen instead of crashing at runtime.

## 0.12.2

- Emit `On`/`OnDepth` forwarding constructors with **super parameters** (`super.specs, super.ids, super.nav`) instead of explicit forwarding, clearing the `use_super_parameters` lint on generated output.

## 0.12.1

- Fix: `parentOf.x` now includes **back-edge** (`.stacked`/`.cycled`) parents, not just forward ones — so e.g. `Screen.on(.parentOf.userProfile)` resolves on a userProfile screen (pushing another via the `.stacked` self-recursion), instead of returning null.

## 0.12.0

- **`InitialScreen` — a typed, dot-shorthand `initial:`.** Emits `sealed class InitialScreen implements InitialScreenBase<_Screens>` with heads mirroring `Screen.goXx` minus `go` (id-free → `static const`, id-bearing/rescue → idMethod) and per-screen subclasses carrying the descent chain, so `NavGraph<_Screens, InitialScreen>(initial: .home.settings.about)` works and seeds the whole stack. Single-placement id-free screens get a direct head; multi-placement targets take the chain to disambiguate. Requires canon ^0.9.0.
- **Fix: inherited children are excluded from the `on` chain** (e.g. `on(.ad(id).editAd())` is no longer generated) — an inherited child is selected directly as `on(.editAd(id))`, so a chained selector can't contradict the shared id.

## 0.11.0

- **`inherit` kick-start rescue.** A single-placement screen whose only id-bearing ancestors are covered by its inherit chain (share its id) now gets a global kick-start verb — `Screen.goEditAd(adId)` builds `…→ad(adId)→editAd(adId)`, stamping the shared id at every level (never a null ancestor id). Such targets get the named `Screen.goX(id)` only, not the Hop/ternary form (the rescue needs a multi-step chain). Note: the inherit source must be non-root (a root seeds an id-less scope).

## 0.10.0

- **id-optional `on` selectors.** An id-bearing screen's selector is now a getter that matches any id — `Screen.on(.ad)?.goEditAd()` — and is callable to pin a specific one — `Screen.on(.ad(adId))`. (The matcher already treated the id as optional; only the selector's type surface required it.) Implemented by making each id-bearing `OnX` step host a `call(id)`; id-bearing leaves now also get an `OnX` class.

## 0.9.0

- **`parentOf` is now disambiguation-only and a shared-capability handle.** It's offered only for screens with **2+ distinct parent screens** (a single-parent screen is just named, e.g. `Screen.on(.ad)?.goEditAd()`). The resolved handle now exposes the **intersection** of all its parents' capabilities: the push to the target, every sibling edge shared by all parents, and `pop()` when all parents are non-root — not just a lone pusher.
- Fix: inherited edges now get their named no-id verb on **union** navs too (previously only on single-placement navs); they remain excluded only from the ternary `go(Hop)` form.

## 0.8.1

- The `parentOf` pusher's verb is now named after its target (`go<Target>`, e.g. `Screen.on(.parentOf.userProfile)?.goUserProfile(id)`) for consistency with every other push verb, instead of a bare `go`.

## 0.8.0

- **`Screen.on(.parentOf.x)?.go(…)` — scope-agnostic push.** Pushes a non-root screen onto whatever scope is currently on top, resolved by membership in `x`'s parent set (null if the current top can't host it). Emitted as a per-screen `XNavParent` standalone pusher reached through an `OnParentOf<XNavParent>` selector. `parentOf` is a holder, not an `On`, so the bare `Screen.on(.parentOf)` is a compile error — committing a target is mandatory.
- **`inherit` support.** Parses `editAd.inherit(ad)` and emits a no-id chained verb (`goEditAd()`) that reads the live ancestor id via a generated `_idOf` helper; inherited edges are excluded from the ternary `go(Hop)` form.
- Requires canon ^0.7.0.

## 0.7.0

- **Breaking: `Screen.goX` is now the single-placement, id-free kick-start only.** A multi-placement (union) screen no longer gets a global verb (the arbitrary "canonical placement" pick is gone) — it's reached by chaining off a handle (`Screen.goTab().goX(id)` / `Screen.on(.x)?.…`), which disambiguates the placement and supplies real ancestor ids. This statically prevents the null-ancestor-id teleport that id-behind/union targets used to produce.
- **Value-witness ids:** the id field accepts a Type literal (`String`), a record-of-Types (`(String, String)`), or a **sample value** whose type is inferred (`0`→int, `('','')`→(String,String), `ChatId(...)`→ChatId). Records need no typedef. Needs an `Object? id` field for the value/record forms.
- Add **`context.screen`** (the widget's enclosing screen) to the generated `BuildContext` extension.
- Fix: shared-widget id-union sealed base is emitted with a `const` constructor.
- Requires canon ^0.6.0.

## 0.6.0

- Add the **global pop surface**. `Screen.canPop` returns a `CanPopNav?` — null iff the active top is a root placement (`currentChain.length > 1`), so it doubles as the back-button visibility gate. `CanPopNav.at` narrows to the current placement, `.pop()` executes the guaranteed pop and returns a `PopDestNav` whose `.at` resolves the destination from the post-pop chain (and exposes any forward verb common to *every* destination). `Screen.pop()` is **documented sugar** for `Screen.canPop?.pop()` — returns the typed destination, never a `bool`, never throws (null at root). Both are tree-gated: a tree with no non-root placement generates neither. Non-root placement navs `implements CanPopPlacement`; pop destinations `implements PopDestPlacement`.
- Surface `Screen.observe((Screen from, Screen to) {...})` — a typed forwarder over `NavGraph.observe`, a side-effect listener fired on each navigation commit (returns a disposer). Requires canon ^0.5.0.
- A widget shared by ≥2 screens with ≥2 distinct id types now gets a generated sealed **id union** + a resolver `Screen.<widget>Id(context)` (e.g. `Screen.chatScreenId(context)` → `ChatScreenId { AdChatId(ChatId) | LoopChatId(String) }`), so an id-ambiguous shared widget resolves its exact `(screen, typed id)` via an **exhaustive** switch instead of an open `(current, currentId)` match.

## 0.5.0

- `Screen.on` is now a **chained suffix selector**: `Screen.on(.home.item(id))?.verb()` addresses a placement by its path in the screen grammar — the same grammar as `go` — instead of by a generated placement-type name. Each chain step narrows the live placement set forward, so only satisfiable child paths are offered (no impossible chain like a child that exists only under a different parent). The bare form (`Screen.on(.item(id))`) is unchanged; per-segment ids pin each segment; a cyclic terminal still exposes `.depth(n)`. The matcher suffix-matches the live stack. Replaces the `On`/`OnId`/`OnCyclic`/`OnIdCyclic` token classes with per-screen step types.
- **Removed `Screen.maybePop`/`maybePopTo`** (and the `Pop` token). A bool-returning "pop if you can" is the unprovable escape that defeats compile-safe navigation. Position-agnostic back (OS gesture, AppBar leading) is handled by the `RouterDelegate` internally; deliberate pops use a typed handle (`Screen.on(.x)?.pop()` / `nav.popToX()`), which the compiler proves reachable.

## 0.4.2

- Cycle bare `pop()` now returns a predecessor-**union** nav whose `.at` narrows to the actual parent (exhaustive `switch (x.pop().at)`), instead of the canonical parent's type which could mislead in a cycle. Reuses a screen's own union when the predecessors are just its placements; chains one more level (`.pop().pop()`) when the grandparents resolve unambiguously.

## 0.4.1

- Fix: single-placement cyclic screens now get the full cycle surface (depth getter, self-pop, cycle-member `popToX`) — the single-placement fast path previously bypassed it; only multi-placement screens were covered. Add generator golden tests.

## 0.4.0

- Emit chainable self-pop: cycle-member `popToXx` (including the screen itself) is now on union navs too, so `popToProfile().popToProfile()` keeps a handle that still exposes the cycle pops. Emit `_endsWith` only when a `.under` actually uses it. Require canon ^0.4.0.

## 0.3.0

- Emit the cycle navigation surface: the `On`/`OnId`/`OnCyclic`/`OnIdCyclic`/`OnDepth` one-shot token machine with `.depth(n)`, a `depth` getter on cyclic nav handles, and throwing cycle-member `popToX` verbs. Require canon ^0.3.0.

## 0.2.1

- Emit edge-required handle verbs (`goX`/`go(Hop)` pass `edgeRequired`), replacing the debug-only stale assert; guaranteed pops now throw via the engine. Require canon ^0.2.1.

## 0.2.0

- Emit the stale-codegen guard (`Screen.isCodegenFresh` + boot-time assert).
- Recognize the `cycled`/`stacked` back-edges (replacing `again`).
- Require canon ^0.2.0.

## 0.1.2

- Require canon ^0.1.0.

## 0.1.1

- Lint fix.

## 0.1.0

- Initial release.
