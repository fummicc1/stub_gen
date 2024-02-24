import 'package:analyzer/dart/constant/value.dart';

enum StubbableTypes {
  int,
  double,
  string,
  bool,
  dateTime,
}

extension StubbableTypesExtension on StubbableTypes {
  String get typeName {
    switch (this) {
      case StubbableTypes.int:
        return "int";
      case StubbableTypes.double:
        return "double";
      case StubbableTypes.string:
        return "String";
      case StubbableTypes.bool:
        return "bool";
      case StubbableTypes.dateTime:
        return "DateTime";
    }
  }

  Object? extractActualValueAsObject({required DartObject object}) {
    switch (this) {
      case StubbableTypes.int:
        return object.toIntValue();
      case StubbableTypes.double:
        return object.toDoubleValue();
      case StubbableTypes.string:
        return object.toStringValue();
      case StubbableTypes.bool:
        return object.toBoolValue();
      case StubbableTypes.dateTime:
        // String of ISO8601Format
        return object.toStringValue();
    }
  }

  String render(Object value) {
    switch (this) {
      case StubbableTypes.int:
        return value.toString();
      case StubbableTypes.double:
        return value.toString();
      case StubbableTypes.string:
        return '"$value"';
      case StubbableTypes.bool:
        return value.toString();
      case StubbableTypes.dateTime:
        return 'DateTime.parse("$value")';
    }
  }
}
