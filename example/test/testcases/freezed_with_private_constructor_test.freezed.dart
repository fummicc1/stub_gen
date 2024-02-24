// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_with_private_constructor_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreezedWithPrivateConstructor {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreezedWithPrivateConstructorCopyWith<FreezedWithPrivateConstructor>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedWithPrivateConstructorCopyWith<$Res> {
  factory $FreezedWithPrivateConstructorCopyWith(
          FreezedWithPrivateConstructor value,
          $Res Function(FreezedWithPrivateConstructor) then) =
      _$FreezedWithPrivateConstructorCopyWithImpl<$Res,
          FreezedWithPrivateConstructor>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$FreezedWithPrivateConstructorCopyWithImpl<$Res,
        $Val extends FreezedWithPrivateConstructor>
    implements $FreezedWithPrivateConstructorCopyWith<$Res> {
  _$FreezedWithPrivateConstructorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreezedWithPrivateConstructorImplCopyWith<$Res>
    implements $FreezedWithPrivateConstructorCopyWith<$Res> {
  factory _$$FreezedWithPrivateConstructorImplCopyWith(
          _$FreezedWithPrivateConstructorImpl value,
          $Res Function(_$FreezedWithPrivateConstructorImpl) then) =
      __$$FreezedWithPrivateConstructorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$FreezedWithPrivateConstructorImplCopyWithImpl<$Res>
    extends _$FreezedWithPrivateConstructorCopyWithImpl<$Res,
        _$FreezedWithPrivateConstructorImpl>
    implements _$$FreezedWithPrivateConstructorImplCopyWith<$Res> {
  __$$FreezedWithPrivateConstructorImplCopyWithImpl(
      _$FreezedWithPrivateConstructorImpl _value,
      $Res Function(_$FreezedWithPrivateConstructorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$FreezedWithPrivateConstructorImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FreezedWithPrivateConstructorImpl
    extends _FreezedWithPrivateConstructor {
  _$FreezedWithPrivateConstructorImpl({this.value = 100}) : super._();

  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'FreezedWithPrivateConstructor(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezedWithPrivateConstructorImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezedWithPrivateConstructorImplCopyWith<
          _$FreezedWithPrivateConstructorImpl>
      get copyWith => __$$FreezedWithPrivateConstructorImplCopyWithImpl<
          _$FreezedWithPrivateConstructorImpl>(this, _$identity);
}

abstract class _FreezedWithPrivateConstructor
    extends FreezedWithPrivateConstructor {
  factory _FreezedWithPrivateConstructor({final int value}) =
      _$FreezedWithPrivateConstructorImpl;
  _FreezedWithPrivateConstructor._() : super._();

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$FreezedWithPrivateConstructorImplCopyWith<
          _$FreezedWithPrivateConstructorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
