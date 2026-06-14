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
