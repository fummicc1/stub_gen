import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:stub_kit/src/parsers/parser.dart';

enum ExpressionType {
  finalExpression,
  constExpression,
  normalExpression,
}

(String, ExpressionType) traverseDefaultValueFromDartType({
  required DartType type,
  required Map<String, dynamic> defaultValues,
}) {
  if (type.isDartCoreInt ||
      type.isDartCoreDouble ||
      type.isDartCoreString ||
      type.isDartCoreBool) {
    final defaultValue = defaultValues[type.toString()];
    if (type.isDartCoreString) {
      return ('"$defaultValue"', ExpressionType.constExpression);
    }
    return ("$defaultValue", ExpressionType.constExpression);
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
          final (value, expression) = traverseDefaultValueFromDartType(
            type: typeArgument,
            defaultValues: defaultValues,
          );
          return (
            """
[
  $value
]
""",
            expression
          );
        }
        if (typeArgument.isDartCoreList || typeArgument.isDartCoreMap) {
          final (value, expression) = traverseDefaultValueFromDartType(
            type: typeArgument,
            defaultValues: defaultValues,
          );
          return (
            """
[
  $value
]
""",
            expression
          );
        }
      }
    } else {
      throw Exception("Not supported type: $type");
    }
  }
  if (type.isDartCoreMap) {
    return (
      """
{}
""",
      ExpressionType.constExpression
    );
  }
  return ("${type}Stub.stub()", ExpressionType.finalExpression);
}

class ConstructorParameterParser with Parser {
  final ParameterElement element;

  ConstructorParameterParser(this.element);

  @override
  String parse({required Map<String, dynamic> defaultValues}) {
    final name = element.name;
    final type = element.type;
    final isNamed = element.isNamed;
    var (value, _) = traverseDefaultValueFromDartType(
      type: type,
      defaultValues: defaultValues,
    );

    if (parseForArgument(defaultValues: defaultValues).isNotEmpty) {
      value = name;
    }

    if (isNamed) {
      return """
$name: $value
""";
    }

    return value;
  }

  @override
  String parseForArgument({required Map<String, dynamic> defaultValues}) {
    final name = element.name;
    final type = element.type;
    final (value, expression) = traverseDefaultValueFromDartType(
      type: type,
      defaultValues: defaultValues,
    );

    if (expression == ExpressionType.constExpression) {
      final String valuePrefix;
      if (type.isDartCoreInt ||
          type.isDartCoreDouble ||
          type.isDartCoreString ||
          type.isDartCoreBool) {
        valuePrefix = "";
      } else {
        valuePrefix = "const";
      }
      return """
$type $name = $valuePrefix $value
""";
    }
    return "";
  }
}
