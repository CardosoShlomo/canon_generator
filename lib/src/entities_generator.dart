import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// identifiable owns the @entities grammar; pure Dart, flutter-free builder.
import 'package:identifiable/identifiable.dart' show Entities;

/// Reads an `@entities` enum and emits the TREE OPS: for every ownership edge
/// (`review({comment})`) an extension on the parent's map with surgical child
/// updaters — the nested copyWith chains written once:
///
/// ```dart
/// entities.updateComment(reviewId, commentId, (c) => …)
/// entities.addComment(reviewId, comment)
/// entities.removeComment(reviewId, commentId)
/// ```
///
/// Pure (map-in, map-out), so they compose inside any `Store.reduce`. The
/// owned collection lives on the parent entity as an `IdentifiableMap` field
/// named after the child row (`comments` for `comment`) — mismatches surface
/// as compile errors in the generated ops.
class EntitiesGenerator extends GeneratorForAnnotation<Entities> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@entities must annotate an enum',
          element: element);
    }

    // Row name → (entity type AS WRITTEN, key type name). Written, because a
    // resolved Type constant may carry generated types (InvalidType in this
    // builder's own phase) or expand a typedef — and an extension NAME can't
    // hold type arguments anyway.
    final written = await _writtenRowTypes(element, buildStep);
    final rows = <String, (String, String)>{};
    for (final f in element.fields) {
      if (!f.isEnumConstant) continue;
      final v = f.computeConstantValue();
      final typeName = written[f.name];
      if (typeName == null) continue;
      final node = v?.getField('key');
      final keyType = _typedNodeName(node) ?? _nodeValueType(node) ?? 'Object?';
      rows[f.name!] = (typeName, keyType);
    }

    final edges = await _edges(element, buildStep);
    if (edges.isEmpty) return '';

    final b = StringBuffer();
    b.writeln('// Tree ops — one extension per owning entity, from the');
    b.writeln('// @entities graph: surgical child updates, pure, reduce-safe.');
    final byParent = <String, List<String>>{};
    for (final (parent, child) in edges) {
      (byParent[parent] ??= []).add(child);
    }
    for (final e in byParent.entries) {
      final parent = rows[e.key];
      if (parent == null) continue;
      final (pType, pKey) = parent;
      b.writeln('extension ${pType}TreeOps on IdentifiableMap<$pKey, $pType> {');
      for (final childRow in e.value) {
        final child = rows[childRow];
        if (child == null) continue;
        final (cType, cKey) = child;
        final field = '${childRow}s';
        final cap = '${childRow[0].toUpperCase()}${childRow.substring(1)}';
        b.writeln('  /// Surgically update one `$childRow` inside its owner.');
        b.writeln('  IdentifiableMap<$pKey, $pType> update$cap(');
        b.writeln('          $pKey owner, $cKey id, $cType Function($cType) fn) =>');
        b.writeln('      updateById(owner,');
        b.writeln('          (o) => o.copyWith($field: o.$field.updateById(id, fn)));');
        b.writeln('  /// Insert/replace one `$childRow` inside its owner.');
        b.writeln('  IdentifiableMap<$pKey, $pType> add$cap($pKey owner, $cType child) =>');
        b.writeln('      updateById(owner,');
        b.writeln('          (o) => o.copyWith($field: o.$field.upsert(child)));');
        b.writeln('  /// Remove one `$childRow` from its owner.');
        b.writeln('  IdentifiableMap<$pKey, $pType> remove$cap($pKey owner, $cKey id) =>');
        b.writeln('      updateById(owner,');
        b.writeln('          (o) => o.copyWith($field: o.$field.removeById(id)));');
      }
      b.writeln('}');
    }
    return b.toString();
  }

  /// Each entity row's FIRST argument (the type literal) as source text.
  Future<Map<String, String>> _writtenRowTypes(
      EnumElement entitiesEnum, BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(entitiesEnum.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) return const {};
    final map = <String, String>{};
    for (final c in (ast.body as BlockEnumBody).constants) {
      final arg = c.arguments?.argumentList.arguments.firstOrNull;
      final expr = arg?.argumentExpression;
      if (expr != null) map[c.name.lexeme] = expr.toSource();
    }
    return map;
  }

  /// The (parent row, child row) ownership edges of the static graph literal.
  Future<List<(String, String)>> _edges(
      EnumElement entitiesEnum, BuildStep buildStep) async {
    final ast = await buildStep.resolver
        .astNodeFor(entitiesEnum.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) return const [];
    Expression? graphExpr;
    for (final member in (ast.body as BlockEnumBody).members) {
      if (member is FieldDeclaration) {
        for (final v in member.fields.variables) {
          if (v.name.lexeme == 'graph') graphExpr = v.initializer;
        }
      }
    }
    final args = switch (graphExpr) {
      MethodInvocation(:final argumentList) => argumentList,
      InstanceCreationExpression(:final argumentList) => argumentList,
      _ => null,
    };
    final tree = args?.arguments.firstOrNull?.argumentExpression;
    if (tree is! SetOrMapLiteral) return const [];

    final edges = <(String, String)>[];
    void walk(Expression node, String? parent) {
      switch (node) {
        case SimpleIdentifier(:final name):
          if (parent != null) edges.add((parent, name));
        case MethodInvocation(
            methodName: SimpleIdentifier(:final name),
            :final argumentList,
          ):
          if (parent != null) edges.add((parent, name));
          final children =
              argumentList.arguments.firstOrNull?.argumentExpression;
          if (children is SetOrMapLiteral) {
            for (final c in children.elements) {
              if (c is Expression) walk(c, name);
            }
          }
        default:
      }
    }

    for (final e in tree.elements) {
      if (e is Expression) walk(e, null);
    }
    return edges;
  }

  String? _nodeValueType(DartObject? node) {
    var codecObj = node?.getField('codec');
    if (codecObj == null || codecObj.isNull) codecObj = node?.getField('_codec');
    final t = (codecObj != null && !codecObj.isNull) ? codecObj.type : null;
    if (t is! InterfaceType) return null;
    for (final s in [t, ...t.allSupertypes]) {
      if (s.element.name == 'Codec' && s.typeArguments.length == 1) {
        return s.typeArguments.first.getDisplayString();
      }
    }
    return null;
  }

  String? _typedNodeName(DartObject? node) {
    final el = node?.type?.element;
    if (el is! EnumElement) return null;
    final annotated = el.metadata.annotations.any((a) => const {'IDs', 'Canon'}
        .contains(a.computeConstantValue()?.type?.element?.name));
    if (!annotated) return null;
    final raw = node?.getField('_name')?.toStringValue();
    if (raw == null) return null;
    return '${raw[0].toUpperCase()}${raw.substring(1)}Id';
  }
}
