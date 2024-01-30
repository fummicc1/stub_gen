import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:stub_kit/src/parsers/parser.dart';

enum ExpressionType {
  finalExpression,
  constExpression,
}

class ConstructionParameterResult {
  final DartType type;
  final String value;
  final bool shouldCoalesceNull;
  final ExpressionType expressionType;

  ConstructionParameterResult({
    required this.type,
    required this.value,
    required this.shouldCoalesceNull,
    required this.expressionType,
  });
}

ConstructionParameterResult traverseDefaultValueFromDartType({
  required DartType type,
  required Map<String, dynamic> defaultValues,
}) {
  if (type.isPrimitive) {
    final defaultValue = defaultValues[type.toString()];
    if (type.isDartCoreString) {
      return ConstructionParameterResult(
        type: type,
        value: defaultValue == null ? "" : '"$defaultValue"',
        shouldCoalesceNull: false,
        expressionType: ExpressionType.constExpression,
      );
    }
    return ConstructionParameterResult(
      type: type,
      value: defaultValue.toString(),
      shouldCoalesceNull: false,
      expressionType: ExpressionType.constExpression,
    );
  }
  if (type.isDartCoreList) {
    if (type is ParameterizedType) {
      final typeArguments = type.typeArguments;
      if (typeArguments.isNotEmpty) {
        final typeArgument = typeArguments.first;
        final result = traverseDefaultValueFromDartType(
          type: typeArgument,
          defaultValues: defaultValues,
        );
        final value = result.value;
        final expression = result.expressionType;
        return ConstructionParameterResult(
          type: type,
          value: "[$value]",
          shouldCoalesceNull: result.shouldCoalesceNull,
          expressionType: expression,
        );
      }
    } else {
      throw Exception("Not supported type: $type");
    }
  }
  if (type.isDartCoreMap) {
    return ConstructionParameterResult(
      type: type,
      value: "{}",
      shouldCoalesceNull: false,
      expressionType: ExpressionType.constExpression,
    );
  }
  return ConstructionParameterResult(
    type: type,
    value: "${type}Stub.stub()",
    shouldCoalesceNull: true,
    expressionType: ExpressionType.finalExpression,
  );
}

class ConstructorParameterParser with Parser {
  final ParameterElement element;

  ConstructorParameterParser(this.element);

  @override
  String parse({required Map<String, dynamic> defaultValues}) {
    final name = element.name;
    final type = element.type;
    final isNamed = element.isNamed;
    final result = traverseDefaultValueFromDartType(
      type: type,
      defaultValues: defaultValues,
    );
    var value = result.value;

    final resultUsedInArgument = parseForArgument(defaultValues: defaultValues);

    if (resultUsedInArgument.isNotEmpty) {
      final isOptional = result.shouldCoalesceNull;
      print("$type: $isOptional");
      if (isOptional) {
        value = "$name ?? $value";
      } else {
        value = name;
      }
    }

    if (isNamed) {
      return "$name: $value";
    }

    return value;
  }

  @override
  String parseForArgument({required Map<String, dynamic> defaultValues}) {
    final name = element.name;
    final type = element.type;
    final result = traverseDefaultValueFromDartType(
      type: type,
      defaultValues: defaultValues,
    );

    if (result.expressionType == ExpressionType.constExpression) {
      final String valuePrefix;
      if (type.isPrimitive) {
        valuePrefix = "";
      } else {
        valuePrefix = "const ";
      }
      return "$type $name = $valuePrefix${result.value}";
    }
    return "$type? $name";
  }
}

extension DartTypeX on DartType {
  bool get isPrimitive {
    return isDartCoreInt ||
        isDartCoreDouble ||
        isDartCoreString ||
        isDartCoreBool;
  }
}
