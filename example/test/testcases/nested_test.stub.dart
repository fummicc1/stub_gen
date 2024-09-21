// coverage:ignore-file
// ignore_for_file: type=lint

part of 'nested_test.dart';

// **************************************************************************
// StubGenerator
// **************************************************************************

extension TargetStubBuilder on Target {
  static Target build({int value = 100, ChildTarget? childTarget}) =>
      Target(value ?? 100, childTarget ?? ChildTargetStub.stub());
}

extension ChildTargetStubBuilder on ChildTarget {
  static ChildTarget build({int childValue = 100}) =>
      ChildTarget(childValue ?? 100);
}
