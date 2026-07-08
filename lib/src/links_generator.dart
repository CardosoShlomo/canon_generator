import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
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
    final root = _Step(face);
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

/// One trie node: a chain step class in the generated face. A static seg
/// contributes a template literal and no value; a slot contributes `*`, one
/// typed value, and one union-branch index (0 for a single codec).
class _Step {
  _Step(this.className,
      {this.methodName = '', this.valueType, this.templateToken})
      : endpoint = false;

  final String className;
  final String methodName;

  /// Non-null = this step consumes a typed value (a slot).
  final String? valueType;

  /// The template token: a kebab literal (static) or `*` (slot).
  String? templateToken;

  /// This step's own union-branch index (slots only).
  int branch = 0;
  bool endpoint;
  final List<_Step> children = [];

  /// The full template ('ads/*/*') and the branch constants ([0, 0]) from the
  /// root to this step — baked into the leaf's printRoute call.
  String template = '';
  List<int> branches = const [];

  String memberSource({bool static = false}) {
    final mod = static ? 'static ' : '';
    final src = static ? 'const <Object?>[]' : '_p';
    return valueType == null
        ? '  $mod$className get $methodName => $className($src);'
        : '  $mod$className $methodName($valueType v) => '
            '$className([...$src, v]);';
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
      b.writeln('  String get url => _${facePrefix}Matcher.printRoute(');
      b.writeln("      template: '$template', path: _p, "
          'branches: const ${branches.isEmpty ? '<int>[]' : branches});');
      b.writeln('  Uri toUri() => Uri.parse(url);');
    }
    b.writeln('}');
    return b.toString();
  }
}

/// Detects `Codec.literal('x')` / `.literal('x')` and returns its string.
String? _literalOf(Expression e) => switch (e) {
      MethodInvocation(methodName: SimpleIdentifier(name: 'literal'))
          when e.argumentList.arguments.firstOrNull?.argumentExpression
              is SimpleStringLiteral =>
        (e.argumentList.arguments.first.argumentExpression
                as SimpleStringLiteral)
            .value,
      DotShorthandInvocation(memberName: SimpleIdentifier(name: 'literal'))
          when e.argumentList.arguments.firstOrNull?.argumentExpression
              is SimpleStringLiteral =>
        (e.argumentList.arguments.first.argumentExpression
                as SimpleStringLiteral)
            .value,
      _ => null,
    };

/// Flattens `a + b + c` (concat) into its operands in order.
List<Expression> _concatOperands(Expression e) => switch (e) {
      BinaryExpression(operator: Token(lexeme: '+'), :final leftOperand, :final rightOperand) =>
        [..._concatOperands(leftOperand), ..._concatOperands(rightOperand)],
      _ => [e],
    };

/// Names + types for a slot codec expression.
({String name, String type}) _codecFace(Expression codec, EnumElement el) {
  switch (codec) {
    // A concat (`Ids.image + .literal('_thumb')`): the single variable member
    // carries the type; literals decorate the name (`image` + `Thumb`).
    case BinaryExpression(operator: Token(lexeme: '+')):
      final ops = _concatOperands(codec);
      final variables = [for (final o in ops) if (_literalOf(o) == null) o];
      if (variables.length != 1) {
        throw InvalidGenerationSourceError(
            'a concat slot needs exactly one variable codec (literals frame '
            'it); got ${variables.length} in "$codec"',
            element: el);
      }
      final base = _codecFace(variables.single, el);
      final decorations = [
        for (final o in ops)
          if (_literalOf(o) case final lit?)
            _pascal(lit.replaceAll(RegExp('[^A-Za-z0-9]'), ''))
      ].join();
      return (name: '${base.name}$decorations', type: base.type);
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
    // .integer(#image) — dot-shorthand named semantic codec.
    case DotShorthandInvocation(:final memberName, :final argumentList):
      final sym = argumentList.arguments
          .map((a) => a.argumentExpression)
          .whereType<SymbolLiteral>()
          .firstOrNull
          ?.components
          .map((t) => t.lexeme)
          .join();
      return (
        name: sym ?? memberName.name,
        type: _dartType(memberName.name),
      );
    // .integer / Codec.integer (unnamed) — step named by the semantic.
    case DotShorthandPropertyAccess(:final propertyName):
      return (name: propertyName.name, type: _dartType(propertyName.name));
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
        _placeSlot(_slotCodec(slotExpr), slotChildren, parent, rows, el,
            fusedName: name);
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
    // slot(codec) under a multi-child parent.
    case MethodInvocation(
        target: null,
        methodName: SimpleIdentifier(name: 'slot'),
      ):
      _placeSlot(_slotCodec(expr), const [], parent, rows, el);
    // slot(...)({children})
    case FunctionExpressionInvocation(
        function: MethodInvocation(
            methodName: SimpleIdentifier(name: 'slot')) &&
            final MethodInvocation inner,
        :final argumentList,
      ):
      final slotChildren = [
        for (final e in (argumentList.arguments.firstOrNull?.argumentExpression
                as SetOrMapLiteral?)
                ?.elements ??
            const <CollectionElement>[])
          if (e is Expression) e
      ];
      _placeSlot(_slotCodec(inner), slotChildren, parent, rows, el);
    default:
      throw InvalidGenerationSourceError(
          'cannot read address-tree expression "$expr"',
          element: el);
  }
}

var _stepSeq = 0;

String _appendTemplate(String parent, String seg) =>
    parent.isEmpty ? seg : '$parent/$seg';

_Step _seg(String name, _Step parent) => _Step('_LS${_stepSeq++}',
    methodName: name, templateToken: _kebab(name))
  ..template = _appendTemplate(parent.template, _kebab(name))
  ..branches = parent.branches;

/// The union branches of `a | b | c` (each a codec expression), or `[e]`.
List<Expression> _unionBranches(Expression e) => switch (e) {
      BinaryExpression(
        operator: Token(lexeme: '|'),
        :final leftOperand,
        :final rightOperand
      ) =>
        [..._unionBranches(leftOperand), ..._unionBranches(rightOperand)],
      _ => [e],
    };

/// Places a slot under [parent] — one method per union branch, each sharing
/// the slot's continuation ([slotChildren]). [fusedName] fuses a leading seg
/// (`ads({slot(Ids.ad)})` → `Cdn.ads(adId)`); it requires a single branch.
void _placeSlot(Expression codecExpr, List<Expression> slotChildren,
    _Step parent, Set<String> rows, EnumElement el,
    {String? fusedName}) {
  final branches = _unionBranches(codecExpr);
  if (fusedName != null && branches.length > 1) {
    throw InvalidGenerationSourceError(
        'a fused seg+slot ("$fusedName") cannot hold a union — give the union '
        'slot its own children set.',
        element: el);
  }
  for (var i = 0; i < branches.length; i++) {
    final face = _codecFace(branches[i], el);
    final tmpl = fusedName != null
        ? _appendTemplate(parent.template, '${_kebab(fusedName)}/*')
        : _appendTemplate(parent.template, '*');
    final step = _Step('_LS${_stepSeq++}',
        methodName: fusedName ?? face.name,
        valueType: face.type,
        templateToken: '*')
      ..branch = i
      ..template = tmpl
      ..branches = [...parent.branches, i];
    parent.children.add(step);
    for (final c in slotChildren) {
      _place(c, step, rows, el);
    }
  }
}

/// The codec expression inside a `slot(...)` invocation.
Expression _slotCodec(MethodInvocation slotExpr) => slotExpr
    .argumentList.arguments
    .firstWhere((a) => a is! NamedArgument)
    .argumentExpression;
