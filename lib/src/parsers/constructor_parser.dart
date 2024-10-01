import 'package:analyzer/dart/element/element.dart';
import 'package:stub_gen/src/default_values.dart';
import 'package:stub_gen/src/parsers/parameter_parser.dart';
import 'package:stub_gen/src/parsers/parser.dart';

class ConstructorParser with Parser {
  final ClassElement classElement;
  final ConstructorElement constructorElement;

  ConstructorParser(this.classElement, this.constructorElement);

  @override
  String parse({required DefaultValues defaultValues}) {
    final isFreezed = classElement.metadata.any(
      (e) => e.toSource().contains("freezed"),
    );
    final className = classElement.name;
    final constructorName = constructorElement.name;
    final isPrivate = constructorName.startsWith("_");
    // as for freezed, there is no way to create a stub for private constructor.
    // developer uses private constructor for freezed to declare getter field for the class.
    if (isFreezed && isPrivate) {
      return "";
    }
    final parameters = <ParameterParser>[];
    for (final parameter in constructorElement.parameters) {
      parameters.add(ParameterParser(parameter));
    }
    final stubFactory =
        constructorName.isEmpty ? className : "$className.$constructorName";
    final stubConstructorName = isPrivate || constructorName.isEmpty
        ? "build"
        : "buildWith${constructorName[0].toUpperCase() + constructorName.substring(1)}";
    final renderForArguments = parameters.map(
      (e) => e.parseForArgument(defaultValues: defaultValues),
    );
    final renderForFactory = parameters.map(
      (e) => e.parse(defaultValues: defaultValues),
    );
    if (renderForArguments.length != parameters.length ||
        renderForFactory.length != parameters.length) {
      return "";
    }
    // if there is no parameter, use default constructor.
    if (renderForArguments.isEmpty) {
      return """
  static $className $stubConstructorName() => $stubFactory();
""";
    }
    return """
  static $className $stubConstructorName({
    ${renderForArguments.join(',\n')}
  }) => $stubFactory(
    ${renderForFactory.join(',\n')}
  );
""";
  }
}
