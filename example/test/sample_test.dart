import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("make_sample_stub", () {
    final sample = SampleStub.stub(name: 'fummicc1');
    expect(sample.name, "fummicc1");
    expect(sample.initial, "F");
  });
}
