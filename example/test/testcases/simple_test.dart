import 'package:stub_kit/annotations.dart';
import 'package:test/test.dart';

part 'simple_test.g.dart';

@Stub()
class Target {
  int intVariable;
  String stringVariable;
  double doubleVariable;
  bool boolVariable;

  Target(
    this.intVariable,
    this.stringVariable,
    this.doubleVariable,
    this.boolVariable,
  );
}

void main() {
  test("constructor without named and positioned parameters", () {
    final target = TargetStub();
    expect(target.boolVariable, false);
    expect(target.doubleVariable, 1.0);
    expect(target.intVariable, 1);
    expect(target.stringVariable, "stub");
  });
}
