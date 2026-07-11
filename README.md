# canon_generator

Code generator for canon — emits the typed Screen, Hop, and verb surface
from the `@screens` spec, the id extension types from `@IDs`, and the
data surface from the REGENCY (`@canon const app = Regency({...})`): the
`ledger` global (`Ledger.root(app)` — the RUNTIME splices rows and wires
the merge edges the projections carry) and one READ EXTENSION per row
CLASS. The generator never invents a name — YOU name the rows as const
globals (`const products = Products();`), and the extension makes those
names the whole read surface: `products.of(context)` (reactive),
`products.entities`/`values`/`ids`/`[]` (now), `products.changes`/
`events`/`structure` (streams), `products.item(id, child: …)` and
`products.entityOf(context)` (keyed); units get `state`/`of`, set units
the `containsIdOf` in-flight idiom, and a unit whose state is
`Identifiable<K>` gets the identity reads — `id` and the surgical
`idOf(context)`, which rebuilds only when the id changes, never on field
churn. Guards read the same names: `read(products)`. Rows group into
FEATURES: a named `Regency` subclass grafting a literal
`super({...}, merges: {...})` is read through — its rows get the same
generated surface — while a computed row set stays opaque (a library
brick proves its own laws). Per id-keyed screen it emits a scope-entry
FACT (`<Screen>EnteredMsg extends Msg with Identifiable<K>`, dispatched
on committed navigation) — declare `sealed class <Node>AskMsg` in the
spec library and every entry fact of that identity joins it, so one
hand-written gate judges arrivals exhaustively. When the graph holds a
`NavUnit()` row navigation is ledger-owned: verbs route through the
queue, the unit folds, the graph mirrors. Per id node it emits
the IDENTITY face (`ProductID.of/navOf/screenOf/itemOf/on` — the capital-ID
canon stamp; Flutter consumers only) with deictic verbs on `IdNav<K>`:
`go()` to the self screen, component projections on composites (`goUser`
via `id.user`), REVERSE composite verbs (the other component read from the
live chain), and the claimed handle gated by generated `<Node>On` chain
markers — a chain that evidences nothing about the identity is a compile
error. Every `Hop` (and every navigable `Place`) knows its destination:
`hop.screen` is the total projection, so a tab bar is a list of hops and
one `Screen.go`. `bind()` node-tags every store, so ambient reads resolve
by MATCH, never by distance. Build-time checks keep the spec honest:
every `read(…)` in a guard must name a regent of the graph (a const
construction or a const-global reference), every store's entity must be
a row of `@entities`, and every row's message type must be sealed.

The example is the family's showcase (an ecommerce domain): `welcome.dart`
is the minimal ledger, `showcase.dart` the full surface.

## Build workflow note

Generated types (ids, the `Screen` facade, store globals, the identity
faces) are part of your source's vocabulary, so a spec change can need TWO
passes: run `build_runner`, adjust the hand-written code that referenced the
old shapes, and build again. On a first generation the hand-written
references may not resolve until the builder has run once — that's the
normal bootstrap, not an error in your spec.
