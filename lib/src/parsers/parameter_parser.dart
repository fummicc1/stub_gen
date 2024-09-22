import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:stub_gen/src/default_values.dart';
import 'package:stub_gen/src/parsers/parser.dart';
import 'package:stub_gen/src/parsers/types/expression_type.dart';
import 'package:stub_gen/src/parsers/types/parameter_parser_result.dart';

ParameterParseResult traverseDefaultValueFromDartType({
  required DartType type,
  required DefaultValues defaultValues,
}) {
  final defaultValue = defaultValues.findDefaultValue(
    type,
  );
  if (type.isPrimitive) {
    return ParameterParseResult(
      type: type,
      defaultValue: defaultValue,
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
          defaultValue: defaultValue != null ? "[$defaultValue]" : null,
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
  if (defaultValue != null) {
    return ParameterParseResult(
      type: type,
      defaultValue: defaultValue,
      nullCoalescingValue: null,
      shouldCoalesceNull: false,
      expressionType: ExpressionType.finalExpression,
    );
  }
  // if type is not supported, assume that it has own stub.
  return ParameterParseResult(
    type: type,
    defaultValue: null,
    nullCoalescingValue:
        "${type.getDisplayString(withNullability: false)}StubBuilder.build()",
    shouldCoalesceNull: true,
    expressionType: ExpressionType.finalExpression,
  );
}

class ParameterParser with Parser {
  final ParameterElement element;

  ParameterParser(this.element);

  @override
  String parse({required DefaultValues defaultValues}) {
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
      if (defaultValue != null) {
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
  String parseForArgument({required DefaultValues defaultValues}) {
    final name = element.name;
    final type = element.type;
    final result = traverseDefaultValueFromDartType(
      type: type,
      defaultValues: defaultValues,
    );
    final defaultValue = result.defaultValue;
    if (defaultValue != null) {
      if (result.expressionType == ExpressionType.constExpression) {
        final String valuePrefix;
        if (type.isPrimitive) {
          valuePrefix = "";
        } else {
          valuePrefix = "const ";
        }
        return "$type $name = $valuePrefix${result.defaultValue}";
      }
    }
    if (type.isNullable) {
      return "$type $name";
    }
    return "$type? $name";
  }
}

extension DartTypeExtension on DartType {
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
