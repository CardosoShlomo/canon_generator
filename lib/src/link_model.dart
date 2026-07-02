import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import 'tree_reader.dart';

/// The first positional argument's expression (analyzer 13 wraps args in
/// `Argument`; unwrap to the `Expression`).
Expression? _first(ArgumentList args) =>
    args.arguments.firstOrNull?.argumentExpression;

/// The parsed link tree, flattened to the resolving endpoints the generator
/// emits typed classes for.
class LinkModel {
  LinkModel(this.varName, this.endpoints);
  final String varName;
  final List<Endpoint> endpoints;
}

/// One codec at a slot position: its Dart result type, a name used to derive a
/// union branch class, and the author's `(#name)` field-name override if any.
class CodecSpec {
  CodecSpec(this.type, this.name,
      {this.nameOverride, this.fieldName, this.literal, this.isWidgetId = false});
  final String type;
  final String name;
  final String? nameOverride; // use-site `(#name)`
  final String? fieldName; // intrinsic semantic name (`.username`)
  final String? literal; // fixed segment value (`.literal('me')`) → payload-less
  bool get isLiteral => literal != null;
  // The screen's own id codec, injected by the widget form → a WidgetLink branch.
  final bool isWidgetId;
}

/// One path slot: a single codec, or a union (>1, ordered).
class SlotSpec {
  SlotSpec(this.codecs);
  final List<CodecSpec> codecs;
  bool get isUnion => codecs.length > 1;
}

enum ParamKind { flag, value, list }

/// A query/fragment schema node: a key, or a typed combinator.
sealed class Term {}

class KeyTerm extends Term {
  KeyTerm(this.name, this.type, this.kind);
  final String name;
  final String type;
  final ParamKind kind;
}

class AllOfTerm extends Term {
  AllOfTerm(this.members, {this.mandatory = false});
  final List<Term> members; // members may themselves be combinators (nestable)
  final bool mandatory; // `requireAllOf` — link branches only
}

class OneOfTerm extends Term {
  OneOfTerm(this.members, {this.mandatory = false});
  final List<Term> members;
  final bool mandatory; // `requireOneOf` — link branches only
}

/// One resolving node: structural [template], ordered path [slots], and the
/// query/fragment term trees.
class Endpoint {
  Endpoint(this.className, this.template, this.slots, this.query, this.fragment);
  final String className;
  final String template;
  final List<SlotSpec> slots;
  final List<Term> query;
  final List<Term> fragment;
}

class _Node {
  String? segLiteral;
  SlotSpec? slot;
  List<Expression> children = const [];
  List<Term> query = const [];
  List<Term> fragment = const [];
  bool get isSlot => slot != null;
}

String _kebab(String s) =>
    s.replaceAllMapped(RegExp('[A-Z]'), (m) => '-${m[0]!.toLowerCase()}');

String _pascal(String kebab) => kebab
    .split('-')
    .map((p) => p.isEmpty ? p : p[0].toUpperCase() + p.substring(1))
    .join();

