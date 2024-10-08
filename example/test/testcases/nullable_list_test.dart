// ignore_for_file: unreachable_from_main

import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

import 'nested_test.dart';

part 'nullable_list_test.stub.dart';

@StubGen()
class NullableListTarget {
  int value;
  List<ChildTarget>? childTarget;

  NullableListTarget(this.value, this.childTarget);
}

void main() {
  test("nullable list constructor", () {
    final target = NullableListTargetStubBuilder.build();
    expect(
      target.childTarget!.first.childValue,
      ChildTargetStubBuilder.build().childValue,
    );
    expect(target.value, 1);
  });
}
