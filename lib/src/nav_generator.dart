import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// Deep import keeps the builder flutter-free: only this file is compiled,
// not canon's flutter-dependent umbrella.
// ignore: implementation_imports
import 'package:canon/src/screens_annotation.dart';

import 'tree_reader.dart';

class _Row {
  _Row(this.name, this.idType);

  final String name;
  final String? idType;
}

bool _hasValueEquality(DartType t) {
  if (t is RecordType) return true;
  if (t is! InterfaceType) return false;
  final element = t.element;
  if (element is EnumElement) return true;
  if (t.isDartCoreString || t.isDartCoreInt || t.isDartCoreDouble || t.isDartCoreBool || t.isDartCoreNum) {
    return true;
  }
  if (element.getMethod('==') != null) return true;
  return element.allSupertypes
      .any((s) => !s.isDartCoreObject && s.element.getMethod('==') != null);
}

String _cap(String s) => s[0].toUpperCase() + s.substring(1);

class NavGenerator extends GeneratorForAnnotation<Screens> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@screens must annotate an enum', element: element);
    }
    final spec = element.name;
    if (spec == null || !spec.startsWith('_')) {
      throw InvalidGenerationSourceError('the @screens enum must be library-private', element: element);
    }

    final rows = <_Row>[];
    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final value = field.computeConstantValue();
      final idType = value?.getField('id')?.toTypeValue();
      if (idType != null && !_hasValueEquality(idType)) {
        log.warning(
            'id type ${idType.getDisplayString()} of "${field.name}" compares by '
            'identity — repeat-collapse and prefix reuse fire only when two id '
            'instances are equal, so for this screen they apply to identical '
            'instances only; override == and hashCode for value semantics');
      }
      rows.add(_Row(field.name!, idType?.getDisplayString()));
    }
    final idOf = {for (final r in rows) r.name: r.idType};

    final tree = await readTree(element, buildStep, {for (final r in rows) r.name});
    final placements = {for (final r in rows) r.name: <PlacementNode>[]};
    final againEdges = <PlacementNode>[];
    void collect(PlacementNode n) {
      if (n.again != null) {
        againEdges.add(n);
        return;
      }
      placements[n.screen]!.add(n);
      n.children.forEach(collect);
    }

    tree.forEach(collect);

    // Preserved scope roots — the only screens reset() can target.
    final kept = [for (final root in tree) if (root.keep) root.screen];

    // Cycle membership: each back-edge forms a cycle from its target down to its
    // parent. Every screen on that path can recur.
    final cycles = <Set<String>>[];
    for (final ae in againEdges) {
      final members = <String>{};
      for (PlacementNode? p = ae.parent; p != null; p = p.parent) {
        members.add(p.screen);
        if (identical(p, ae.again)) break;
      }
      cycles.add(members);
    }
    // Screens that can recur — the only ones whose `on` token exposes `.depth(n)`
    // and whose nav exposes a `depth` getter.
    final cyclic = {for (final c in cycles) ...c};
    // The OTHER members of any cycle a screen is in — its throwing cycle-pop
    // targets (throws if not currently below; guard with a depth check).
    Set<String> cycleMembers(String screen) =>
        {for (final c in cycles) if (c.contains(screen)) ...c};

    // Predecessor placements a screen can sit directly on top of: its canonical
    // parent plus any node a back-edge to it lives under. >1 means a cycle can
    // reveal different parents on pop, so bare pop() resolves the actual one.
    final backPreds = <String, List<PlacementNode>>{};
    for (final ae in againEdges) {
      final p = ae.parent;
      if (p != null) (backPreds[ae.screen] ??= []).add(p);
    }
    List<PlacementNode> predecessorsOf(PlacementNode n) {
      final out = <PlacementNode>[];
      final seen = <String>{};
      for (final p in [if (n.parent != null) n.parent!, ...?backPreds[n.screen]]) {
        if (seen.add(p.path.join('/'))) out.add(p);
      }
      // Longest path first so a shorter suffix can't shadow a deeper match.
      out.sort((a, b) => b.path.length.compareTo(a.path.length));
      return out;
    }

    // Canonical tree encoding — must match NavSpec.structureSignature exactly.
    // A mismatch at runtime means the tree was edited without regenerating.
    String sig(PlacementNode n) {
      final kids = [for (final c in n.children) sig(c)]..sort();
      final flags = '${n.keep ? 'K' : ''}${n.again != null ? 'A' : ''}';
      return '${n.screen}$flags(${kids.join(',')})';
    }

    final treeSignature = ([for (final r in tree) sig(r)]..sort()).join(';');

    bool isSingle(String screen) => placements[screen]!.length <= 1;
    String unionName(String s) => '${_cap(s)}Nav';
    String placementName(PlacementNode n) =>
        isSingle(n.screen) ? unionName(n.screen) : '${n.path.map(_cap).join()}Nav';
    String childType(PlacementNode c) =>
        c.again != null ? placementName(c.again!) : placementName(c);

    // Pop-union registry: a placement with >1 possible predecessor pops into a
    // union nav whose `.at` narrows to the actual parent (exhaustive switch). A
    // screen's own union is reused when the predecessors are just its placements.
    final unions = <String, ({String nav, String marker, List<PlacementNode> members})>{};
    final popReturnOf = <String, String>{}; // cyclic placement nav -> pop() return type
    final crossImpl = <String, Set<String>>{}; // nav -> pop-placement markers it implements
    String stemOf(PlacementNode m) {
      final pn = placementName(m);
      return pn.substring(0, pn.length - 3);
    }
    String? unionFor(List<PlacementNode> ms) {
      if (ms.isEmpty) return null;
      if (ms.length == 1) return placementName(ms.single);
      if (ms.map((m) => m.screen).toSet().length == 1) return unionName(ms.first.screen);
      final base = (ms.map(stemOf).toList()..sort()).join();
      return unions
          .putIfAbsent(base, () {
            final marker = '${base}PopPlacement';
            for (final m in ms) {
              (crossImpl[placementName(m)] ??= {}).add(marker);
            }
            return (nav: '${base}PopNav', marker: marker, members: ms);
          })
          .nav;
    }
    for (final r in rows) {
      for (final n in placements[r.name]!) {
        final preds = predecessorsOf(n);
        if (preds.length > 1) popReturnOf[placementName(n)] = unionFor(preds)!;
      }
    }

    // Canonical ancestors — always in the live chain at this placement, so popTo
    // them can't fail. Cycle members are merged into the pops map separately (at
    // the navClass call sites) as throwing pops; see cycleMembers.
    Map<String, String> ancestorsOf(PlacementNode n) =>
        {for (final a in n.ancestors) a.screen: placementName(a)};

    // The global teleport (Screen.go / Hop) may only target a screen whose
    // CANONICAL chain has no id-bearing ancestor — else the rebuild would have
    // to fabricate that ancestor's id (the null-id bug). Screens behind an id
    // wall are reached by chaining a forward edge from the nearest id-safe
    // ancestor, so the wall's id is always supplied, never skipped.
    bool globalSafe(String screen) {
      final ps = placements[screen]!;
      if (ps.isEmpty) return false;
      return ps.first.ancestors.every((a) => idOf[a.screen] == null);
    }

    // A position-anchored handle (non-null path) navigates edge-required: the
    // target must be a live edge from the current top or graph.go throws (a
    // stale handle), never a silent canonical teleport. Stale-but-still-legal
    // resolves. Entry-point navs (null path) stay total (canonical allowed).
    String goVerb(String child, String returns, [List<String>? path]) {
      final idT = idOf[child];
      final params = idT == null ? '' : '$idT id';
      final call = path != null
          ? '$spec.graph.go($spec.$child, ${idT == null ? 'null' : 'id'}, true)'
          : '$spec.graph.go($spec.$child${idT == null ? '' : ', id'})';
      return '  $returns go${_cap(child)}($params) {\n'
          '    $call;\n'
          '    return const $returns._();\n'
          '  }';
    }

    // One verb per child screen; placement tiers resolve the return type
    // exactly, union tiers by screen.
    List<String> goVerbs(Iterable<PlacementNode> children,
        String Function(PlacementNode) type, [List<String>? path]) {
      final byChild = <String, String>{};
      for (final c in children) {
        byChild[c.screen] = type(c);
      }
      return [for (final e in byChild.entries) goVerb(e.key, e.value, path)];
    }

    final b = StringBuffer();

    // Emits a nav class. A nav always extends AnyNav; the empty sealed
    // switch-markers it's a case of are listed via implements. Pops: ancestor
    // popToX never fails (always in the chain); cycle-member popToX (incl. self,
    // the previous occurrence) throws when not currently below — guard with the
    // depth check. Unprovable pops still go through the global Screen.maybePopTo.
    // bare pop(): with one predecessor it returns that parent's nav. In a cycle
    // (multiple possible predecessors) it returns AnyNav, resolving the ACTUAL
    // one from the post-pop chain — pattern-match it (case HomeNav / case ChatNav)
    // instead of trusting a single canonical-parent type.
    void navClass(String className, List<String> verbs,
        {Map<String, String> pops = const {},
        Map<String, String> edges = const {},
        String? parentScreen,
        List<String> markers = const [],
        String? extra,
        List<String>? path}) {
      final allMarkers = [...markers, ...?crossImpl[className]];
      final impl = allMarkers.isEmpty ? '' : ' implements ${allMarkers.join(', ')}';
      final stem = className.substring(0, className.length - 3);
      final popName = '${stem}Pop';
      final hopName = '${stem}Hop';
      b.writeln('final class $className extends AnyNav$impl {');
      b.writeln('  const $className._() : super._();');
      if (extra != null) b.writeln(extra);
      verbs.forEach(b.writeln);
      // 0 edges → no go. 1 edge → just the named goXx (in verbs). 2+ → a typed,
      // edge-gated, ternary-capable go(Hop<N>) alongside the named verbs.
      if (edges.length >= 2) {
        final hopCall = path != null
            ? '$spec.graph.go(hop.spec, hop.id, true)'
            : '$spec.graph.go(hop.spec, hop.id)';
        b.writeln('  N go<N extends AnyNav>($hopName<N> hop) {');
        b.writeln('    $hopCall;');
        b.writeln('    return hop.nav;');
        b.writeln('  }');
      }
      final popUnion = popReturnOf[className];
      if (popUnion != null) {
        // Cycle: pop() returns the predecessor-union nav; narrow via its `.at`.
        b.writeln('  $popUnion pop() {');
        b.writeln('    $spec.graph.pop();');
        b.writeln('    return const $popUnion._();');
        b.writeln('  }');
      } else if (parentScreen != null) {
        final ret = unionName(parentScreen);
        b.writeln('  $ret pop() {');
        b.writeln('    $spec.graph.pop();');
        b.writeln('    return const $ret._();');
        b.writeln('  }');
      }
      // Named popToXx for the DEEPER ancestors (the immediate parent is bare
      // pop(), its abbreviation — skipped here). Mirrors named goXx; the token
      // popTo(Pop<N>) below covers the same set plus ternary.
      for (final e in pops.entries) {
        if (e.key == parentScreen) continue;
        b.writeln('  ${e.value} popTo${_cap(e.key)}() {');
        b.writeln('    $spec.graph.pop($spec.${e.key});');
        b.writeln('    return const ${e.value}._();');
        b.writeln('  }');
      }
      // 0 ancestors (root) → no popTo. 1 ancestor → it's the immediate parent,
      // covered by pop(). 2+ → a typed, gated, ternary-capable popTo(Pop<N>):
      // popTo(.x) returns the exact ancestor nav, popTo(a ? .x : .y) the LUB.
      if (pops.length >= 2) {
        b.writeln('  N popTo<N extends AnyNav>($popName<N> to) {');
        b.writeln('    $spec.graph.pop(to.spec);');
        b.writeln('    return to.nav;');
        b.writeln('  }');
      }
      b.writeln('}');
      if (pops.length >= 2) {
        b.writeln('final class $popName<N extends AnyNav> {');
        b.writeln('  const $popName._(this.spec, this.nav);');
        b.writeln('  final $spec spec;');
        b.writeln('  final N nav;');
        for (final e in pops.entries) {
          b.writeln('  static const ${e.key} = $popName<${e.value}>._($spec.${e.key}, ${e.value}._());');
        }
        b.writeln('}');
      }
      if (edges.length >= 2) {
        b.writeln('final class $hopName<N extends AnyNav> {');
        b.writeln('  const $hopName._(this.spec, this.id, this.nav);');
        b.writeln('  final $spec spec;');
        b.writeln('  final Object? id;');
        b.writeln('  final N nav;');
        for (final e in edges.entries) {
          final idT = idOf[e.key];
          if (idT == null) {
            b.writeln('  static const ${e.key} = $hopName<${e.value}>._($spec.${e.key}, null, ${e.value}._());');
          } else {
            b.writeln('  static $hopName<${e.value}> ${e.key}($idT id) => $hopName._($spec.${e.key}, id, const ${e.value}._());');
          }
        }
        b.writeln('}');
      }
    }

    final hasMulti = rows.any((r) => !isSingle(r.name));
    // Pop targets for the dynamic global maybePopTo — only screens something
    // can stand on top of (a childless screen is never a legal pop target).
    final popable = [
      for (final r in rows)
        if (placements[r.name]!.any((n) => n.children.isNotEmpty)) r.name
    ];

    b.writeln('// ignore_for_file: library_private_types_in_public_api');
    if (hasMulti) {
      b.writeln('bool _chainIs(List<$spec> a, List<$spec> b) {');
      b.writeln('  if (a.length != b.length) return false;');
      b.writeln('  for (var i = 0; i < a.length; i++) {');
      b.writeln('    if (a[i] != b[i]) return false;');
      b.writeln('  }');
      b.writeln('  return true;');
      b.writeln('}');
    }
    // `_endsWith` is only used by `.under` narrowing; emit it at the end iff a
    // `.under` actually referenced it (avoids an unused_element warning).
    var usesEndsWith = false;
    b.writeln('final class Screen<I> {');
    b.writeln('  const Screen._(this.spec);');
    b.writeln('  final $spec spec;');
    b.writeln('  String get name => spec.name;');
    for (final r in rows) {
      b.writeln('  static const ${r.name} = Screen<${r.idType ?? 'Never'}>._($spec.${r.name});');
    }
    b.writeln('  static Screen<Object?> of($spec spec) => _bySpec[spec]!;');
    b.writeln('  static const _bySpec = <$spec, Screen<Object?>>{');
    for (final r in rows) {
      b.writeln('    $spec.${r.name}: ${r.name},');
    }
    b.writeln('  };');
    b.writeln('  /// The live active stack as wrappers: .current/.currentId/.tab/');
    b.writeln('  /// .screens/.reachable, extensible without touching Screen.');
    b.writeln('  static NavStack<Screen<Object?>> get stack => NavStack([');
    b.writeln('    for (final e in $spec.graph.stack) NavEntry(of(e.screen), e.id),');
    b.writeln('  ]);');
    b.writeln("  static const _treeSignature = '$treeSignature';");
    b.writeln('  /// True when this generated code still matches the live tree.');
    b.writeln('  /// Assert it in a test to fail CI on a stale (un-regenerated) tree:');
    b.writeln("  /// `test('nav codegen fresh', () => expect(Screen.isCodegenFresh, true));`");
    b.writeln('  static bool get isCodegenFresh =>');
    b.writeln('      $spec.graph.structureSignature == _treeSignature;');
    b.writeln('  static final bool _fresh = () {');
    b.writeln('    assert(isCodegenFresh,');
    b.writeln("        'canon: the navigation tree changed but generated code is stale — run build_runner.');");
    b.writeln('    return true;');
    b.writeln('  }();');
    b.writeln('  static NavDelegate<$spec> get delegate {');
    b.writeln('    assert(_fresh);');
    b.writeln('    return $spec.graph.delegate;');
    b.writeln('  }');
    b.writeln('  static N go<N extends AnyNav>(Hop<N> hop) {');
    b.writeln('    $spec.graph.go(hop.spec, hop.id);');
    b.writeln('    return hop.nav;');
    b.writeln('  }');
    b.writeln('  /// If the live top is this screen, its nav handle (navigate from the');
    b.writeln('  /// current position, reusing the live ancestor ids) — else null.');
    final depthClause = cyclic.isEmpty
        ? ''
        : '&&\n              (which is! OnDepth || $spec.graph.countOf(which.spec, which.id) == (which as OnDepth).depth)';
    b.writeln('  static N? on<N extends AnyNav>(On<N> which) =>');
    b.writeln('      $spec.graph.current == which.spec &&');
    b.writeln('              (which.id == null || $spec.graph.stack.last.id == which.id)$depthClause');
    b.writeln('          ? which.nav');
    b.writeln('          : null;');
    b.writeln('  /// The current EXACT placement nav — pattern-match it:');
    b.writeln('  /// `if (Screen.at case HomeUserProfileNav n) ...`.');
    b.writeln('  static AnyNav get at => switch ($spec.graph.current) {');
    for (final r in rows) {
      final n = unionName(r.name);
      b.writeln(isSingle(r.name)
          ? '        $spec.${r.name} => const $n._(),'
          : '        $spec.${r.name} => (const $n._()).at as AnyNav,');
    }
    b.writeln('      };');
    b.writeln('  static bool maybePop() => $spec.graph.maybePop();');
    if (popable.isNotEmpty) {
      b.writeln('  static bool maybePopTo(Pop to) => $spec.graph.maybePop(to.spec);');
    }
    if (kept.isNotEmpty) {
      b.writeln('  static void reset(Keep scope) => $spec.graph.reset(scope.spec);');
    }
    for (final r in rows) {
      if (!globalSafe(r.name)) continue; // id-behind targets: reach via chaining
      b.writeln('  static ${goVerb(r.name, unionName(r.name)).trim()}');
    }
    b.writeln('}');

    b.writeln('final class Hop<N extends AnyNav> {');
    b.writeln('  const Hop._(this.spec, this.id, this.nav);');
    b.writeln('  final $spec spec;');
    b.writeln('  final Object? id;');
    b.writeln('  final N nav;');
    for (final r in rows) {
      if (!globalSafe(r.name)) continue; // id-behind targets: reach via chaining
      final n = unionName(r.name);
      if (r.idType == null) {
        b.writeln('  static const ${r.name} = Hop<$n>._($spec.${r.name}, null, $n._());');
      } else {
        b.writeln('  static Hop<$n> ${r.name}(${r.idType} id) => Hop._($spec.${r.name}, id, const $n._());');
      }
    }
    b.writeln('}');

    // Screen.on(.x) token: a one-shot refinement machine, cleanly split so no
    // class carries both a depth METHOD and a depth FIELD.
    //   On       — bare position (spec, id, nav). No depth. Screen.on takes On<N>.
    //   OnId     — non-cyclic id: call(id) -> On.
    //   OnCyclic — cyclic, depth-CAPABLE (the method): depth(n) -> OnDepth.
    //   OnIdCyclic — cyclic id: call(id) -> OnCyclic, depth(n) -> OnDepth.
    //   OnDepth  — terminal, carries the depth FIELD. No methods.
    // Cyclic variants exist only for back-edge screens, so `.depth` is a compile
    // error elsewhere. Legal paths: .x -> .x(id) -> .depth(n), or .x -> .depth(n).
    b.writeln('final class On<N extends AnyNav> {');
    b.writeln('  const On._(this.spec, this.id, this.nav);');
    b.writeln('  final $spec spec;');
    b.writeln('  final Object? id;');
    b.writeln('  final N nav;');
    for (final r in rows) {
      final n = unionName(r.name);
      final isCyclic = cyclic.contains(r.name);
      if (r.idType == null && isCyclic) {
        b.writeln('  static const ${r.name} = OnCyclic<$n>._($spec.${r.name}, null, $n._());');
      } else if (r.idType == null) {
        b.writeln('  static const ${r.name} = On<$n>._($spec.${r.name}, null, $n._());');
      } else if (isCyclic) {
        b.writeln('  static const ${r.name} = OnIdCyclic<$n, ${r.idType}>._($spec.${r.name}, $n._());');
      } else {
        b.writeln('  static const ${r.name} = OnId<$n, ${r.idType}>._($spec.${r.name}, $n._());');
      }
    }
    b.writeln('}');
    b.writeln('final class OnId<N extends AnyNav, I> extends On<N> {');
    b.writeln('  const OnId._($spec s, N n) : super._(s, null, n);');
    b.writeln('  On<N> call(I id) => On._(spec, id, nav);');
    b.writeln('}');
    if (cyclic.isNotEmpty) {
      // Terminal: the only token with a depth field; on() reads it.
      b.writeln('final class OnDepth<N extends AnyNav> extends On<N> {');
      b.writeln('  const OnDepth._($spec s, Object? i, this.depth, N n) : super._(s, i, n);');
      b.writeln('  final int depth;');
      b.writeln('}');
      // Depth-capable: the only token with a depth method (cyclic const, or after
      // an id is set). Needed whenever any screen is cyclic.
      b.writeln('final class OnCyclic<N extends AnyNav> extends On<N> {');
      b.writeln('  const OnCyclic._($spec s, Object? i, N n) : super._(s, i, n);');
      b.writeln('  OnDepth<N> depth(int d) => OnDepth._(spec, id, d, nav);');
      b.writeln('}');
    }
    if (cyclic.any((s) => idOf[s] != null)) {
      b.writeln('final class OnIdCyclic<N extends AnyNav, I> extends On<N> {');
      b.writeln('  const OnIdCyclic._($spec s, N n) : super._(s, null, n);');
      b.writeln('  OnCyclic<N> call(I id) => OnCyclic._(spec, id, nav);');
      b.writeln('  OnDepth<N> depth(int d) => OnDepth._(spec, null, d, nav);');
      b.writeln('}');
    }

    // Instances carry only their own edge-gated go(Hop); jump-to-anywhere is
    // the static Screen.go, so a leaf nav cannot go nowhere by inheritance.
    b.writeln('abstract base class AnyNav {');
    b.writeln('  const AnyNav._();');
    b.writeln('}');

    // Cycle pop-union navs: bare pop() into a cycle returns one of these; its
    // `.at` resolves the actual predecessor (a sealed marker the predecessor navs
    // implement → exhaustive switch). It also pops one more level when the
    // grandparents resolve unambiguously, so `.pop().pop()` chains.
    for (final u in unions.values) {
      b.writeln('sealed class ${u.marker} {}');
      b.writeln('final class ${u.nav} extends AnyNav {');
      b.writeln('  const ${u.nav}._() : super._();');
      final parents = [for (final m in u.members) if (m.parent != null) m.parent!];
      if (parents.length == u.members.length) {
        String? gp;
        if (parents.length == 1) {
          gp = placementName(parents.single);
        } else if (parents.map((p) => p.screen).toSet().length == 1) {
          gp = unionName(parents.first.screen);
        }
        if (gp != null) {
          b.writeln('  $gp pop() { $spec.graph.pop(); return const $gp._(); }');
        }
      }
      usesEndsWith = true;
      b.writeln('  ${u.marker} get at {');
      b.writeln('    final c = $spec.graph.currentChain;');
      final sorted = [...u.members]..sort((a, b) => b.path.length.compareTo(a.path.length));
      for (final m in sorted) {
        final lits = m.path.map((s) => '$spec.$s').join(', ');
        b.writeln('    if (_endsWith(c, const [$lits])) return const ${placementName(m)}._();');
      }
      b.writeln("    throw StateError('unresolved ${u.nav}: \$c');");
      b.writeln('  }');
      b.writeln('}');
    }

    // The dynamic-pop token: bool-returning maybePopTo doesn't chain, so no
    // per-constant type is needed — an enum is the leanest form with no loss.
    if (popable.isNotEmpty) {
      b.writeln('enum Pop {');
      b.writeln('  ${[for (final name in popable) '$name($spec.$name)'].join(', ')};');
      b.writeln('  const Pop(this.spec);');
      b.writeln('  final $spec spec;');
      b.writeln('}');
    }

    // reset()'s gated target table: only preserved scope roots have a parked
    // stack worth collapsing (unkept scopes reseed themselves on leave).
    if (kept.isNotEmpty) {
      b.writeln('final class Keep {');
      b.writeln('  const Keep._(this.spec);');
      b.writeln('  final $spec spec;');
      for (final name in kept) {
        b.writeln('  static const $name = Keep._($spec.$name);');
      }
      b.writeln('}');
    }

    for (final r in rows) {
      final nodes = placements[r.name]!;
      if (isSingle(r.name)) {
        // One class, exact edges (union == placement).
        final n = nodes.isEmpty ? null : nodes.first;
        final anc = n == null ? const <String, String>{} : ancestorsOf(n);
        navClass(
          unionName(r.name),
          n == null ? const [] : goVerbs(n.children, childType, n.path),
          pops: {
            ...anc,
            // Cycle members (incl. self) as throwing pops; see leaf loop below.
            for (final m in cycleMembers(r.name))
              if (!anc.containsKey(m)) m: unionName(m),
          },
          edges: n == null ? const {} : {for (final c in n.children) c.screen: childType(c)},
          parentScreen: n?.parent?.screen,
          path: n?.path,
          extra: cyclic.contains(r.name)
              ? '  int get depth => $spec.graph.countOf($spec.${r.name});'
              : null,
        );
        continue;
      }

      // Multi-placement: a recursive narrowing trie. The phantom carries the
      // global intersection; `.placement` flat-resolves to a leaf; `.under`
      // (emitted only where it differs — a subgroup is itself a partial) steps
      // one ancestor outward into partials/leaves. Empty sealed markers (always
      // implemented, never extended) are the switch targets; every nav carries
      // its FULL level actions (re-providing the shared ones for completeness).

      // Shared (intersection) forward verbs / pop targets over a placement group.
      Set<String> sharedFwd(List<PlacementNode> group) => [
            for (final n in group) {for (final c in n.children) c.screen}
          ].reduce((a, b) => a.intersection(b));
      List<String> sharedVerbs(List<PlacementNode> group, List<String> path) {
        final fwdShared = sharedFwd(group);
        final seen = <String>{};
        return [
          for (final n in group)
            for (final c in n.children)
              if (fwdShared.contains(c.screen) && seen.add(c.screen))
                goVerb(c.screen, unionName(c.screen), path)
        ];
      }
      // Edge-gated go over the group's shared (intersection) forward edges.
      Map<String, String> sharedEdges(List<PlacementNode> group) =>
          {for (final s in sharedFwd(group)) s: unionName(s)};
      // Guaranteed pops common to the whole group: a screen that's an ancestor
      // of every placement is always in the live chain regardless of which one
      // you're at. Union-typed where the ancestor itself is multi-placement.
      Map<String, String> sharedPops(List<PlacementNode> group) {
        final per = [for (final n in group) ancestorsOf(n)];
        final common =
            per.map((m) => m.keys.toSet()).reduce((a, b) => a.intersection(b));
        final pops = <String, String>{};
        for (final m in per) {
          for (final e in m.entries) {
            if (!common.contains(e.key)) continue;
            final prev = pops[e.key];
            pops[e.key] =
                (prev == null || prev == e.value) ? e.value : unionName(e.key);
          }
        }
        return pops;
      }

      final leafMarkers = {for (final n in nodes) n: <String>{}};
      final markersToEmit = <String>{};

      // Emits the nav for a group (suffixLen ancestors pinned), records the
      // markers its leaves implement, recurses for `.under`. Returns its type.
      String walk(List<PlacementNode> group, int suffixLen, List<String> impl) {
        if (group.length == 1) {
          leafMarkers[group.single]!.addAll(impl);
          return placementName(group.single);
        }
        final suffix =
            group.first.path.sublist(group.first.path.length - suffixLen);
        final navName =
            suffixLen == 1 ? unionName(r.name) : '${suffix.map(_cap).join()}Nav';
        final stem = navName.substring(0, navName.length - 3);

        // .placement — flat to this group's leaves.
        final placementMarker = '${stem}Placement';
        markersToEmit.add(placementMarker);
        for (final n in group) {
          leafMarkers[n]!.add(placementMarker);
        }
        final pg = StringBuffer();
        pg.writeln('  $placementMarker get at {');
        pg.writeln('    final c = $spec.graph.currentChain;');
        for (final n in group) {
          final p = n.path.map((s) => '$spec.$s').join(', ');
          pg.writeln('    if (_chainIs(c, const [$p])) return const ${placementName(n)}._();');
        }
        pg.writeln("    throw StateError('unresolved ${r.name} placement: \$c');");
        pg.write('  }');

        // .under — one step outward, grouped by next ancestor.
        final subgroups = <String?, List<PlacementNode>>{};
        for (final n in group) {
          final i = n.path.length - 1 - suffixLen;
          subgroups.putIfAbsent(i >= 0 ? n.path[i] : null, () => []).add(n);
        }
        final pgUnder = StringBuffer();
        if (subgroups.values.any((g) => g.length > 1)) {
          final underMarker = '${stem}Under';
          markersToEmit.add(underMarker);
          pgUnder.writeln('  $underMarker get under {');
          pgUnder.writeln('    final c = $spec.graph.currentChain;');
          for (final sub in subgroups.values) {
            final subType = walk(sub, suffixLen + 1, [underMarker]);
            final subSuffix = sub.first.path
                .sublist(sub.first.path.length - (suffixLen + 1))
                .map((s) => '$spec.$s')
                .join(', ');
            usesEndsWith = true;
            pgUnder.writeln('    if (_endsWith(c, const [$subSuffix])) return const $subType._();');
          }
          pgUnder.writeln("    throw StateError('unresolved ${r.name} under: \$c');");
          pgUnder.write('  }');
        }

        var extra = pgUnder.isEmpty ? pg.toString() : '$pg\n$pgUnder';
        if (cyclic.contains(r.name)) {
          extra = '$extra\n  int get depth => $spec.graph.countOf($spec.${r.name});';
        }
        final sp = sharedPops(group);
        navClass(navName, sharedVerbs(group, suffix),
            // Cycle members (incl. self) so chains like popToProfile().popToProfile()
            // keep returning a handle that still exposes the cycle pops.
            pops: {
              ...sp,
              for (final m in cycleMembers(r.name))
                if (!sp.containsKey(m)) m: unionName(m),
            },
            edges: sharedEdges(group),
            extra: extra,
            path: suffix,
            markers: impl,
            parentScreen: suffix.length >= 2 ? suffix[suffix.length - 2] : null);
        return navName;
      }

      walk(nodes, 1, const []);

      for (final m in markersToEmit) {
        b.writeln('sealed class $m {}');
      }
      for (final n in nodes) {
        final anc = ancestorsOf(n);
        navClass(
          placementName(n),
          goVerbs(n.children, childType, n.path),
          pops: {
            ...anc,
            // Cycle members (incl. the screen itself — self-pop to the previous
            // occurrence, since resolvePop skips the current top). Throwing.
            for (final m in cycleMembers(n.screen))
              if (!anc.containsKey(m)) m: unionName(m),
          },
          edges: {for (final c in n.children) c.screen: childType(c)},
          parentScreen: n.parent?.screen,
          markers: leafMarkers[n]!.toList(),
          path: n.path,
          extra: cyclic.contains(n.screen)
              ? '  int get depth => $spec.graph.countOf($spec.${n.screen});'
              : null,
        );
      }
    }

    b.writeln('extension ScreenIdOf on BuildContext {');
    b.writeln('  I idOf<I>(Screen<I> screen) {');
    b.writeln('    final entry = ScreenScope.of<$spec>(this);');
    b.writeln("    assert(identical(entry.screen, screen.spec), 'idOf(\${screen.name}) under \${entry.screen.name}');");
    b.writeln('    return entry.id as I;');
    b.writeln('  }');
    b.writeln('}');

    b.writeln('void verifyScreens() {');
    b.writeln('  assert(() {');
    for (final r in rows) {
      if (r.idType == null) {
        b.writeln("    assert($spec.${r.name}.id == null, '${r.name} declares no id type but the generated tier expected none');");
      } else {
        b.writeln("    assert($spec.${r.name}.id == ${r.idType}, '${r.name}: stale generated id type — rerun build_runner');");
      }
    }
    b.writeln('    return true;');
    b.writeln('  }());');
    b.writeln('}');

    if (usesEndsWith) {
      b.writeln('bool _endsWith(List<$spec> chain, List<$spec> suffix) {');
      b.writeln('  if (chain.length < suffix.length) return false;');
      b.writeln('  final off = chain.length - suffix.length;');
      b.writeln('  for (var i = 0; i < suffix.length; i++) {');
      b.writeln('    if (chain[off + i] != suffix[i]) return false;');
      b.writeln('  }');
      b.writeln('  return true;');
      b.writeln('}');
    }

    return b.toString();
  }
}
