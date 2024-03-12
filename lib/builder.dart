import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:stub_gen/src/generator.dart';

Builder stubBuilder(BuilderOptions options) => PartBuilder(
      [StubGenerator()],
      ".stub.dart",
      options: options,
    );
