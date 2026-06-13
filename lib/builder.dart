import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/nav_generator.dart';

Builder navBuilder(BuilderOptions options) => PartBuilder([NavGenerator()], '.nav.dart');
