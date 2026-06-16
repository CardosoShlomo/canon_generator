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
