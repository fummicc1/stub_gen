import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("make_sample_stub", () {
    final sample = SampleStub.stub();
    expect(sample.name, "stub");
  });
}
