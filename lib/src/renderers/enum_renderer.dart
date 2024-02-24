import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class EnumRenderer {
  const EnumRenderer();

  String render({
    required EnumElement element,
    required ConstantReader annotation,
  }) {
    final name = element.name;
    final values = element.fields
        .where((field) => field.isEnumConstant)
        .map((field) => field.name)
        .toList();
    return '''
    extension ${name}Stub on $name {
      static $name stub() => $name.${values.first};
    }
    ''';
  }
}
