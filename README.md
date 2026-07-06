# canon_generator

Code generator for canon — emits the typed Screen, Hop, and verb surface
from the `@screens` spec, the id extension types from `@IDs`, the tree ops
from `@entities`, and the ledger wiring from `@regents`: memories bound in
row order (row order is traversal order), guard rows judging through a
generated read-only `Stores` facade, and merge edges from the enum's static
`merges` set.

## Build workflow note

Generated types (ids, the `Screen` facade, store globals, the `Stores`
facade) are part of your source's vocabulary, so a spec change can need TWO
passes: run `build_runner`, adjust the hand-written code that referenced the
old shapes, and build again. On a first generation the hand-written
references may not resolve until the builder has run once — that's the
normal bootstrap, not an error in your spec.
