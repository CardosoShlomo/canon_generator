import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// One placement of a screen in the grammar tree, with its path from the root
/// (used for placement-type naming), the enum it belongs to ([spec] — the same
/// for native and grafted screens; the generator emits `<spec>.<screen>`), and
/// its resolved back-edge target.
class PlacementNode {
  PlacementNode(this.screen, this.spec, this.path, this.parent);

  final String screen;

  /// The home enum's name (`_Root`, `Shop`, …). Grafted screens carry the
  /// sub-enum; this is the ONLY graft-awareness in the model.
  final String spec;
  final List<String> path;
  final PlacementNode? parent;
  final List<PlacementNode> children = [];

  /// True when declared with `.keep` — a liveness-on boundary.
  bool keep = false;

  /// True when declared with `.forget` — a liveness-off boundary inside a keep.
  bool forget = false;

  /// Set when this node IS a `.cycled`/`.stacked` back-edge.
  PlacementNode? again;

  /// Set when declared with `.inherit(ancestor)` — the single-source form. Left
  /// null for a COMPOSITE inherit (see [inheritSources]); the generator decides
  /// compositeness from the screen's id (a record id has >1 component).
  PlacementNode? inheritSource;

  /// Every ancestor named in `.inherit(a, [b, c])`, in declaration order. One
  /// entry is the single-source form; two or three compose a record id. Empty
  /// when this placement does not inherit.
  List<PlacementNode> inheritSources = const [];

  /// Set when this single-source inherit PROJECTS one component out of a
  /// COMPOSITE source's id — the index of the component whose `@ids` node matches
  /// this screen's node. The inherited id read becomes `(_idOf(src) as R).$N`.
  int? inheritComponent;

  /// True when this node is a `.links(...)` branch — a link-grammar root, NOT a
  /// nav placement. Collected into [TreeModel.links]; nav emission never sees it.
  bool isLink = false;

  /// True when this link branch is the WIDGET form: a bare `slots`/`slot` sitting
  /// directly in a real placement's children. The enclosing screen's id codec is
  /// injected as an extra (WidgetLink) union branch; the rest resolve widgetless.
  bool isWidgetForm = false;

  /// Raw `.links({...})` child expressions (link DSL: slot/slots/seg/query),
  /// walked by the link model builder rather than the nav placer.
  List<Expression> linkChildren = const [];

  /// Raw `.query({...})` / `.fragment({...})` view-state key expressions on this
  /// placement (a query-key enum's `key(codec)` / bare flag). The generator emits
  /// a typed view surface; the runtime mirrors the values into the URL.
  List<Expression> viewQuery = const [];
  List<Expression> viewFragment = const [];

  Iterable<PlacementNode> get ancestors sync* {
    for (var n = parent; n != null; n = n.parent) {
      yield n;
    }
  }

  bool isUnder(PlacementNode other) =>
      identical(this, other) || ancestors.any((a) => identical(a, other));
}

/// The virtual tree plus every enum it spans (root + grafted sub-enums).
class TreeModel {
  TreeModel(this.tree, this.enums, this.links);
  final List<PlacementNode> tree;
  final List<EnumElement> enums;

  /// `.links(...)` branches gathered across the tree (root + nested), for the
  /// merged Link surface. Each carries its path context (`path`) and the raw
  /// link children (`linkChildren`); none appears in [tree].
  final List<PlacementNode> links;
}

/// One enum's syntactic surface: its name, screen-row names, expression-bodied
/// helpers, and its named fields (`graph`, `subtree`, …) as AST expressions.
class _Frame {
  _Frame(this.spec, this.rows, this.helpers, this.fields);
  final String spec;
  final Set<String> rows;
  final Map<String, Expression> helpers;
  final Map<String, Expression> fields;
}

