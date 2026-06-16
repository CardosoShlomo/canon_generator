import 'package:analyzer/dart/constant/value.dart';
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

// Rebuilds a record type from a record-OF-Types id value (`(String, String)`).
// Returns null if any field isn't a Type — then it's a record VALUE witness
// (`('', '')`) and the caller falls back to the value's own type.
String? _recordTypeOf(({List<DartObject> positional, Map<String, DartObject> named}) rec) {
  String? t(DartObject o) => o.toTypeValue()?.getDisplayString();
  final pos = [for (final p in rec.positional) t(p)];
  final named = [for (final e in rec.named.entries) (e.key, t(e.value))];
  if (pos.contains(null) || named.any((n) => n.$2 == null)) return null;
  final parts = [
    ...pos,
    if (named.isNotEmpty) '{${[for (final n in named) '${n.$2} ${n.$1}'].join(', ')}}',
  ];
  return '(${parts.join(', ')})';
}
String _lcFirst(String s) => s[0].toLowerCase() + s.substring(1);

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
    final widgetOf = <String, String?>{};
    for (final field in element.fields) {
      if (!field.isEnumConstant) continue;
      final value = field.computeConstantValue();
      final idObj = value?.getField('id');
      widgetOf[field.name!] = value?.getField('widget')?.type?.getDisplayString();
      // The id field gives each screen's id TYPE, in any of three forms: a Type
      // literal (`String`), a record-OF-Types (`(String, String)`), or a sample
      // VALUE whose type is the id type (`0` -> int, `('', '')` -> (String,
      // String)). The value/record forms need an `Object? id` field to compile.
      final idType = idObj?.toTypeValue();
      String? idStr;
      DartType? idDartType;
      if (idType != null) {
        idStr = idType.getDisplayString();
        idDartType = idType;
      } else if (idObj != null && !idObj.isNull) {
        final rec = idObj.toRecordValue();
        idStr = (rec != null ? _recordTypeOf(rec) : null) ?? idObj.type?.getDisplayString();
        idDartType = idObj.type;
      }
      if (idStr != null && idDartType != null && !_hasValueEquality(idDartType)) {
        log.warning(
            'id type $idStr of "${field.name}" compares by identity — repeat-collapse '
            'and prefix reuse fire only when two id instances are equal, so for this '
            'screen they apply to identical instances only; override == and hashCode '
            'for value semantics');
      }
      rows.add(_Row(field.name!, idStr));
    }
    final idOf = {for (final r in rows) r.name: r.idType};

    // A widget shared by >=2 screens with >=2 distinct (non-null) id types is
    // id-ambiguous: inside it you can't statically know which screen you are.
    // Emit a sealed `(screen, typed id)` union + a resolver so the consumer
    // disambiguates EXHAUSTIVELY (vs an open `(current, currentId)` switch).
    final byWidget = <String, List<_Row>>{};
    for (final r in rows) {
      final w = widgetOf[r.name];
      if (w != null) (byWidget[w] ??= []).add(r);
    }
    final widgetUnions = [
      for (final e in byWidget.entries)
        if (e.value.map((r) => r.idType).whereType<String>().toSet().length >= 2)
          (sealed: '${e.key}Id', resolver: '${_lcFirst(e.key)}Id', members: e.value)
    ];

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

    // Global pop surface: `canPop` is the union of all NON-ROOT placements (the
    // ones that can be popped); `pop()` lands on a DESTINATION — any predecessor
    // of a non-root placement. Both are markers the relevant placement navs
    // implement, so resolution reuses the same `.at` machinery as the unions.
    final canPopMembers = [
      for (final r in rows)
        for (final n in placements[r.name]!)
          if (n.parent != null) n
    ];
    final destMembers = <PlacementNode>[];
    {
      final seen = <String>{};
      for (final n in canPopMembers) {
        for (final p in predecessorsOf(n)) {
          if (seen.add(p.path.join('/'))) destMembers.add(p);
        }
      }
    }
    final hasCanPop = canPopMembers.isNotEmpty;
    if (hasCanPop) {
      for (final n in canPopMembers) {
        (crossImpl[placementName(n)] ??= {}).add('CanPopPlacement');
      }
      for (final p in destMembers) {
        (crossImpl[placementName(p)] ??= {}).add('PopDestPlacement');
      }
    }

    // Canonical ancestors — always in the live chain at this placement, so popTo
    // them can't fail. Cycle members are merged into the pops map separately (at
    // the navClass call sites) as throwing pops; see cycleMembers.
    Map<String, String> ancestorsOf(PlacementNode n) =>
        {for (final a in n.ancestors) a.screen: placementName(a)};

    // The global teleport (Screen.go / Hop) is the unambiguous kick-start: it
    // may target only a SINGLE-placement, id-free screen. Multi-placement
    // (union) targets are ambiguous (which placement?) and id-behind targets
    // would need a fabricated ancestor id (the null-id bug) — both are reached
    // instead by chaining a forward edge off a handle (Screen.at/on or a prior
    // goXx), where the position, and thus the placement and ancestor ids, is
    // already pinned.
    bool globalSafe(String screen) {
      final ps = placements[screen]!;
      if (ps.length != 1) return false;
      final node = ps.single;
      final src = node.inheritSource;
      // An id-bearing ancestor is allowed ONLY if it shares this screen's id —
      // i.e. it's covered by the inherit chain (same ultimate source) — so the
      // one kick-start id fills it. Otherwise it'd need a fabricated id.
      for (final a in node.ancestors) {
        if (idOf[a.screen] == null) continue;
        if (src != null && identical(a.inheritSource ?? a, src)) continue;
        return false;
      }
      return true;
    }
    // Kick-start body. Plain: one canonical go. Inherit-rescued (id shared with
    // an id-bearing ancestor): kick-start to the source, then edge down to the
    // target, stamping the shared id at every level (never a null ancestor id).
    String kickStart(String screen) {
      final ret = unionName(screen);
      final node = placements[screen]!.single;
      final src = node.inheritSource;
      final idT = idOf[screen];
      if (src == null) {
        final params = idT == null ? '' : '$idT id';
        final arg = idT == null ? '' : ', id';
        return '  static $ret go${_cap(screen)}($params) {\n'
            '    $spec.graph.go($spec.$screen$arg);\n'
            '    return const $ret._();\n'
            '  }';
      }
      final steps = node.path.sublist(node.path.indexOf(src.screen));
      final lines = StringBuffer('    $spec.graph.go($spec.${steps.first}, id);\n');
      for (final s in steps.skip(1)) {
        lines.write('    $spec.graph.go($spec.$s, id, true);\n');
      }
      return '  static $ret go${_cap(screen)}($idT id) {\n'
          '$lines'
          '    return const $ret._();\n'
          '  }';
    }

    // parentOf exists only to DISAMBIGUATE: it offers a screen X iff X has 2+
    // distinct parent placements (with one parent you'd just name it, e.g.
    // `Screen.on(.ad)?.goEditAd()`; a root has none). `Screen.on(.parentOf.x)`
    // resolves — by current-top membership in X's parent screens — to a handle
    // exposing what's provable at ANY of those parents: the push to X, every
    // sibling edge shared by all parents, and pop() when all parents are
    // non-root (the intersection of the parents' capabilities).
    final parentsOf = <String, List<PlacementNode>>{};
    for (final r in rows) {
      final ps = <PlacementNode>[];
      final seen = <String>{};
      for (final n in placements[r.name]!) {
        final p = n.parent;
        if (p != null && seen.add(p.path.join('/'))) ps.add(p);
      }
      // Ambiguous only when the parents span 2+ distinct SCREENS — if they're
      // all the same screen you'd just name it (`on(.item)`). Shared
      // capabilities are still intersected over all parent placements below.
      if ({for (final p in ps) p.screen}.length >= 2) parentsOf[r.name] = ps;
    }
    final parentScreensOf = {
      for (final e in parentsOf.entries)
        e.key: {for (final p in e.value) p.screen}
    };
    // Children screens common to ALL of x's parents (x itself is always one,
    // since every parent has x as a child).
    Set<String> sharedChildrenOf(List<PlacementNode> parents) => parents
        .map((p) => {for (final c in p.children) c.screen})
        .reduce((a, b) => a.intersection(b));
    // pop() is provable on the handle only if popping is legal at every parent.
    bool allParentsNonRoot(List<PlacementNode> parents) =>
        parents.every((p) => p.parent != null);
    // Uniform inherit source across all of X's placements (null if none, or if
    // mixed id-bearing/inherited — the signature-split case, deferred).
    String? inheritSrcUniform(String screen) {
      final ns = placements[screen]!;
      if (ns.isEmpty || ns.any((n) => n.inheritSource == null)) return null;
      final srcs = {for (final n in ns) n.inheritSource!.screen};
      return srcs.length == 1 ? srcs.single : null;
    }
    String parentPush(String x) {
      final ret = unionName(x);
      final src = inheritSrcUniform(x);
      final idT = idOf[x];
      final params = (src != null || idT == null) ? '' : '$idT id';
      final arg = src != null
          ? '_idOf($spec.$src)'
          : (idT == null ? 'null' : 'id');
      // Named after the committed target (go<Target>), consistent with every
      // other push verb — the selector already narrowed to this screen.
      return '  $ret go${_cap(x)}($params) {\n'
          '    $spec.graph.go($spec.$x, $arg, true);\n'
          '    return const $ret._();\n'
          '  }';
    }

    // A position-anchored handle (non-null path) navigates edge-required: the
    // target must be a live edge from the current top or graph.go throws (a
    // stale handle), never a silent canonical teleport. Stale-but-still-legal
    // resolves. Entry-point navs (null path) stay total (canonical allowed).
    String goVerb(String child, String returns,
        [List<String>? path, String? inheritSrc]) {
      // Inherited edge (chained only): id IS the ancestor's, read live from the
      // chain — no parameter to pass, none to get wrong.
      if (inheritSrc != null && path != null) {
        return '  $returns go${_cap(child)}() {\n'
            '    $spec.graph.go($spec.$child, _idOf($spec.$inheritSrc), true);\n'
            '    return const $returns._();\n'
            '  }';
      }
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
      final byChild = <String, PlacementNode>{};
      for (final c in children) {
        byChild[c.screen] = c;
      }
      return [
        for (final e in byChild.entries)
          goVerb(e.key, type(e.value), path, e.value.inheritSource?.screen)
      ];
    }

    final b = StringBuffer();

    // Emits a nav class. A nav always extends AnyNav; the empty sealed
    // switch-markers it's a case of are listed via implements. Pops: ancestor
    // popToX never fails (always in the chain); cycle-member popToX (incl. self,
    // the previous occurrence) throws when not currently below — guard with the
    // depth check.
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
    final hasInherit =
        placements.values.any((ps) => ps.any((n) => n.inheritSource != null));
    final hasParentOf = parentScreensOf.isNotEmpty;

    b.writeln('// ignore_for_file: library_private_types_in_public_api');
    if (hasInherit) {
      // An inherited edge reads its ancestor's live id from the chain.
      b.writeln('Object? _idOf($spec s) =>');
      b.writeln('    $spec.graph.stack.lastWhere((e) => e.screen == s).id;');
    }
    if (hasMulti || hasCanPop) {
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
    b.writeln('  /// If the live stack ends with this selector path (every pinned id and,');
    b.writeln('  /// for a cyclic terminal, its depth matching), its nav — else null.');
    b.writeln('  static N? on<N extends AnyNav>(On<N> which) {');
    if (hasParentOf) {
      // parentOf selector matches by current-top membership, not a suffix path.
      b.writeln('    if (which is OnParentOf) {');
      b.writeln('      return (which as OnParentOf).parents.contains($spec.graph.current)');
      b.writeln('          ? which.nav');
      b.writeln('          : null;');
      b.writeln('    }');
    }
    b.writeln('    final st = $spec.graph.stack;');
    b.writeln('    final specs = which.specs;');
    b.writeln('    if (st.length < specs.length) return null;');
    b.writeln('    final off = st.length - specs.length;');
    b.writeln('    for (var i = 0; i < specs.length; i++) {');
    b.writeln('      if (st[off + i].screen != specs[i]) return null;');
    b.writeln('      final wid = which.ids[i];');
    b.writeln('      if (wid != null && st[off + i].id != wid) return null;');
    b.writeln('    }');
    if (cyclic.isNotEmpty) {
      b.writeln('    if (which is OnDepth &&');
      b.writeln('        $spec.graph.countOf(specs.last, which.ids.last) != (which as OnDepth).depth) {');
      b.writeln('      return null;');
      b.writeln('    }');
    }
    b.writeln('    return which.nav;');
    b.writeln('  }');
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
    if (hasCanPop) {
      b.writeln('  /// The poppable handle if the active top is a non-root placement,');
      b.writeln('  /// else null (at a scope root). `.at` = current placement; `.pop()`');
      b.writeln('  /// executes the guaranteed pop and returns the destination.');
      b.writeln('  static CanPopNav? get canPop =>');
      b.writeln('      $spec.graph.currentChain.length > 1 ? const CanPopNav._() : null;');
      b.writeln('  /// Documented sugar for `canPop?.pop()` — pops the active top if any,');
      b.writeln('  /// returns where it landed, or null at a root. Never throws.');
      b.writeln('  static PopDestNav? pop() => canPop?.pop();');
    }
    b.writeln('  /// Side-effect listener fired after each navigation commits (new top');
    b.writeln('  /// settled, before its transition animates). Wire it where state lives');
    b.writeln('  /// (e.g. a provider); returns a disposer. Pure observation.');
    b.writeln('  static void Function() observe(');
    b.writeln('          void Function(Screen<Object?> from, Screen<Object?> to) fn) =>');
    b.writeln('      $spec.graph.observe((f, t) => fn(of(f), of(t)));');
    for (final u in widgetUnions) {
      b.writeln('  /// Resolves a widget shared by several screens to its exact');
      b.writeln('  /// (screen, typed id) — switch the sealed result exhaustively.');
      b.writeln('  static ${u.sealed} ${u.resolver}(BuildContext context) {');
      b.writeln('    final e = ScreenScope.of<$spec>(context);');
      b.writeln('    return switch (e.screen) {');
      for (final r in u.members) {
        b.writeln('      $spec.${r.name} => ${_cap(r.name)}Id(e.id as ${r.idType ?? 'Object?'}),');
      }
      b.writeln("      _ => throw StateError('${u.resolver}() under \${e.screen.name}'),");
      b.writeln('    };');
      b.writeln('  }');
    }
    if (kept.isNotEmpty) {
      b.writeln('  static void reset(Keep scope) => $spec.graph.reset(scope.spec);');
    }
    for (final r in rows) {
      if (!globalSafe(r.name)) continue; // id-behind targets: reach via chaining
      b.writeln('  ${kickStart(r.name).trim()}');
    }
    b.writeln('}');

    b.writeln('final class Hop<N extends AnyNav> {');
    b.writeln('  const Hop._(this.spec, this.id, this.nav);');
    b.writeln('  final $spec spec;');
    b.writeln('  final Object? id;');
    b.writeln('  final N nav;');
    for (final r in rows) {
      if (!globalSafe(r.name)) continue; // id-behind targets: reach via chaining
      // Inherit-rescued kick-starts need a multi-step chain; a Hop is one go, so
      // they get the named Screen.goX only, not the Hop/ternary form.
      if (placements[r.name]!.single.inheritSource != null) continue;
      final n = unionName(r.name);
      if (r.idType == null) {
        b.writeln('  static const ${r.name} = Hop<$n>._($spec.${r.name}, null, $n._());');
      } else {
        b.writeln('  static Hop<$n> ${r.name}(${r.idType} id) => Hop._($spec.${r.name}, id, const $n._());');
      }
    }
    b.writeln('}');

    // Screen.on(.path) selector: a suffix the matcher tests against the live
    // stack. On<N> accumulates one (spec, id) per segment; each chain step
    // narrows the live placement set FORWARD, so only satisfiable child paths are
    // offered (no impossible chain like a child that exists only under a
    // different parent). A cyclic terminal also exposes .depth(n) -> OnDepth, the
    // only token carrying the depth FIELD (its method lives on the steps).
    final stepBuf = StringBuffer();
    final stepEmitted = <String>{};
    String navTypeOf(List<PlacementNode> ms) =>
        ms.length == 1 ? placementName(ms.single) : unionName(ms.first.screen);
    List<PlacementNode> fwd(List<PlacementNode> ms) =>
        [for (final m in ms) for (final c in m.children) if (c.again == null) c];
    String setStem(List<PlacementNode> ms) {
      if (ms.length == 1) {
        final pn = placementName(ms.single);
        return pn.substring(0, pn.length - 3);
      }
      if (ms.length == placements[ms.first.screen]!.length) return _cap(ms.first.screen);
      return (ms.map(stemOf).toList()..sort()).join();
    }
    // A step type is needed when the set can be refined further (forward
    // children), stopped-on with a depth (cyclic), or carries an id (the OnX
    // class hosts `call(id)` so the selector is `.x` for any id and `.x(id)` to
    // pin one). Otherwise a non-cyclic id-free leaf lands on a bare On<nav>.
    String? stepNameFor(List<PlacementNode> ms) {
      final sc = ms.first.screen;
      if (fwd(ms).isEmpty && !cyclic.contains(sc) && idOf[sc] == null) return null;
      return 'On${setStem(ms)}';
    }
    void emitStep(List<PlacementNode> ms) {
      final name = stepNameFor(ms);
      if (name == null || !stepEmitted.add(name)) return;
      final sc = ms.first.screen;
      final nav = navTypeOf(ms);
      final groups = <String, List<PlacementNode>>{};
      for (final c in fwd(ms)) {
        (groups[c.screen] ??= []).add(c);
      }
      stepBuf.writeln('final class $name extends On<$nav> {');
      stepBuf.writeln('  const $name._(List<$spec> specs, List<Object?> ids, $nav nav) : super._(specs, ids, nav);');
      // Every child selector is a getter (id appended as null = "match any");
      // an id-bearing child's own step hosts `call(id)` to pin it.
      for (final e in groups.entries) {
        final cNav = navTypeOf(e.value);
        final cStep = stepNameFor(e.value);
        final ret = cStep ?? 'On<$cNav>';
        final ctor = cStep ?? 'On';
        stepBuf.writeln('  $ret get ${e.key} => $ctor._([...specs, $spec.${e.key}], [...ids, null], const $cNav._());');
      }
      if (idOf[sc] != null) {
        stepBuf.writeln('  $name call(${idOf[sc]} id) => $name._(specs, [...ids.sublist(0, ids.length - 1), id], nav);');
      }
      if (cyclic.contains(sc)) {
        stepBuf.writeln('  OnDepth<$nav> depth(int d) => OnDepth._(specs, ids, d, nav);');
      }
      stepBuf.writeln('}');
      for (final e in groups.entries) {
        emitStep(e.value);
      }
    }

    b.writeln('final class On<N extends AnyNav> {');
    b.writeln('  const On._(this.specs, this.ids, this.nav);');
    b.writeln('  final List<$spec> specs;');
    b.writeln('  final List<Object?> ids;');
    b.writeln('  final N nav;');
    for (final r in rows) {
      final ms = placements[r.name]!;
      if (ms.isEmpty) continue;
      final nav = unionName(r.name);
      final step = stepNameFor(ms);
      final ret = step ?? 'On<$nav>';
      final ctor = step ?? 'On';
      // Always a getter (id = null matches any); `.x(id)` invokes the step's
      // call() to pin a specific id.
      b.writeln('  static $ret get ${r.name} => const $ctor._([$spec.${r.name}], [null], $nav._());');
    }
    if (hasParentOf) {
      b.writeln('  /// Disambiguating push onto the current scope when a screen has');
      b.writeln('  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —');
      b.writeln('  /// `.parentOf` alone is not an `On`, so the bare form will not compile.');
      b.writeln('  static _ParentSel get parentOf => const _ParentSel._();');
    }
    b.writeln('}');
    if (hasParentOf) {
      b.writeln('final class OnParentOf<N extends AnyNav> extends On<N> {');
      b.writeln('  const OnParentOf._(this.parents, N nav) : super._(const [], const [], nav);');
      b.writeln('  final Set<$spec> parents;');
      b.writeln('}');
      b.writeln('final class _ParentSel {');
      b.writeln('  const _ParentSel._();');
      for (final e in parentScreensOf.entries) {
        final cap = '${_cap(e.key)}NavParent';
        final lits = (e.value.toList()..sort()).map((s) => '$spec.$s').join(', ');
        b.writeln('  OnParentOf<$cap> get ${e.key} =>');
        b.writeln('      OnParentOf._(const {$lits}, const $cap._());');
      }
      b.writeln('}');
      for (final e in parentsOf.entries) {
        final cap = '${_cap(e.key)}NavParent';
        final parents = e.value;
        // Push the target plus every sibling edge shared by all parents.
        final shared = sharedChildrenOf(parents).toList()..sort();
        b.writeln('final class $cap extends AnyNav {');
        b.writeln('  const $cap._() : super._();');
        for (final child in shared) {
          b.writeln(parentPush(child));
        }
        // pop() is the parent-level pop; legal only if every parent is non-root.
        if (hasCanPop && allParentsNonRoot(parents)) {
          b.writeln('  PopDestNav pop() { $spec.graph.pop(); return const PopDestNav._(); }');
        }
        b.writeln('}');
      }
    }
    if (cyclic.isNotEmpty) {
      b.writeln('final class OnDepth<N extends AnyNav> extends On<N> {');
      b.writeln('  const OnDepth._(List<$spec> specs, List<Object?> ids, this.depth, N nav) : super._(specs, ids, nav);');
      b.writeln('  final int depth;');
      b.writeln('}');
    }
    for (final r in rows) {
      emitStep(placements[r.name]!);
    }
    b.write(stepBuf);

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

    // Global pop surface. CanPopNav: the union of poppable (non-root) placements
    // — Screen.canPop returns it iff the active top is non-root. PopDestNav: where
    // a pop lands, resolved from the post-pop chain; shared forward verbs appear
    // only for children common to EVERY destination (an app-wide screen).
    if (hasCanPop) {
      b.writeln('sealed class CanPopPlacement {}');
      b.writeln('sealed class PopDestPlacement {}');
      b.writeln('final class CanPopNav extends AnyNav {');
      b.writeln('  const CanPopNav._() : super._();');
      b.writeln('  CanPopPlacement get at => Screen.at as CanPopPlacement;');
      b.writeln('  PopDestNav pop() { $spec.graph.pop(); return const PopDestNav._(); }');
      b.writeln('}');
      b.writeln('final class PopDestNav extends AnyNav {');
      b.writeln('  const PopDestNav._() : super._();');
      final destFwd = [
        for (final p in destMembers)
          {for (final c in p.children) if (c.again == null) c.screen}
      ];
      final destShared =
          destFwd.isEmpty ? <String>{} : destFwd.reduce((a, b) => a.intersection(b));
      for (final cs in destShared) {
        b.writeln('  ${goVerb(cs, unionName(cs), const []).trim()}');
      }
      b.writeln('  PopDestPlacement get at {');
      b.writeln('    final c = $spec.graph.currentChain;');
      final sorted = [...destMembers]
        ..sort((a, b) => b.path.length.compareTo(a.path.length));
      for (final m in sorted) {
        final lits = m.path.map((s) => '$spec.$s').join(', ');
        b.writeln('    if (_chainIs(c, const [$lits])) return const ${placementName(m)}._();');
      }
      b.writeln("    throw StateError('unresolved PopDestNav: \$c');");
      b.writeln('  }');
      b.writeln('}');
    }

    // Shared-widget id unions: one sealed family per id-ambiguous widget, a
    // case per screen carrying that screen's typed id.
    for (final u in widgetUnions) {
      b.writeln('sealed class ${u.sealed} { const ${u.sealed}(); }');
      for (final r in u.members) {
        b.writeln('final class ${_cap(r.name)}Id extends ${u.sealed} {');
        b.writeln('  const ${_cap(r.name)}Id(this.id);');
        b.writeln('  final ${r.idType ?? 'Object?'} id;');
        b.writeln('}');
      }
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
          edges: n == null
              ? const {}
              : {for (final c in n.children) if (c.inheritSource == null) c.screen: childType(c)},
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

      // Shared (intersection) forward children over a placement group. Includes
      // inherited edges — they get a named no-id verb just like single
      // placements; only the ternary go(Hop) form (sharedEdges) drops them.
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
                goVerb(c.screen, unionName(c.screen), path, c.inheritSource?.screen)
        ];
      }
      // Edge-gated go over the group's shared forward edges, excluding inherited
      // ones (their id can't be supplied statically through a Hop).
      Map<String, String> sharedEdges(List<PlacementNode> group) {
        final inh = {
          for (final n in group)
            for (final c in n.children)
              if (c.inheritSource != null) c.screen
        };
        return {
          for (final s in sharedFwd(group))
            if (!inh.contains(s)) s: unionName(s)
        };
      }
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
    b.writeln('  /// The screen this widget belongs to (its enclosing scope).');
    b.writeln('  Screen<Object?> get screen => Screen.of(ScreenScope.of<$spec>(this).screen);');
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
