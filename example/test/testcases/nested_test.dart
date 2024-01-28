import 'package:stub_kit/annotations.dart';
import 'package:test/test.dart';

part 'nested_test.g.dart';

@Stub()
class Target {
  int value;
  ChildTarget childTarget;

  Target(this.value, this.childTarget);
}

@Stub()
class ChildTarget {
  final int childValue;

  const ChildTarget(this.childValue);
}

void main() {
  test("", () {
    final target = TargetStub.stub();
    expect(target.childTarget.childValue, ChildTargetStub.stub().childValue);
    expect(target.value, 1);
  });
}
