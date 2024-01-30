import 'package:analyzer/dart/element/element.dart';
import 'package:stub_kit/src/parsers/constructor_parameter_parser.dart';
import 'package:stub_kit/src/parsers/parser.dart';

class ConstructorParser with Parser {
  final ClassElement classElement;
  final ConstructorElement constructorElement;

  ConstructorParser(this.classElement, this.constructorElement);

  @override
  String parse({required Map<String, dynamic> defaultValues}) {
    final className = classElement.name;
    final constructorName = constructorElement.name;
    if (constructorName.startsWith("_")) {
      return "";
    }
    final parameters = <ConstructorParameterParser>[];
    for (final parameter in constructorElement.parameters) {
      parameters.add(ConstructorParameterParser(parameter));
    }
    return """
  static $className ${constructorName.isEmpty ? "stub" : "${constructorName}Stub"}({
    ${parameters.map((e) => e.parseForArgument(defaultValues: defaultValues)).where((element) => element.isNotEmpty).join(',\n')}
  }) => $className${constructorName.isEmpty ? "" : ".$constructorName"}(
    ${parameters.map((e) => e.parse(defaultValues: defaultValues)).join(',\n')}
  );
""";
  }
}
