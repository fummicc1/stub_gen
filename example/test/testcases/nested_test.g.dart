// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_test.dart';

// **************************************************************************
// StubGenerator
// **************************************************************************

extension TargetStub on Target {
  static Target stub({int value = 1, ChildTarget? childTarget}) =>
      Target(value, childTarget ?? ChildTargetStub.stub());
}

extension ChildTargetStub on ChildTarget {
  static ChildTarget stub({int childValue = 1}) => ChildTarget(childValue);
}
