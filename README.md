# canon_generator

Code generator for canon — emits the typed Screen, Hop, and verb surface
from the `@screens` spec, the id extension types from `@IDs`, and the
ledger wiring from `@regents`: memories bound in row order (row order is
traversal order), guard rows registered at their position, merge edges from
the enum's static `merges` set, a scope-entry FACT per id-keyed screen
(`<Screen>EnteredMsg`, dispatched on committed navigation), and — when the
enum holds a `nav(NavUnit())` row — ledger-owned navigation: verbs route
through the queue, the unit folds, the graph mirrors. Build-time checks
keep the spec honest: every `read(const X())` in a guard must name a
citizen of the enum, and every store's entity must be a row of
`@entities`.

The example is the family's showcase (an ecommerce domain): `welcome.dart`
is the minimal ledger, `showcase.dart` the full surface.

## Build workflow note

Generated types (ids, the `Screen` facade, store globals, the `Stores`
facade) are part of your source's vocabulary, so a spec change can need TWO
passes: run `build_runner`, adjust the hand-written code that referenced the
old shapes, and build again. On a first generation the hand-written
references may not resolve until the builder has run once — that's the
normal bootstrap, not an error in your spec.
