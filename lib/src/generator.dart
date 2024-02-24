import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:stub_kit/annotations.dart';
import 'package:stub_kit/src/default_values.dart';
import 'package:stub_kit/src/renderers/class_renderer.dart';
import 'package:stub_kit/src/renderers/enum_renderer.dart';

// Generate a stub class
class StubGenerator extends GeneratorForAnnotation<Stub> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final stub = annotation.objectValue;
    final inputDefaultValues = stub
            .getField('defaultValues')
            ?.toMapValue()
            ?.cast<DartObject, DartObject>() ??
        {};
    final defaultValues = DefaultValues.make(
      inputDefaultValues: inputDefaultValues,
    );
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
