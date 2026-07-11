import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:canon/canon.dart' show Canon;
import 'package:source_gen/source_gen.dart';

import 'entities_generator.dart';
import 'ids_generator.dart';
import 'links_generator.dart';
import 'nav_generator.dart';
import 'registry_generator.dart';

/// Whether [el]'s supertype closure carries the node mixin [mixinName] — the
/// tier test. The mixin is the source of truth; annotations only say
/// "generate here".
bool wearsNode(InterfaceElement el, String mixinName) =>
    el.allSupertypes.any((t) => t.element.name == mixinName);

/// The `@canon` generator: ONE mark for every spec enum, dispatched on the
/// row mixin — [IdsGenerator] for `IdNode`, [EntitiesGenerator] for
/// `EntityNode`, [RegistryGenerator] for `RegentNode`, [NavGenerator] for
/// `ScreenNodeBase` (the enum holding the `NavGraph`; graph-less screen
/// families are grafted and generate nothing of their own), and
/// [LinksGenerator] for `LinkNode` address trees.
class CanonGenerator extends GeneratorForAnnotation<Canon> {
  @override
  Future<String?> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    // The REGENCY: `@canon const app = Regency({...})` — the app's state
    // tier as a const value; [RegistryGenerator] emits its data surface.
    if (element is TopLevelVariableElement) {
      final t = element.type;
      final isRegency = t is InterfaceType &&
          (t.element.name == 'Regency' ||
              t.allSupertypes.any((s) => s.element.name == 'Regency'));
      if (!isRegency) {
        throw InvalidGenerationSourceError(
            '@canon on a variable must hold a `Regency` (the app graph).',
            element: element);
      }
      return RegistryGenerator().generateForGraph(element, buildStep);
    }
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError('@canon must annotate an enum',
          element: element);
    }
    if (wearsNode(element, 'IdNode')) {
      return IdsGenerator()
          .generateForAnnotatedElement(element, annotation, buildStep);
    }
    if (wearsNode(element, 'EntityNode')) {
      return EntitiesGenerator()
          .generateForAnnotatedElement(element, annotation, buildStep);
    }
    if (wearsNode(element, 'RegentNode')) {
      throw InvalidGenerationSourceError(
          'the @regents enum retired — declare the ledger as a const value: '
          '`@canon const app = Regency({...}, merges: {...});` (rows keep '
          'their order; store names derive from the row classes).',
          element: element);
    }
    if (wearsNode(element, 'ScreenNodeBase')) {
      final hasGraph =
          element.fields.any((f) => f.isStatic && f.name == 'graph');
      if (!hasGraph) return null; // a grafted family — the main tree spans it
      return NavGenerator()
          .generateForAnnotatedElement(element, annotation, buildStep);
    }
    if (wearsNode(element, 'SegBase') || wearsNode(element, 'LinkNode')) {
      return LinksGenerator()
          .generateForAnnotatedElement(element, annotation, buildStep);
    }
    throw InvalidGenerationSourceError(
        '@canon enum "${element.name}" carries no spec mixin — expected one '
        'of IdNode, EntityNode, RegentNode, ScreenNode, or SegBase',
        element: element);
  }
}
