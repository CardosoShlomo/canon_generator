import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/entities_generator.dart';
import 'src/ids_generator.dart';
import 'src/nav_generator.dart';
import 'src/registry_generator.dart';

export 'src/entities_generator.dart' show EntitiesGenerator;
export 'src/ids_generator.dart' show IdsGenerator;
export 'src/registry_generator.dart' show RegistryGenerator;

Builder navBuilder(BuilderOptions options) => PartBuilder(
    [IdsGenerator(), EntitiesGenerator(), NavGenerator(), RegistryGenerator()],
    '.canon.dart');
