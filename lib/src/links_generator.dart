import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:canon/canon.dart' show Canon;
import 'package:source_gen/source_gen.dart';

/// The generator for a `SegBase` address tree (`@canon enum _Cdn with SegBase`
/// holding `static final routes = tree({Domain('…')({…})})`): a typed builder
/// face over the runtime [LinkSpec] — pure egress, no parse surface.
///
/// Authoring rules it reads:
///  * a seg row (`ads({…})`) — a static path segment; kebab-cased literal;
///  * `slot(codec)` / `slot(codec, suffix: '_thumb')` — a dynamic segment,
///    step-named by the codec (`Ids.ad` → `ad`, `.integer(#image)` → `image`;
///    a suffix appends in camel: `imageThumb`);
///  * a seg whose ONLY child is a slot fuses into one step
///    (`ads({slot(Ids.ad)({…})})` → `Cdn.ads(adId)`);
///  * `null` in a children set marks the node itself an address (a leaf
///    always is).
class LinksGenerator extends GeneratorForAnnotation<Canon> {
  @override
  Future<String?> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final el = element as EnumElement;
    final ast =
        await buildStep.resolver.astNodeFor(el.firstFragment, resolve: false);
    if (ast is! EnumDeclaration || ast.body is! BlockEnumBody) {
      throw InvalidGenerationSourceError('could not read the enum AST',
          element: el);
    }
    Expression? routes;
    for (final member in (ast.body as BlockEnumBody).members) {
      if (member is FieldDeclaration) {
        for (final v in member.fields.variables) {
          if (v.name.lexeme == 'routes') routes = v.initializer;
        }
      }
    }
    if (routes is! MethodInvocation ||
        routes.methodName.name != 'tree') {
      throw InvalidGenerationSourceError(
          'a SegBase spec enum needs a static `routes` field built with '
          "`tree({Domain('…')({…})})`",
          element: el);
    }
    final rows = {
      for (final f in el.fields)
        if (f.isEnumConstant && f.name != null) f.name!,
    };
    final enumName = el.name!;
    final face = enumName.startsWith('_') ? enumName.substring(1) : enumName;

    // ── The trie ──
    final root = _Step('', face);
    final treeSet = routes.argumentList.arguments.firstOrNull?.argumentExpression;
    final domains = treeSet is SetOrMapLiteral
        ? [for (final e in treeSet.elements) if (e is Expression) e]
        : const <Expression>[];
    if (domains.length != 1) {
      throw InvalidGenerationSourceError(
          'expected exactly one Domain placement in `routes`',
          element: el);
    }
    final placement = domains.single;
    if (placement is! FunctionExpressionInvocation ||
        placement.function is! MethodInvocation) {
      throw InvalidGenerationSourceError(
          "a Domain placement is `Domain('…')({…})`",
          element: el);
    }
    for (final child in _children(placement.argumentList)) {
      _place(child, root, rows, el);
    }
    // A childless step IS an address (a leaf resolves; `null` marks the rest).
    void seal(_Step s) {
      if (s.children.isEmpty) s.endpoint = true;
      s.children.forEach(seal);
    }
    root.children.forEach(seal);

    // ── Emission ──
    final b = StringBuffer();
    b.writeln('final _${_lc(face)}Matcher = LinkMatcher($enumName.routes);');
    b.writeln('/// Typed address builders over the `$enumName` route tree.');
    b.writeln('abstract final class $face {');
    for (final step in root.children) {
      b.writeln(step.memberSource(static: true));
    }
    b.writeln('}');
    final all = <_Step>[];
    void collect(_Step s) {
      all.add(s);
      s.children.forEach(collect);
    }
    root.children.forEach(collect);
    for (final step in all) {
      b.writeln(step.classSource(_lc(face)));
    }
    return b.toString();
  }
}

List<Expression> _children(ArgumentList args) {
  final set = args.arguments.firstOrNull?.argumentExpression;
  if (set is SetOrMapLiteral) {
    return [for (final e in set.elements) if (e is Expression) e];
  }
  return const [];
}

String _kebab(String s) =>
    s.replaceAllMapped(RegExp('[A-Z]'), (m) => '-${m[0]!.toLowerCase()}');

