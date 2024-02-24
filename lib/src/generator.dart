import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:stub_kit/annotations.dart';
import 'package:stub_kit/src/renderers/class_renderer.dart';
import 'package:stub_kit/src/renderers/enum_renderer.dart';
import 'package:stub_kit/stubbables.dart';

// Generate a stub class
class StubGenerator extends GeneratorForAnnotation<Stub> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final stub = annotation.objectValue;
    final stubbableDefaultValues = stub
            .getField('defaultValues')
            ?.toMapValue()
            ?.cast<DartObject, DartObject>() ??
        {};
    final defaultValues = {
      StubbableTypes.int.typeName: 1,
      StubbableTypes.double.typeName: 1.0,
      StubbableTypes.string.typeName: "stub",
      StubbableTypes.bool.typeName: false,
      StubbableTypes.dateTime.typeName: DateTime(2024).toIso8601String(),
    };
    for (final key in stubbableDefaultValues.keys) {
      if (stubbableDefaultValues[key] != null) {
        final stubbableDartObject = stubbableDefaultValues[key]!;
        final caseName = key.variable?.name;
        final stubbableType = StubbableTypes.values
            .where(
              (element) => element.name == caseName,
            )
            .firstOrNull;
        if (stubbableType != null) {
          final stubbableValue = stubbableType.extractActualValueAsObject(
            object: stubbableDartObject,
          );
          if (stubbableValue != null) {
            defaultValues[stubbableType.typeName] = stubbableValue;
          }
        }
      }
    }
    if (element is ClassElement) {
      return const ClassRenderer().render(
        element: element,
        annotation: annotation,
        defaultValues: defaultValues,
      );
    }
    if (element is EnumElement) {
      return const EnumRenderer().render(
        element: element,
        annotation: annotation,
      );
    }
    throw Exception("Not supported element: $element");
  }
}
