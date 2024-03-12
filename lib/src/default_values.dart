import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:stub_gen/stubbables.dart';

class DefaultValues {
  final Map<String, dynamic> _defaultValues = {};
  final Map<String, String> _renderedDefaultValues = {};

  DefaultValues._({
    required Map<String, dynamic> defaultValues,
    required Map<String, String> renderedDefaultValues,
  }) {
    _defaultValues.addAll(defaultValues);
    _renderedDefaultValues.addAll(renderedDefaultValues);
  }

  String? findDefaultValue(DartType type) {
    final typeRawName = type.toString();
    // if type is nullable, use default value of the non-nullable type
    final isNullable = typeRawName.endsWith("?");
    final typeName = isNullable
        ? typeRawName.substring(0, typeRawName.length - 1)
        : typeRawName;
    return _renderedDefaultValues[typeName];
  }

  factory DefaultValues.make({
    required Map<DartObject, DartObject> inputDefaultValues,
  }) {
    final defaultValues = {
      StubbableTypes.int.typeName: 1,
      StubbableTypes.double.typeName: 1.0,
      StubbableTypes.string.typeName: "stub",
      StubbableTypes.bool.typeName: false,
      StubbableTypes.dateTime.typeName: DateTime(2024).toIso8601String(),
    };
    final renderedDefaultValues = defaultValues.map(
      (key, value) => MapEntry(
        key,
        StubbableTypes.values
            .where((element) => element.typeName == key)
            .first
            .render(value),
      ),
    );
    for (final key in inputDefaultValues.keys) {
      final inputTypeName = key.variable?.name;
      final dartObject = inputDefaultValues[key];
      if (dartObject != null) {
        final stubbable = StubbableTypes.values
            .where(
              (element) => inputTypeName?.startsWith(element.name) == true,
            )
            .firstOrNull;
        if (stubbable != null) {
          final value = stubbable.extractActualValueAsObject(
            object: dartObject,
          );
          if (value != null) {
            defaultValues[stubbable.typeName] = value;
            renderedDefaultValues[stubbable.typeName] = stubbable.render(value);
          }
        }
      }
    }
    return DefaultValues._(
      defaultValues: defaultValues,
      renderedDefaultValues: renderedDefaultValues,
    );
  }
}
