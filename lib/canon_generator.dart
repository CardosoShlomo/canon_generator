import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/nav_generator.dart';
import 'src/registry_generator.dart';

export 'src/registry_generator.dart' show RegistryGenerator;

Builder navBuilder(BuilderOptions options) =>
    PartBuilder([NavGenerator(), RegistryGenerator()], '.nav.dart');