/// Builds the resolving link endpoints from the `.links` branches collected off
/// the `@screens` graph (see `TreeModel.links`). Each branch is a link subtree
/// rooted at its screen's kebab segment, prefixed by its nav ancestors' segments
/// (a nested `.links` inherits its placement path). [rows] is the screen-name set
/// so a bare nested seg resolves as a screen. [element] is the `@screens` enum,
/// for diagnostics.
List<Endpoint> linkEndpoints(List<PlacementNode> branches, EnumElement element,
    Set<String> rows, Map<String, String?> idOf,
    {DartType? Function(Expression)? typeOf}) {
  _typeOf = typeOf;
  final endpoints = <Endpoint>[];
  final usedNames = <String>{};
  final seenTemplates = <String>{};

  void emit(List<String> path, List<SlotSpec> slots, _Node node) {
    final template = path.join('/');
    if (!seenTemplates.add(template)) return; // dedup repeated routes
    // Name by the LEAF screen, not the full path (`/profile/account/*` → Account,
    // not ProfileAccount) — the path lives only in the URL template. Collisions
    // across placements get a numeric suffix.
    final segs = [for (final p in path) if (p != '*') p];
    var base = segs.isEmpty ? 'Root' : _pascal(segs.last);
    var name = '${base}Link';
    for (var n = 2; !usedNames.add(name); n++) {
      name = '$base${n}Link';
    }
    endpoints.add(Endpoint(name, template, slots, node.query, node.fragment));
  }

  void walk(List<String> path, List<SlotSpec> slots, _Node node) {
    final hasMarker = node.children.any((e) => e is NullLiteral);
    final resolvesHere = node.children.isEmpty ||
        hasMarker ||
        node.query.isNotEmpty ||
        node.fragment.isNotEmpty;
    if (resolvesHere) emit(path, slots, node);
    for (final childExpr in node.children) {
      if (childExpr is NullLiteral) continue;
      final child = _peel(childExpr, element, rows);
      final seg = child.isSlot ? '*' : child.segLiteral!;
      walk([...path, seg], child.isSlot ? [...slots, child.slot!] : slots, child);
    }
  }

  for (final branch in branches) {
    // ancestor placement names → URL prefix; the branch's screen name → next
    // segment; then its declared link children.
    final prefix = [
      for (final a in branch.path.take(branch.path.length - 1)) _kebab(a)
    ];
    final seg = _kebab(branch.screen);
    if (branch.isWidgetForm) {
      // Widget form: one `slot`, with the screen's id codec injected as a
      // WidgetLink branch (after any leading literals — matches the runtime order).
      final slotNode = _peel(branch.linkChildren.single, element, rows);
      final declared = slotNode.slot?.codecs ?? const <CodecSpec>[];
      // The widget form exists to add WIDGETLESS resolver alternatives (`me`,
      // `username`) beside the screen's automatic id link. Declaring none is
      // redundant — the screen is already deep-linkable by its id.
      if (declared.isEmpty) {
        throw InvalidGenerationSourceError(
            'screen "${branch.screen}" declares an empty `slot` link — a '
            'screen is already deep-linkable by its id, so this adds nothing. '
            'Either remove it, or declare the resolver alternatives it should '
            "accept (e.g. `slot(Codec.literal('me') | Codec.username)`).",
            element: element);
      }
      final entity = _pascal(branch.screen);
      final idSpec = CodecSpec(idOf[branch.screen] ?? 'Object', 'Id',
          fieldName: '${_lcFirst(entity)}Id', isWidgetId: true);
      // The screen's own id is its canonical, renderable WidgetLink branch → it
      // leads; the declared resolvers follow. `[id, …declared]`.
      final codecs = [idSpec, ...declared];
      walk(
          [...prefix, seg, '*'],
          [SlotSpec(codecs)],
          _Node()
            ..children = slotNode.children
            ..query = slotNode.query
            ..fragment = slotNode.fragment);
      continue;
    }
    walk([...prefix, seg], const [], _Node()..children = branch.linkChildren);
  }
  return endpoints;
}

String _lcFirst(String s) => s.isEmpty ? s : s[0].toLowerCase() + s.substring(1);

/// The `(#name)` field-name override riding a codec (`.uuid(#productId)`), if any.
String? _symbolArg(ArgumentList args) {
  for (final a in args.arguments) {
    if (a is SymbolLiteral) return a.components.map((t) => t.lexeme).join('.');
  }
  return null;
}

List<Expression> _childrenOf(ArgumentList args) {
  final set = _first(args);
  if (set is SetOrMapLiteral) {
    return [for (final e in set.elements) if (e is Expression) e];
  }
  return const [];
}

