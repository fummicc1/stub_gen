import 'package:stub_kit/annotations.dart';
import 'package:test/test.dart';

part 'private_constructor_test.g.dart';

@Stub()
class ObjectWithPrivateConstructor {
  ObjectWithPrivateConstructor._(this.value);

  final int value;
}

void main() {
  group('ObjectWithPrivateConstructor', () {
    test('succeed to make a stub', () {
      final stub = ObjectWithPrivateConstructorStub.stub();
      expect(stub.value, equals(1));
    });
  });
}
