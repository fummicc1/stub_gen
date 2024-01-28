import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:stub_kit/src/parsers/parser.dart';

String traverseDefaultValueFromDartType(
    {required DartType type, required Map<String, dynamic> defaultValues}) {
  if (type.isDartCoreInt ||
      type.isDartCoreDouble ||
      type.isDartCoreString ||
      type.isDartCoreBool) {
    final defaultValue = defaultValues[type.toString()];
    if (type.isDartCoreString) {
      return "\"$defaultValue\"";
    }
    return "$defaultValue";
  }
  if (type.isDartCoreList) {
    if (type is ParameterizedType) {
      final typeArguments = type.typeArguments;
      if (typeArguments.isNotEmpty) {
        final typeArgument = typeArguments.first;
        if (typeArgument.isDartCoreInt ||
            typeArgument.isDartCoreDouble ||
            typeArgument.isDartCoreString ||
            typeArgument.isDartCoreBool) {
          return """
[
  ${traverseDefaultValueFromDartType(
            type: typeArgument,
            defaultValues: defaultValues,
          )}
]
""";
        }
        if (typeArgument.isDartCoreList || typeArgument.isDartCoreMap) {
          return """
[
  ${traverseDefaultValueFromDartType(
            type: typeArgument,
            defaultValues: defaultValues,
          )}
]
""";
        }
      }
    } else {
      throw Exception("Not supported type: $type");
    }
  }
  if (type.isDartCoreMap) {
    return """
{}
""";
  }
  return "${type}Stub()";
}

class ConstructorParameterParser with Parser {
  final ParameterElement element;

  ConstructorParameterParser(this.element);

  @override
  String parse({required Map<String, dynamic> defaultValues}) {
    final name = element.name;
    final type = element.type;
    final isNamed = element.isNamed;
    final value = traverseDefaultValueFromDartType(
        type: type, defaultValues: defaultValues);

    if (isNamed) {
      return """
$name: $value
""";
    }

    return value;
  }
}
