import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// One placement of a screen in the grammar tree, with its path from the root
/// (used for placement-type naming) and its resolved `.again` target.
class PlacementNode {
  PlacementNode(this.screen, this.path, this.parent);

  final String screen;
  final List<String> path;
  final PlacementNode? parent;
  final List<PlacementNode> children = [];

  /// True when declared with `.keep` — a preserved scope root.
  bool keep = false;

  /// Set when this node IS an `.again` back-edge: the ancestor placement the
  /// edge folds back to.
  PlacementNode? again;

  Iterable<PlacementNode> get ancestors sync* {
    for (var n = parent; n != null; n = n.parent) {
      yield n;
    }
  }

  bool isUnder(PlacementNode other) =>
      identical(this, other) || ancestors.any((a) => identical(a, other));
}

/// Reads the grammar tree from the spec enum's static `graph` field,
/// syntactically. The tree literal is runtime-built, so the builder walks its
/// AST: enum-row invocations declare placements, `.again` declares a back-edge
/// to the nearest same-screen ancestor, and static expression-bodied helper
/// calls inline their body.
Future<List<PlacementNode>> readTree(
  EnumElement element,
  BuildStep buildStep,
  Set<String> rows,
) async {
  final node = await buildStep.resolver
      .astNodeFor(element.firstFragment, resolve: false);
  if (node is! EnumDeclaration) {
    throw InvalidGenerationSourceError('could not read the spec enum AST',
        element: element);
  }

  final body = node.body;
  if (body is! BlockEnumBody) {
    throw InvalidGenerationSourceError('the spec enum has no body',
        element: element);
  }
  Expression? graph;
  final helpers = <String, Expression>{};
  for (final member in body.members) {
    if (member is FieldDeclaration) {
      for (final field in member.fields.variables) {
        if (field.name.lexeme == 'graph') graph = field.initializer;
      }
    }
    if (member is MethodDeclaration && member.body is ExpressionFunctionBody) {
      helpers[member.name.lexeme] =
          (member.body as ExpressionFunctionBody).expression;
    }
  }
  if (graph is! MethodInvocation) {
    throw InvalidGenerationSourceError(
        'the spec enum needs a static `graph` field constructing a NavGraph '
        'with the tree as its first argument',
        element: element);
  }

  PlacementNode place(Expression expr, List<PlacementNode> ancestors) {
    PlacementNode placeCall(
        String name, ArgumentList args, List<PlacementNode> ancestors,
        {required bool keep}) {
      final placed = PlacementNode(name,
          [for (final a in ancestors) a.screen, name], ancestors.lastOrNull)
        ..keep = keep;
      final children = args.arguments.firstOrNull;
      if (children is SetOrMapLiteral) {
        for (final child in children.elements) {
          if (child is! Expression) {
            throw InvalidGenerationSourceError(
                'unsupported element in the tree literal: $child',
                element: element);
          }
          placed.children.add(place(child, [...ancestors, placed]));
        }
      }
      return placed;
    }

    switch (expr) {
      case SimpleIdentifier(:final name) when rows.contains(name):
        return PlacementNode(name,
            [for (final a in ancestors) a.screen, name], ancestors.lastOrNull);
      case PrefixedIdentifier(
            :final prefix,
            identifier: SimpleIdentifier(name: 'again')
          )
          when rows.contains(prefix.name):
        final target = ancestors.lastWhere((a) => a.screen == prefix.name,
            orElse: () => throw InvalidGenerationSourceError(
                '"${prefix.name}.again" has no same-screen ancestor',
                element: element));
        return PlacementNode(prefix.name,
            [for (final a in ancestors) a.screen, prefix.name], ancestors.lastOrNull)
          ..again = target;
      // home.keep({...}) — preservation doesn't change edges, only lifetime.
      case MethodInvocation(
            target: SimpleIdentifier(:final name),
            methodName: SimpleIdentifier(name: 'keep'),
            :final argumentList
          )
          when rows.contains(name):
        return placeCall(name, argumentList, ancestors, keep: true);
      case MethodInvocation(
            methodName: SimpleIdentifier(:final name),
            :final argumentList
          )
          when rows.contains(name):
        return placeCall(name, argumentList, ancestors, keep: false);
      case MethodInvocation(methodName: SimpleIdentifier(:final name))
          when helpers.containsKey(name):
        return place(helpers[name]!, ancestors);
      default:
        throw InvalidGenerationSourceError(
            'cannot read tree expression "$expr" — use enum rows, .again, or '
            'expression-bodied static helpers',
            element: element);
    }
  }

  final tree = graph.argumentList.arguments.firstOrNull;
  if (tree is! SetOrMapLiteral) {
    throw InvalidGenerationSourceError(
        "NavGraph's first argument must be the tree set literal",
        element: element);
  }
  return [for (final root in tree.elements) place(root as Expression, [])];
}
