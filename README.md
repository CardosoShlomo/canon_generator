# canon_generator

Code generator for canon — emits the typed Screen, Hop, and verb surface from the spec enum.

## Build workflow note

Generated types (ids, the `Screen` facade, store globals) are part of your
source's vocabulary, so a spec change can need TWO passes: run `build_runner`,
adjust the hand-written code that referenced the old shapes, and build again.
On a first generation the hand-written references may not resolve until the
builder has run once — that's the normal bootstrap, not an error in your spec.
