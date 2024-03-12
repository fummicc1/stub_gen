import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stub_gen/annotations.dart';
import 'package:stub_gen/stubbables.dart';
import 'package:test/test.dart';

part 'freezed_with_private_constructor_test.freezed.dart';
part 'freezed_with_private_constructor_test.g.dart';

@StubGen(defaultValues: {StubbableTypes.int: 100})
@freezed
class FreezedWithPrivateConstructor with _$FreezedWithPrivateConstructor {
  factory FreezedWithPrivateConstructor({
    @Default(100) int value,
  }) = _FreezedWithPrivateConstructor;

  const FreezedWithPrivateConstructor._();
}

void main() {
  group('FreezedWithPrivateConstructor', () {
    test('succeed to make a stub', () {
      final stub = FreezedWithPrivateConstructorStub.stub();
      expect(stub.value, equals(100));
    });
  });
}
