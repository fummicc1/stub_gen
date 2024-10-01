import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'empty_constructor_parameter_test.stub.dart';

@StubGen()
class EmptyConstructorParameterTest {
  // ignore: unreachable_from_main
  EmptyConstructorParameterTest();
}

void main() {
  test("target with empty constructor parameter", () {
    final target = EmptyConstructorParameterTestStubBuilder.build();
    expect(target, isNotNull);
  });
}
