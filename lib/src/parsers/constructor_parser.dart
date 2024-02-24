import 'package:analyzer/dart/element/element.dart';
import 'package:stub_kit/src/default_values.dart';
import 'package:stub_kit/src/parsers/parameter_parser.dart';
import 'package:stub_kit/src/parsers/parser.dart';

class ConstructorParser with Parser {
  final ClassElement classElement;
  final ConstructorElement constructorElement;

  ConstructorParser(this.classElement, this.constructorElement);

  @override
  String parse({required DefaultValues defaultValues}) {
    final className = classElement.name;
    final constructorName = constructorElement.name;
    final isPrivate = constructorName.startsWith("_");
    final parameters = <ParameterParser>[];
    for (final parameter in constructorElement.parameters) {
      parameters.add(ParameterParser(parameter));
    }
    final stubFactory =
        constructorName.isEmpty ? className : "$className.$constructorName";
    final stubConstructorName = isPrivate || constructorName.isEmpty
        ? "stub"
        : "${constructorName}Stub";
    return """
  static $className $stubConstructorName({
    ${parameters.map((e) => e.parseForArgument(defaultValues: defaultValues)).where((element) => element.isNotEmpty).join(',\n')}
  }) => $stubFactory(
    ${parameters.map((e) => e.parse(defaultValues: defaultValues)).join(',\n')}
  );
""";
  }
}
