import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:stub_kit/src/parsers/parser.dart';
import 'package:stub_kit/stubbables.dart';

enum ExpressionType {
  finalExpression,
  constExpression,
}

class ParameterParseResult {
  final DartType type;
  final String defaultValue;
  final String? nullCoalescingValue;
  final bool shouldCoalesceNull;
  final ExpressionType expressionType;

  ParameterParseResult({
    required this.type,
    required this.defaultValue,
    required this.nullCoalescingValue,
    required this.shouldCoalesceNull,
    required this.expressionType,
  });
}

ParameterParseResult traverseDefaultValueFromDartType({
  required DartType type,
  required Map<String, dynamic> defaultValues,
}) {
  final defaultValue = defaultValues[type.toString()];
  if (type.isPrimitive) {
    if (type.isDartCoreString) {
      return ParameterParseResult(
        type: type,
        defaultValue: defaultValue == null ? "" : '"$defaultValue"',
        nullCoalescingValue: null,
        shouldCoalesceNull: false,
        expressionType: ExpressionType.constExpression,
      );
    }
    return ParameterParseResult(
      type: type,
      defaultValue: defaultValue.toString(),
      nullCoalescingValue: null,
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
        final defaultValue = result.defaultValue;
        final nullCoalescingValue = result.nullCoalescingValue;
        final expression = result.expressionType;
        return ParameterParseResult(
          type: type,
          defaultValue: defaultValue.isNotEmpty ? "[$defaultValue]" : "",
          nullCoalescingValue:
              nullCoalescingValue != null ? "[$nullCoalescingValue]" : null,
          shouldCoalesceNull: nullCoalescingValue != null,
          expressionType: expression,
        );
      }
    } else {
      throw Exception("Not supported type: $type");
    }
  }
  if (type.isDartCoreMap) {
    return ParameterParseResult(
      type: type,
      defaultValue: "{}",
      nullCoalescingValue: null,
      shouldCoalesceNull: false,
      expressionType: ExpressionType.constExpression,
    );
  }
  if (type.toString().contains(StubbableTypes.dateTime.typeName)) {
    return ParameterParseResult(
      type: type,
      defaultValue: """DateTime.parse("$defaultValue")""",
      nullCoalescingValue: null,
      shouldCoalesceNull: false,
      expressionType: ExpressionType.finalExpression,
    );
  }
  // pattern1: type? name
  // pattern2: required type name
  if (defaultValues[type.toString()] != null) {
    final defaultValue = defaultValues[type.toString()];
    return ParameterParseResult(
      type: type,
      defaultValue: defaultValue.toString(),
      nullCoalescingValue: null,
      shouldCoalesceNull: false,
      expressionType: ExpressionType.finalExpression,
    );
  }
  return ParameterParseResult(
    type: type,
    defaultValue: "",
    nullCoalescingValue: "${type}Stub.stub()",
    shouldCoalesceNull: true,
    expressionType: ExpressionType.finalExpression,
  );
}

class ParameterParser with Parser {
  final ParameterElement element;

  ParameterParser(this.element);

  @override
  String parse({required Map<String, dynamic> defaultValues}) {
    final name = element.name;
    final type = element.type;
    final isNamed = element.isNamed;
    final result = traverseDefaultValueFromDartType(
      type: type,
      defaultValues: defaultValues,
    );
    final defaultValue = result.defaultValue;
    final nullCoalescingValue = result.nullCoalescingValue;
    var value = name;

    final resultUsedInArgument = parseForArgument(defaultValues: defaultValues);

    if (resultUsedInArgument.isNotEmpty) {
      if (defaultValue.isNotEmpty) {
        value += " ?? $defaultValue";
      }
      if (result.shouldCoalesceNull) {
        value += " ?? $nullCoalescingValue";
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
      return "$type $name = $valuePrefix${result.defaultValue}";
    }
    if (type.isNullable) {
      return "$type $name";
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

  bool get isNullable {
    return toString().endsWith("?");
  }
}
