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
    final parameters = <ConstructorParameterParser>[];
    final isConst = constructorElement.isConst;
    for (var parameter in constructorElement.parameters) {
      parameters.add(ConstructorParameterParser(parameter));
    }
    return """
class ${className}Stub extends $className {
  ${isConst ? "const" : ""} ${className}Stub() : super(
    ${parameters.map((e) => e.parse(defaultValues: defaultValues)).join(',\n')}
  );
}
""";
  }
}
