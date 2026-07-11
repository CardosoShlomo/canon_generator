import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/canon_mark.dart';
import 'src/entities_generator.dart';
import 'src/ids_generator.dart';
import 'src/nav_generator.dart';

export 'src/canon_mark.dart' show CanonGenerator;
export 'src/entities_generator.dart' show EntitiesGenerator;
export 'src/ids_generator.dart' show IdsGenerator;
export 'src/registry_generator.dart' show RegistryGenerator;

Builder navBuilder(BuilderOptions options) => PartBuilder([
      CanonGenerator(),
      // The tier annotations, kept as deprecated aliases of `@canon`.
      IdsGenerator(),
      EntitiesGenerator(),
      NavGenerator(),
    ], '.canon.dart');
