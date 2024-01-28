// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FreezedTarget _$FreezedTargetFromJson(Map<String, dynamic> json) {
  return _FreezedTarget.fromJson(json);
}

/// @nodoc
mixin _$FreezedTarget {
  String get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezedTargetCopyWith<FreezedTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedTargetCopyWith<$Res> {
  factory $FreezedTargetCopyWith(
          FreezedTarget value, $Res Function(FreezedTarget) then) =
      _$FreezedTargetCopyWithImpl<$Res, FreezedTarget>;
  @useResult
  $Res call({String owner, String name, String content});
}

/// @nodoc
class _$FreezedTargetCopyWithImpl<$Res, $Val extends FreezedTarget>
    implements $FreezedTargetCopyWith<$Res> {
  _$FreezedTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? name = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreezedTargetImplCopyWith<$Res>
    implements $FreezedTargetCopyWith<$Res> {
  factory _$$FreezedTargetImplCopyWith(
          _$FreezedTargetImpl value, $Res Function(_$FreezedTargetImpl) then) =
      __$$FreezedTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String owner, String name, String content});
}

/// @nodoc
class __$$FreezedTargetImplCopyWithImpl<$Res>
    extends _$FreezedTargetCopyWithImpl<$Res, _$FreezedTargetImpl>
    implements _$$FreezedTargetImplCopyWith<$Res> {
  __$$FreezedTargetImplCopyWithImpl(
      _$FreezedTargetImpl _value, $Res Function(_$FreezedTargetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? name = null,
    Object? content = null,
  }) {
    return _then(_$FreezedTargetImpl(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreezedTargetImpl implements _FreezedTarget {
  _$FreezedTargetImpl(
      {required this.owner, required this.name, required this.content});

  factory _$FreezedTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezedTargetImplFromJson(json);

  @override
  final String owner;
  @override
  final String name;
  @override
  final String content;

  @override
  String toString() {
    return 'FreezedTarget(owner: $owner, name: $name, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezedTargetImpl &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, owner, name, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezedTargetImplCopyWith<_$FreezedTargetImpl> get copyWith =>
      __$$FreezedTargetImplCopyWithImpl<_$FreezedTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezedTargetImplToJson(
      this,
    );
  }
}

abstract class _FreezedTarget implements FreezedTarget {
  factory _FreezedTarget(
      {required final String owner,
      required final String name,
      required final String content}) = _$FreezedTargetImpl;

  factory _FreezedTarget.fromJson(Map<String, dynamic> json) =
      _$FreezedTargetImpl.fromJson;

  @override
  String get owner;
  @override
  String get name;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$FreezedTargetImplCopyWith<_$FreezedTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
