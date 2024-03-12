// ignore_for_file: unreachable_from_main

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'freezed_test.freezed.dart';
part 'freezed_test.g.dart';
part 'freezed_test.stub.dart';

@StubGen()
@freezed
class FreezedTarget with _$FreezedTarget {
  factory FreezedTarget({
    required String owner,
    required String name,
    required String content,
  }) = _FreezedTarget;

  factory FreezedTarget.fromJson(Map<String, dynamic> json) =>
      _$FreezedTargetFromJson(json);
}

void main() {
  test("target with freezed annotation", () {
    final target = FreezedTargetStub.stub();
    expect(target.owner, "stub");
    expect(target.name, "stub");
    expect(target.content, "stub");

    final targetFromJson = FreezedTargetStub.fromJsonStub(
      json: {
        "owner": "stub",
        "name": "stub",
        "content": "stub",
      },
    );
    expect(targetFromJson.owner, "stub");
    expect(targetFromJson.name, "stub");
    expect(targetFromJson.content, "stub");
  });
}
