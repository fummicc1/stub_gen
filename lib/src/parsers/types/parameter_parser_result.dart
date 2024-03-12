import 'package:analyzer/dart/element/type.dart';
import 'package:stub_gen/src/parsers/types/expression_type.dart';

class ParameterParseResult {
  final DartType type;
  final String? defaultValue;
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
