// coverage:ignore-file
// ignore_for_file: type=lint

part of 'primitive_test.dart';

// **************************************************************************
// StubGenerator
// **************************************************************************

extension IntTargetStubBuilder on IntTarget {
  static IntTarget build({int value = 1234}) => IntTarget(value ?? 1234);
}

extension StringTargetStubBuilder on StringTarget {
  static StringTarget build({String value = "Hello World"}) =>
      StringTarget(value ?? "Hello World");
}

extension DoubleTargetStubBuilder on DoubleTarget {
  static DoubleTarget build({double value = 1.0}) => DoubleTarget(value ?? 1.0);
}

extension BoolTargetStubBuilder on BoolTarget {
  static BoolTarget build({bool value = false}) => BoolTarget(value ?? false);
}

extension ListTargetStubBuilder on ListTarget {
  static ListTarget build(
          {List<int> value = const [123456], List<BoolTarget>? boolTargets}) =>
      ListTarget(
          value ?? [123456], boolTargets ?? [BoolTargetStubBuilder.build()]);
}
