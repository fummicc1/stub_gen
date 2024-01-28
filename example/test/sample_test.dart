import 'package:test/test.dart';
import 'package:example/sample.dart';

void main() {
  test("make_sample_stub", () {
    final sample = SampleStub();
    expect(sample.name, "stub");
  });
}
