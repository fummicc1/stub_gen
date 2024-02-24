// ignore_for_file: unreachable_from_main

import 'package:stub_kit/annotations.dart';
import 'package:test/test.dart';

import 'nested_test.dart';

part 'nullable_list_test.g.dart';

@Stub()
class NullableListTarget {
  int value;
  List<ChildTarget>? childTarget;

  NullableListTarget(this.value, this.childTarget);
}

void main() {
  test("nullable list constructor", () {
    final target = NullableListTargetStub.stub();
    expect(
      target.childTarget!.first.childValue,
      ChildTargetStub.stub().childValue,
    );
    expect(target.value, 1);
  });
}