String _pascal(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

String _lc(String s) => s.isEmpty ? s : s[0].toLowerCase() + s.substring(1);

/// One trie node: a chain step class in the generated face.
class _Step {
  _Step(this.token, this.className, {this.methodName = '', this.valueType})
      : endpoint = false;

  /// The template token this step contributes ('ads', '*', '*_thumb').
  final String token;
  final String className;
  final String methodName;

  /// Non-null = this step consumes a typed value (a slot, possibly fused).
  final String? valueType;
  bool endpoint;
  final List<_Step> children = [];
  String template = '';

  String memberSource({bool static = false}) {
    final mod = static ? 'static ' : '';
    return valueType == null
        ? '  $mod$className get $methodName => '
            '$className(${static ? 'const <Object?>[]' : '_p'});'
        : '  $mod$className $methodName($valueType v) => '
            '$className([...${static ? 'const <Object?>[]' : '_p'}, v]);';
  }

  String classSource(String facePrefix) {
    final b = StringBuffer();
    b.writeln('final class $className {');
    b.writeln('  const $className(this._p);');
    b.writeln('  final List<Object?> _p;');
    for (final c in children) {
      b.writeln(c.memberSource());
    }
    if (endpoint) {
      b.writeln('  String get url =>');
      b.writeln("      _${facePrefix}Matcher.printRoute(template: '$template', path: _p);");
      b.writeln('  Uri toUri() => Uri.parse(url);');
    }
    b.writeln('}');
    return b.toString();
  }
}

/// Names + types for a slot codec expression.
({String name, String type}) _codecFace(Expression codec, EnumElement el) {
  switch (codec) {
    // Ids.ad — an id-space node: step `ad`, type `AdId`.
    case PrefixedIdentifier(:final identifier):
      return (
        name: identifier.name,
        type: '${_pascal(identifier.name)}Id',
      );
    // .integer(#image) / Codec.integer(#image) — named semantic codec.
    case MethodInvocation(:final methodName, :final argumentList):
      final sym = argumentList.arguments
          .map((a) => a.argumentExpression)
          .whereType<SymbolLiteral>()
          .firstOrNull
          ?.components
          .map((t) => t.lexeme)
          .join();
      final name = sym ?? methodName.name;
      return (name: name, type: _dartType(methodName.name));
    // .integer (dot shorthand, unnamed) — step named by the semantic.
    case PropertyAccess(:final propertyName):
      return (name: propertyName.name, type: _dartType(propertyName.name));
    default:
      throw InvalidGenerationSourceError(
          'cannot name the slot codec "$codec" — use an Ids node or a named '
          'codec (`.integer(#image)`)',
          element: el);
  }
}

String _dartType(String semantic) => switch (semantic) {
      'integer' => 'int',
      'number' => 'double',
      'date' => 'DateTime',
      _ => 'String',
    };

void _place(Expression expr, _Step parent, Set<String> rows, EnumElement el) {
  switch (expr) {
    case NullLiteral():
      parent.endpoint = true;
    // seg({children}) — possibly fusing with a single slot child.
    case MethodInvocation(
        target: null,
        methodName: SimpleIdentifier(:final name),
        :final argumentList,
      )
        when rows.contains(name):
      final children = _children(argumentList);
      // Fusion: the seg's only child is a slot → one step takes the value.
      final only = children.length == 1 ? children.single : null;
      final (slotExpr, slotChildren) = switch (only) {
        MethodInvocation(methodName: SimpleIdentifier(name: 'slot')) =>
          (only, const <Expression>[]),
        FunctionExpressionInvocation(
          function: MethodInvocation(
              methodName: SimpleIdentifier(name: 'slot')) &&
              final inner,
          :final argumentList,
        ) =>
          (inner, _children(argumentList)),
        _ => (null, const <Expression>[]),
      };
      if (slotExpr != null) {
        final slot = _slotStep(slotExpr, parent, el, methodName: name);
        parent.children.add(slot);
        for (final c in slotChildren) {
          _place(c, slot, rows, el);
        }
        return;
      }
      final step = _seg(name, parent);
      parent.children.add(step);
      for (final c in children) {
        _place(c, step, rows, el);
      }
    // bare seg leaf.
    case SimpleIdentifier(:final name) when rows.contains(name):
      parent.children.add(_seg(name, parent)..endpoint = true);
    // slot(codec) / slot(codec, suffix: '…') under a multi-child parent.
    case MethodInvocation(
        target: null,
        methodName: SimpleIdentifier(name: 'slot'),
      ):
      parent.children.add(_slotStep(expr, parent, el));
    // slot(...)({children})
    case FunctionExpressionInvocation(
        function: MethodInvocation(
            methodName: SimpleIdentifier(name: 'slot')) &&
            final MethodInvocation inner,
        :final argumentList,
      ):
      final slot = _slotStep(inner, parent, el);
      parent.children.add(slot);
      for (final c in [
        for (final e in (argumentList.arguments.firstOrNull?.argumentExpression
                as SetOrMapLiteral?)
                ?.elements ??
            const <CollectionElement>[])
          if (e is Expression) e
      ]) {
        _place(c, slot, rows, el);
      }
    default:
      throw InvalidGenerationSourceError(
          'cannot read address-tree expression "$expr"',
          element: el);
  }
}

var _stepSeq = 0;

_Step _seg(String name, _Step parent) {
  final s = _Step('${_kebab(name)}', '_LS${_stepSeq++}', methodName: name)
    ..template = parent.template.isEmpty
        ? _kebab(name)
        : '${parent.template}/${_kebab(name)}';
  return s;
}

_Step _slotStep(MethodInvocation slotExpr, _Step parent, EnumElement el,
    {String? methodName}) {
  String? suffix;
  for (final a in slotExpr.argumentList.arguments) {
    if (a is NamedArgument &&
        a.name.lexeme == 'suffix' &&
        a.argumentExpression is SimpleStringLiteral) {
      suffix = (a.argumentExpression as SimpleStringLiteral).value;
    }
  }
  final codecExpr = slotExpr.argumentList.arguments
      .firstWhere((a) => a is! NamedArgument)
      .argumentExpression;
  final face = _codecFace(codecExpr, el);
  final suffixPascal = suffix == null
      ? ''
      : _pascal(suffix.replaceAll(RegExp('[^A-Za-z0-9]'), ''));
  final token = '*${suffix ?? ''}';
  final s = _Step(
    token,
    '_LS${_stepSeq++}',
    methodName: methodName ?? '${face.name}$suffixPascal',
    valueType: face.type,
  )..template =
      parent.template.isEmpty ? token : '${parent.template}/$token';
  // A fused seg step contributes BOTH tokens.
  if (methodName != null) {
    s.template = parent.template.isEmpty
        ? '${_kebab(methodName)}/$token'
        : '${parent.template}/${_kebab(methodName)}/$token';
  }
  return s;
}
