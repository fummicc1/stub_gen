import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:stub_kit/src/parsers/constructor_parser.dart';

class ClassRenderer {
  const ClassRenderer();

  String render({
    required ClassElement element,
    required ConstantReader annotation,
  }) {
    final className = element.name;
    final stub = annotation.objectValue;
    final defaultValues = {
      "int": stub.getField("intDefault")?.toIntValue() ?? 1,
      "double": stub.getField("doubleDefault")?.toDoubleValue() ?? 1.0,
      "String": stub.getField("stringDefault")?.toStringValue() ?? "stub",
      "bool": stub.getField("boolDefault")?.toBoolValue() ?? false,
    };
    final constructorParsers = <ConstructorParser>[];
    for (final constructorElement in element.children) {
      if (constructorElement is ConstructorElement) {
        constructorParsers.add(ConstructorParser(element, constructorElement));
      }
    }
    return """
extension ${className}Stub on $className {
  ${constructorParsers.map((e) => e.parse(defaultValues: defaultValues)).join('\n')}
}
""";
  }
}
