import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:stub_kit/annotations.dart';
import 'package:stub_kit/src/parsers/constructor_parser.dart';
import 'package:stub_kit/src/parsers/constructor_parameter_parser.dart';

// Generate a stub class
class StubGenerator extends GeneratorForAnnotation<Stub> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw Exception("Not supported element: $element");
    }
    final stub = annotation.objectValue;
    final defaultValues = {
      "int": stub.getField("intDefault")?.toIntValue() ?? 1,
      "double": stub.getField("doubleDefault")?.toDoubleValue() ?? 1.0,
      "String": stub.getField("stringDefault")?.toStringValue() ?? "stub",
      "bool": stub.getField("boolDefault")?.toBoolValue() ?? false,
    };
    final constructorParsers = <ConstructorParser>[];
    for (var constructorElement in element.children) {
      if (constructorElement is ConstructorElement) {
        constructorParsers.add(ConstructorParser(element, constructorElement));
      }
    }
    return constructorParsers
        .map((e) => e.parse(defaultValues: defaultValues))
        .join('\n');
  }
}
