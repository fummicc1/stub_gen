import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'named_test.stub.dart';

@StubGen()
class NamedTest {
  final String name;

  const NamedTest({required this.name});
}

void main() {
  test("constructor with named parameters", () {
    final namedTest = NamedTestStubBuilder.build();
    expect(namedTest.name, "stub");
  });
}
