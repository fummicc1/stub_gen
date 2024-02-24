import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:stub_kit/src/parsers/constructor_parser.dart';

class ClassRenderer {
  const ClassRenderer();

  String render({
    required ClassElement element,
    required ConstantReader annotation,
    required Map<String, Object> defaultValues,
  }) {
    final className = element.name;
    print("defaultValues: $defaultValues");
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