_Node _peel(Expression expr, EnumElement element, Set<String> rows) {
  switch (expr) {
    case FunctionExpressionInvocation(:final function, :final argumentList):
      final node = _peel(function, element, rows);
      node.children = _childrenOf(argumentList);
      return node;
    case MethodInvocation(
        target: final t?,
        methodName: SimpleIdentifier(:final name),
        :final argumentList,
      )
        when name == 'query' ||
            name == 'fragment' ||
            name == 'sharedQuery':
      final node = _peel(t, element, rows);
      final terms = _terms(argumentList, element);
      if (name == 'query') node.query = terms;
      if (name == 'fragment') node.fragment = terms;
      return node;
    case MethodInvocation(
        target: null,
        methodName: SimpleIdentifier(name: 'slot'),
        :final argumentList,
      ):
      // `slot(a | b)` is a union slot — a single `slot` whose `|` expresses the
      // branches (a bare codec stays one). The old plural `slots({...})` is gone.
      return _Node()..slot = SlotSpec(_slotCodecs(_first(argumentList)!, element));
    // value({children}) — unqualified (in-enum) or `Seg.value` qualified.
    case MethodInvocation(
        target: SimpleIdentifier() || null,
        methodName: SimpleIdentifier(:final name),
        :final argumentList,
      )
        when rows.contains(name):
      return _Node()
        ..segLiteral = _kebab(name)
        ..children = _childrenOf(argumentList);
    // bare leaf: `value` (in-enum) or `Seg.value` qualified.
    case SimpleIdentifier(:final name) when rows.contains(name):
      return _Node()..segLiteral = _kebab(name);
    case PrefixedIdentifier(identifier: SimpleIdentifier(:final name))
        when rows.contains(name):
      return _Node()..segLiteral = _kebab(name);
    default:
      throw InvalidGenerationSourceError(
          'cannot read link tree node "$expr"', element: element);
  }
}

List<Term> _terms(ArgumentList args, EnumElement element) {
  final set = _first(args);
  if (set is! SetOrMapLiteral) return const [];
  return [
    for (final e in set.elements)
      if (e is Expression) _term(e, element),
  ];
}

/// One view-state key: its URL name, Dart type, and whether it's a flag (bare key
/// = bool presence) vs a value (`key(codec)`).
typedef ViewKey = ({String name, String type, bool flag});

/// Reads a placement's `.query`/`.fragment` key expressions into [ViewKey]s,
/// reusing the link query-term reader. Combinators are flattened to their keys.
List<ViewKey> viewKeys(List<Expression> exprs, EnumElement element) {
  final out = <ViewKey>[];
  void add(Term t) {
    switch (t) {
      case KeyTerm():
        out.add((name: t.name, type: t.type, flag: t.kind == ParamKind.flag));
      case AllOfTerm():
        t.members.forEach(add);
      case OneOfTerm():
        t.members.forEach(add);
    }
  }

  for (final e in exprs) {
    final t = _term(e, element);
    if (t case AllOfTerm(mandatory: true) || OneOfTerm(mandatory: true)) {
      throw _mandatoryOnView(element);
    }
    add(t);
  }
  return out;
}

/// A view-state term group: a lone key (independent/nullable), an `allOf` (all
/// members co-present — a record), or a `oneOf` (exactly one member — a sealed
/// type). Plain keys keep today's flat surface; combinators add a grouped typed
/// surface over the same flat store. At most one `allOf` / one `oneOf` per set.
sealed class ViewGroup {}

class ViewSingle extends ViewGroup {
  ViewSingle(this.key);
  final ViewKey key;
}

class ViewAllOf extends ViewGroup {
  ViewAllOf(this.keys);
  final List<ViewKey> keys;
}

class ViewOneOf extends ViewGroup {
  ViewOneOf(this.keys);
  final List<ViewKey> keys;
}

