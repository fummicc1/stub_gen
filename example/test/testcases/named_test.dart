import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'named_test.g.dart';

@Stub()
class NamedTest {
  final String name;

  const NamedTest({required this.name});
}

void main() {
  test("constructor with named parameters", () {
    final namedTest = NamedTestStub.stub();
    expect(namedTest.name, "stub");
  });
}
