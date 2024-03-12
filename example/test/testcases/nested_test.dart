import 'package:stub_gen/annotations.dart';
import 'package:stub_gen/stubbables.dart';
import 'package:test/test.dart';

part 'nested_test.g.dart';

@Stub(
  defaultValues: {
    StubbableTypes.int: 100,
  },
)
class Target {
  int value;
  ChildTarget childTarget;

  Target(this.value, this.childTarget);
}

@Stub(
  defaultValues: {
    StubbableTypes.int: 100,
  },
)
class ChildTarget {
  final int childValue;

  const ChildTarget(this.childValue);
}

void main() {
  test("nested object constructor", () {
    final target = TargetStub.stub();
    expect(target.childTarget.childValue, ChildTargetStub.stub().childValue);
    expect(target.value, 100);
  });
}