/// Like [viewKeys] but PRESERVES `allOf`/`oneOf` grouping for the typed value
/// model. Nested combinators inside a group are flattened into that group.
List<ViewGroup> viewGroups(List<Expression> exprs, EnumElement element) {
  ViewKey key(KeyTerm t) =>
      (name: t.name, type: t.type, flag: t.kind == ParamKind.flag);
  List<ViewKey> flat(List<Term> members) {
    final out = <ViewKey>[];
    void add(Term t) {
      switch (t) {
        case KeyTerm():
          out.add(key(t));
        case AllOfTerm():
          t.members.forEach(add);
        case OneOfTerm():
          t.members.forEach(add);
      }
    }

    members.forEach(add);
    return out;
  }

  final out = <ViewGroup>[];
  for (final e in exprs) {
    switch (_term(e, element)) {
      case KeyTerm t:
        out.add(ViewSingle(key(t)));
      case AllOfTerm t:
        if (t.mandatory) throw _mandatoryOnView(element);
        out.add(ViewAllOf(flat(t.members)));
      case OneOfTerm t:
        if (t.mandatory) throw _mandatoryOnView(element);
        out.add(ViewOneOf(flat(t.members)));
    }
  }
  return out;
}

/// `requireAllOf`/`requireOneOf` gate whether a URL MATCHES, so they only make
/// sense on `.link`/`slots` branches — a screen's `.query`/`.fragment` is
/// optional view-state, not part of the route's identity.
InvalidGenerationSourceError _mandatoryOnView(EnumElement element) =>
    InvalidGenerationSourceError(
      'requireAllOf/requireOneOf are link-only — a screen view-state '
      '`.query`/`.fragment` is optional decoration, not part of route identity. '
      'Use allOf/oneOf here, or model the required query as a `.link` branch.',
      element: element,
    );

Term _term(Expression e, EnumElement element) {
  switch (e) {
    case MethodInvocation(
        target: null,
        methodName: SimpleIdentifier(:final name),
        :final argumentList,
      )
        // `allOf`/`oneOf` are gone — use `&`/`|` (handled below). Only the
        // REQUIRED link-gating variants remain as functions.
        when name == 'requireAllOf' || name == 'requireOneOf':
      final inner = _first(argumentList);
      final members = <Term>[
        if (inner is SetOrMapLiteral)
          for (final m in inner.elements)
            if (m is Expression) _term(m, element),
      ];
      return name == 'requireOneOf'
          ? OneOfTerm(members, mandatory: true)
          : AllOfTerm(members, mandatory: true);
    // `.q(.string)` — dot-shorthand value/list key.
    case DotShorthandInvocation(
        memberName: SimpleIdentifier(:final name),
        :final argumentList,
      ):
      final (type, isList, _) = _codecType(_first(argumentList)!, element);
      return KeyTerm(name, type, isList ? ParamKind.list : ParamKind.value);
    // `.byDate` — dot-shorthand flag.
    case DotShorthandPropertyAccess(propertyName: SimpleIdentifier(:final name)):
      return KeyTerm(name, 'bool', ParamKind.flag);
    // `_Query.q(.string)` — qualified value/list key.
    case MethodInvocation(
        target: SimpleIdentifier(),
        methodName: SimpleIdentifier(:final name),
        :final argumentList,
      ):
      final (type, isList, _) = _codecType(_first(argumentList)!, element);
      return KeyTerm(name, type, isList ? ParamKind.list : ParamKind.value);
    // `_Query.byDate` — qualified flag.
    case PrefixedIdentifier(identifier: SimpleIdentifier(:final name)):
      return KeyTerm(name, 'bool', ParamKind.flag);
    // `a & b` (allOf) / `a | b` (oneOf) — the codec-algebra spelling of the
    // combinators. Dart binds `&` tighter than `|`, so `a & b | c` already reads
    // as `oneOf{ allOf{a,b}, c }`. Nested same-operator terms flatten downstream
    // (viewKeys/viewGroups), so two members per node is enough. Operator form is
    // always optional (non-mandatory); `requireAllOf`/`requireOneOf` stay functions.
    case BinaryExpression(:final leftOperand, :final operator, :final rightOperand)
        when operator.type == TokenType.AMPERSAND || operator.type == TokenType.BAR:
      final members = [
        _term(leftOperand, element),
        _term(rightOperand, element),
      ];
      return operator.type == TokenType.BAR
          ? OneOfTerm(members)
          : AllOfTerm(members);
    // Explicit grouping `(a | b) & c` to override the default `&`-tighter-than-`|`
    // precedence — peel the parens and read the inner expression.
    case ParenthesizedExpression(:final expression):
      return _term(expression, element);
    default:
      throw InvalidGenerationSourceError('cannot read query term "$e"',
          element: element);
  }
}