/// Reads the grammar tree from the root enum's static `graph` field, following
/// `graft(Sub.subtree)` / `graft(Sub.screen)` into sub-enums to build ONE
/// virtual tree. Purely syntactic: enum-row invocations declare placements,
/// `.cycled`/`.stacked` declare a back-edge, `.keep`/`.forget` toggle liveness,
/// static expression-bodied helpers inline their body, and `graft` splices a
/// foreign family's subtree (tagged with its own [PlacementNode.spec]).
Future<TreeModel> readTree(EnumElement root, BuildStep buildStep) async {
  final frames = <String, _Frame>{};
  final enums = <EnumElement>[];
  final links = <PlacementNode>[]; // `.links(...)` branches, kept out of the nav tree

  Future<_Frame> frameOf(EnumElement e) async {
    final existing = frames[e.name];
    if (existing != null) return existing;
    final ast =
        await buildStep.resolver.astNodeFor(e.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) {
      throw InvalidGenerationSourceError('could not read the enum AST',
          element: e);
    }
    final helpers = <String, Expression>{};
    final fields = <String, Expression>{};
    for (final member in (ast.body as BlockEnumBody).members) {
      if (member is FieldDeclaration) {
        for (final v in member.fields.variables) {
          if (v.initializer != null) fields[v.name.lexeme] = v.initializer!;
        }
      }
      if (member is MethodDeclaration && member.body is ExpressionFunctionBody) {
        helpers[member.name.lexeme] =
            (member.body as ExpressionFunctionBody).expression;
      }
    }
    final rows = {
      for (final f in e.fields)
        if (f.isEnumConstant && f.name != null) f.name!,
    };
    final frame = _Frame(e.name!, rows, helpers, fields);
    frames[e.name!] = frame;
    enums.add(e);
    return frame;
  }

  // Resolve a graft target enum by NAME from the root library's scope (the AST
  // is unresolved, so we can't read `.element` off the identifier).
  final rootLib = root.library;
  EnumElement findEnum(String name) {
    final libs = [
      rootLib,
      for (final f in rootLib.fragments) ...f.importedLibraries,
    ];
    for (final lib in libs) {
      for (final en in lib.enums) {
        if (en.name == name) return en;
      }
    }
    throw InvalidGenerationSourceError(
        'graft target enum "$name" is not visible from this library', element: root);
  }

  // The sub-enum a `graft(...)` argument targets (its prefix's name).
  EnumElement graftEnum(Expression arg) {
    final name = switch (arg) {
      PrefixedIdentifier(:final prefix) => prefix.name,
      MethodInvocation(target: SimpleIdentifier(:final name)) => name,
      _ => throw InvalidGenerationSourceError(
          'graft expects `OtherEnum.subtree` / `OtherEnum.screen`, got "$arg"',
          element: root),
    };
    return findEnum(name);
  }

  // The sub-expression to place for a graft: a `subtree`/field ref resolves to
  // that field's initializer; a bare screen / inline build is placed as-is.
  Expression graftExpr(Expression arg, _Frame frame) {
    if (arg is PrefixedIdentifier && frame.fields.containsKey(arg.identifier.name)) {
      return frame.fields[arg.identifier.name]!;
    }
    if (arg is PrefixedIdentifier && frame.rows.contains(arg.identifier.name)) {
      return arg.identifier; // graft(Sub.screen) — a bare leaf
    }
    return arg; // inline `Sub.x({...})`
  }

  late final Future<PlacementNode> Function(Expression, List<PlacementNode>, _Frame)
      place;

  Future<PlacementNode> placeImpl(
      Expression expr, List<PlacementNode> ancestors, _Frame frame) async {
    final spec = frame.spec;
    final rows = frame.rows;

    // Place every child expression of a `{...}` set under [placed], routing link
    // branches aside. Shared by the bare call form and the inherit-with-children
    // form (`X.inherit(Y)({...})`), which attach the SAME children to an already-
    // built node rather than constructing a fresh one.
    Future<void> attachChildren(
        PlacementNode placed, ArgumentList args, List<PlacementNode> ancestors,
        {required String empty}) async {
      final children = args.arguments.firstOrNull;
      if (children is! SetOrMapLiteral || children.elements.isEmpty) {
        throw InvalidGenerationSourceError(empty, element: root);
      }
      final linkSiblings = <PlacementNode>[];
      for (final child in children.elements) {
        if (child is! Expression) {
          throw InvalidGenerationSourceError(
              'unsupported element in the tree literal: $child', element: root);
        }
        final node = await place(child, [...ancestors, placed], frame);
        if (node.isLink) {
          links.add(node);
          linkSiblings.add(node);
        } else {
          placed.children.add(node);
        }
      }
      _rejectScreenLinkClash(placed.children, linkSiblings, root);
    }

    Future<PlacementNode> placeCall(
        String name, ArgumentList args, List<PlacementNode> ancestors,
        {bool keep = false, bool forget = false}) async {
      final placed = PlacementNode(name, spec,
          [for (final a in ancestors) a.screen, name], ancestors.lastOrNull)
        ..keep = keep
        ..forget = forget;
      // The call form is for a node WITH children — its set is required and must
      // be non-empty. A childless leaf is written bare (`account`), never as an
      // empty call (`account()`) or empty set (`account({})`).
      await attachChildren(placed, args, ancestors,
          empty: 'screen "$name" has an empty call — write a bare `$name` for a '
              'leaf, or `$name({...})` to give it children.');
      return placed;
    }

    switch (expr) {
      // graft(Sub.subtree) — splice a foreign family's subtree under here.
      case MethodInvocation(
          methodName: SimpleIdentifier(name: 'graft'),
          :final argumentList,
        ):
        final arg = argumentList.arguments.first as Expression;
        final sub = await frameOf(graftEnum(arg));
        return place(graftExpr(arg, sub), ancestors, sub);
      case SimpleIdentifier(:final name) when rows.contains(name):
        return PlacementNode(name, spec,
            [for (final a in ancestors) a.screen, name], ancestors.lastOrNull);
      case PrefixedIdentifier(
          :final prefix,
          identifier: SimpleIdentifier(name: 'cycled' || 'stacked'),
        )
          when rows.contains(prefix.name):
        final target = ancestors.lastWhere((a) => a.screen == prefix.name,
            orElse: () => throw InvalidGenerationSourceError(
                '"${prefix.name}.${expr.identifier.name}" has no same-screen ancestor',
                element: root));
        return PlacementNode(prefix.name, spec,
            [for (final a in ancestors) a.screen, prefix.name],
            ancestors.lastOrNull)
          ..again = target;
      case MethodInvocation(
          target: SimpleIdentifier(:final name),
          methodName: SimpleIdentifier(name: 'keep'),
          :final argumentList,
        )
          when rows.contains(name):
        return placeCall(name, argumentList, ancestors, keep: true);
      case MethodInvocation(
          target: SimpleIdentifier(:final name),
          methodName: SimpleIdentifier(name: 'forget'),
          :final argumentList,
        )
          when rows.contains(name):
        return placeCall(name, argumentList, ancestors, forget: true);
      case MethodInvocation(
          target: final inner?,
          methodName: SimpleIdentifier(name: 'inherit'),
          :final argumentList,
        )
          when argumentList.arguments.isNotEmpty &&
              argumentList.arguments.every((a) =>
                  a is SimpleIdentifier && rows.contains(a.name)):
        final placed = await place(inner, ancestors, frame);
        final sources = <PlacementNode>[];
        for (final arg in argumentList.arguments) {
          final srcName = (arg as SimpleIdentifier).name;
          final src = placed.ancestors.firstWhere((a) => a.screen == srcName,
              orElse: () => throw InvalidGenerationSourceError(
                  '"${placed.screen}.inherit($srcName)" — $srcName is not an ancestor',
                  element: root));
          sources.add(src.inheritSource ?? src);
        }
        placed.inheritSources = sources;
        // The single-source form keeps the existing `inheritSource` wiring intact;
        // a multi-source (composite) inherit is resolved by the generator from
        // `inheritSources` (it leaves `inheritSource` null for record ids).
        if (sources.length == 1) placed.inheritSource = sources.single;
        return placed;
      // `X.inherit(Y)({...})` — an inheriting node WITH children. The function
      // is the `.inherit(...)` invocation; place it (binding the id source), then
      // attach the call's children to the resulting node.
      case FunctionExpressionInvocation(
          function: MethodInvocation(
            methodName: SimpleIdentifier(name: 'inherit'),
          ) &&
              final fn,
          :final argumentList,
        ):
        final placed = await place(fn, ancestors, frame);
        await attachChildren(placed, argumentList, ancestors,
            empty: 'inherit on "${placed.screen}" has an empty call — write the '
                'bare `${placed.screen}.inherit(...)` for a leaf, or give it '
                '`(...){...}` children.');
        return placed;
      // `X.inherit(Y).cycled` / `.stacked` — a back-edge that ALSO binds its id
      // via inherit. Place the inherit (sets the id source), then resolve the
      // same-screen ancestor as the back-edge target.
      case PropertyAccess(
          target: MethodInvocation(
            methodName: SimpleIdentifier(name: 'inherit'),
          ) &&
              final inheritCall,
          propertyName: SimpleIdentifier(name: 'cycled' || 'stacked'),
        ):
        final placed = await place(inheritCall, ancestors, frame);
        placed.again = ancestors.lastWhere((a) => a.screen == placed.screen,
            orElse: () => throw InvalidGenerationSourceError(
                '"${placed.screen}.inherit(...).${expr.propertyName.name}" has no '
                'same-screen ancestor to cycle back to',
                element: root));
        return placed;
      // `placement.query({...})` / `.fragment({...})` — view-state keys on a screen
      // placement (NOT a link branch). Attach the raw key set; the generator types it.
      case MethodInvocation(
          target: final t?,
          methodName: SimpleIdentifier(name: 'query' || 'fragment'),
          :final argumentList,
        )
          when t is MethodInvocation || t is SimpleIdentifier || t is PrefixedIdentifier:
        final placed = await place(t, ancestors, frame);
        final set = argumentList.arguments.firstOrNull;
        final terms = set is SetOrMapLiteral
            ? [for (final e in set.elements) if (e is Expression) e]
            : const <Expression>[];
        if ((expr.methodName.name) == 'query') {
          placed.viewQuery = terms;
        } else {
          placed.viewFragment = terms;
        }
        return placed;
      // A bare `slot(...)` in a placement's children — the WIDGET form: a link
      // branch on the enclosing screen, whose id codec is injected as the
      // WidgetLink branch. ("slot is itself a link declaration.")
      case MethodInvocation(
          target: null,
          methodName: SimpleIdentifier(name: 'slot'),
        )
          when ancestors.isNotEmpty:
        final enclosing = ancestors.last;
        return PlacementNode(
            enclosing.screen, enclosing.spec, enclosing.path, enclosing.parent)
          ..isLink = true
          ..isWidgetForm = true
          ..linkChildren = [expr];
      // `screen.link({...})` / `.links({...})` — a link-grammar branch, NOT a
      // nav placement (no widget seeded → its branches resolve widgetless).
      case MethodInvocation(
          target: SimpleIdentifier(:final name),
          methodName: SimpleIdentifier(name: 'links' || 'link'),
          :final argumentList,
        )
          when rows.contains(name):
        final set = argumentList.arguments.firstOrNull;
        return PlacementNode(name, spec,
            [for (final a in ancestors) a.screen, name], ancestors.lastOrNull)
          ..isLink = true
          ..linkChildren = set is SetOrMapLiteral
              ? [for (final e in set.elements) if (e is Expression) e]
              : const [];
      case MethodInvocation(
          methodName: SimpleIdentifier(:final name),
          :final argumentList,
        )
          when rows.contains(name):
        return placeCall(name, argumentList, ancestors);
      case MethodInvocation(methodName: SimpleIdentifier(:final name))
          when frame.helpers.containsKey(name):
        return place(frame.helpers[name]!, ancestors, frame);
      default:
        throw InvalidGenerationSourceError(
            'cannot read tree expression "$expr" — use enum rows, .cycled/.stacked, '
            'graft, or expression-bodied static helpers',
            element: root);
    }
  }

  place = placeImpl;

  final rootFrame = await frameOf(root);
  final graph = rootFrame.fields['graph'];
  if (graph is! MethodInvocation) {
    throw InvalidGenerationSourceError(
        'the spec enum needs a static `graph` field constructing a NavGraph '
        'with the tree as its first argument',
        element: root);
  }
  final treeLit = graph.argumentList.arguments.firstOrNull;
  if (treeLit is! SetOrMapLiteral) {
    throw InvalidGenerationSourceError(
        "NavGraph's first argument must be the tree set literal",
        element: root);
  }
  final tree = <PlacementNode>[];
  final rootLinks = <PlacementNode>[];
  for (final r in treeLit.elements) {
    final node = await place(r as Expression, [], rootFrame);
    if (node.isLink) {
      links.add(node);
      rootLinks.add(node);
    } else {
      tree.add(node);
    }
  }
  _rejectScreenLinkClash(tree, rootLinks, root);
  return TreeModel(tree, enums, links);
}

// A node at one position is EITHER a navigable screen OR a `.link`-only branch,
// never both — `X()` beside `X.link(...)` in one set is the widget form written
// the long way. Reject it: put the link's branches inside the screen instead,
// `X({slot(...)})`.
void _rejectScreenLinkClash(
    List<PlacementNode> navSiblings, List<PlacementNode> linkSiblings, Element root) {
  final navNames = {for (final n in navSiblings) n.screen};
  for (final l in linkSiblings) {
    if (navNames.contains(l.screen)) {
      throw InvalidGenerationSourceError(
          'screen "${l.screen}" is declared both as a placement and a `.link` '
          'branch in the same set — that is the widget form written redundantly. '
          'Declare its link branches inside it instead: `${l.screen}({slot(...)})`.',
          element: root);
    }
  }
}
