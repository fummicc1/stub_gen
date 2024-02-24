// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezedTargetImpl _$$FreezedTargetImplFromJson(Map<String, dynamic> json) =>
    _$FreezedTargetImpl(
      owner: json['owner'] as String,
      name: json['name'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$FreezedTargetImplToJson(_$FreezedTargetImpl instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'name': instance.name,
      'content': instance.content,
    };

// **************************************************************************
// StubGenerator
// **************************************************************************

extension FreezedTargetStub on FreezedTarget {
  static FreezedTarget stub(
          {String owner = "stub",
          String name = "stub",
          String content = "stub"}) =>
      FreezedTarget(
          owner: owner ?? "stub",
          name: name ?? "stub",
          content: content ?? "stub");

  static FreezedTarget fromJsonStub({Map<String, dynamic> json = const {}}) =>
      FreezedTarget.fromJson(json ?? {});
}