/// A slot's codec expression flattened to its branches. `a | b` (oneOf) is a
/// union of branches; a bare codec is a single branch. `&` (a composite token)
/// is not a union — it stays one CodecSpec via [_codecSpec]'s default path.
List<CodecSpec> _slotCodecs(Expression e, EnumElement element) {
  if (e is ParenthesizedExpression) return _slotCodecs(e.expression, element);
  if (e is BinaryExpression && e.operator.type == TokenType.BAR) {
    return [
      ..._slotCodecs(e.leftOperand, element),
      ..._slotCodecs(e.rightOperand, element),
    ];
  }
  return [_codecSpec(e, element)];
}

CodecSpec _codecSpec(Expression codec, EnumElement element) {
  final literal = _literalValue(codec);
  if (literal != null) {
    // `.literal('me')` → a payload-less variant named after the literal.
    return CodecSpec('String', _pascal(literal), literal: literal);
  }
  final (type, _, name) = _codecType(codec, element);
  return CodecSpec(type, name,
      nameOverride: _codecNameOverride(codec), fieldName: _codecFieldName(codec));
}

/// The literal value of a `Codec.literal('me')` / `.literal('me')` codec, else null.
String? _literalValue(Expression codec) {
  String? fromArgs(String name, ArgumentList args) {
    if (name != 'literal') return null;
    final a = _first(args);
    return a is StringLiteral ? a.stringValue : null;
  }

  return switch (codec) {
    MethodInvocation(methodName: SimpleIdentifier(:final name), :final argumentList) =>
      fromArgs(name, argumentList),
    DotShorthandInvocation(
      memberName: SimpleIdentifier(:final name),
      :final argumentList
    ) =>
      fromArgs(name, argumentList),
    _ => null,
  };
}

/// The `(#name)` override on a codec, whichever AST shape the call took.
String? _codecNameOverride(Expression codec) => switch (codec) {
      FunctionExpressionInvocation(:final argumentList) => _symbolArg(argumentList),
      DotShorthandInvocation(:final argumentList) => _symbolArg(argumentList),
      MethodInvocation(:final argumentList) => _symbolArg(argumentList),
      _ => null,
    };

/// (dartType, isList, branchName) for a codec expression. Handles both
/// `Codec.uuid` (qualified) and `.uuid` (dot-shorthand), and peels a trailing
/// `(#name)` override.
(String, bool, String) _codecType(Expression codec, EnumElement element) {
  // `.uuid(#name)` parsed as get-then-invoke: type comes from the codec itself.
  if (codec is FunctionExpressionInvocation) {
    return _codecType(codec.function, element);
  }
  // `.uuid`
  if (codec is DotShorthandPropertyAccess) {
    final name = codec.propertyName.name;
    return (_staticCodecArg(codec) ?? _builtin(name) ?? 'Object', false, _pascal(name));
  }
  // `.list(...)` / `.enumValues(...)` / `.uuid(#name)` parsed as an invocation.
  if (codec is DotShorthandInvocation) {
    if (_symbolArg(codec.argumentList) != null) {
      final name = codec.memberName.name;
      return (_staticCodecArg(codec) ?? _builtin(name) ?? 'Object', false, _pascal(name));
    }
    return _codecInvocation(codec.memberName.name, codec.argumentList, element);
  }
  switch (codec) {
    case PrefixedIdentifier(identifier: SimpleIdentifier(:final name)):
      return (_staticCodecArg(codec) ?? _builtin(name) ?? 'Object', false, _pascal(name));
    case MethodInvocation(
        methodName: SimpleIdentifier(:final name),
        :final argumentList,
      ):
      // `Codec.uuid(#itemId)` — a `(#name)` override; type rides the codec name.
      if (_symbolArg(argumentList) != null) {
        return (_staticCodecArg(codec) ?? _builtin(name) ?? 'Object', false, _pascal(name));
      }
      return _codecInvocation(name, argumentList, element);
    default:
      return ('Object', false, 'C');
  }
}

