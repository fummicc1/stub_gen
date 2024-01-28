import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("make_sample_stub", () {
    const sample = SampleStub();
    expect(sample.name, "stub");
  });
}
