import 'package:stub_kit/annotations.dart';
import 'package:test/test.dart';

part 'named_test.g.dart';

@Stub()
class NamedTest {
  final String name;

  const NamedTest({required this.name});
}

void main() {
  test("constructor with named parameters", () {
    final namedTest = NamedTestStub();
    expect(namedTest.name, "stub");
  });
}