(String, bool, String) _codecInvocation(
    String name, ArgumentList argumentList, EnumElement element) {
  if (name == 'list') {
    final (inner, _, innerName) = _codecType(_first(argumentList)!, element);
    return ('List<$inner>', true, 'List$innerName');
  }
  if (name == 'csv') {
    // Scalar value (one token), typed as a list — NOT the repeated-key protocol.
    final (inner, _, innerName) = _codecType(_first(argumentList)!, element);
    return ('List<$inner>', false, 'Csv$innerName');
  }
  if (name == 'enumValues') {
    final arg = _first(argumentList);
    if (arg is PrefixedIdentifier) return (arg.prefix.name, false, arg.prefix.name);
  }
  return ('Object', false, 'C');
}

String? _builtin(String name) => switch (name) {
      'string' || 'uuid' || 'username' || 'raw' => 'String',
      'integer' => 'int',
      'number' => 'double',
      'date' => 'DateTime',
      _ => null,
    };

/// Resolves an unresolved tree expression to its analyzer type — set by
/// [linkEndpoints] from `TreeModel.typeOf` for the duration of one generation
/// (the walk is deeply recursive; a parameter would thread through every hop).
DartType? Function(Expression)? _typeOf;

/// The codec expression's VALUE type from the analyzer (`Codec<T>` → `T`) —
/// works for any codec, custom or battery. Null when unresolved or erased
/// (`Codec<Object?>` id-nodes), which falls back to the [_builtin] name table.
String? _staticCodecArg(Expression codec) {
  final t = _typeOf?.call(codec);
  if (t is! InterfaceType) return null;
  for (final s in [t, ...t.allSupertypes]) {
    if (s.element.name == 'Codec' && s.typeArguments.length == 1) {
      final arg = s.typeArguments.first.getDisplayString();
      return (arg == 'Object?' || arg == 'dynamic') ? null : arg;
    }
  }
  return null;
}

/// Built-in codecs whose own name is meaningful enough to name the field,
/// beating the URL segment (`.username` → `username`). Primitives don't.
const _semanticCodecs = {'uuid', 'username'};

/// The semantic field name a codec carries intrinsically, if any.
String? _codecFieldName(Expression codec) {
  final n = switch (codec) {
    DotShorthandPropertyAccess(:final propertyName) => propertyName.name,
    DotShorthandInvocation(:final memberName) => memberName.name,
    FunctionExpressionInvocation(:final function) => _innerName(function),
    PrefixedIdentifier(:final identifier) => identifier.name,
    MethodInvocation(:final methodName) => methodName.name,
    _ => null,
  };
  return _semanticCodecs.contains(n) ? n : null;
}

String? _innerName(Expression codec) => switch (codec) {
      DotShorthandPropertyAccess(:final propertyName) => propertyName.name,
      DotShorthandInvocation(:final memberName) => memberName.name,
      PrefixedIdentifier(:final identifier) => identifier.name,
      MethodInvocation(:final methodName) => methodName.name,
      _ => null,
    };
