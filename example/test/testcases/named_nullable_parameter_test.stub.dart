// coverage:ignore-file
// ignore_for_file: type=lint

part of 'named_nullable_parameter_test.dart';

// **************************************************************************
// StubGenerator
// **************************************************************************

extension CustomClassStubBuilder on CustomClass {
  static CustomClass build({String? name = "stub"}) =>
      CustomClass(name: name ?? "stub");
}

extension MainClassStubBuilder on MainClass {
  static MainClass build({CustomClass? customClass}) =>
      MainClass(customClass: customClass ?? CustomClassStubBuilder.build());
}
