// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidateEntity _$ValidateEntityFromJson(Map<String, dynamic> json) {
  return _ValidateEntity.fromJson(json);
}

/// @nodoc
mixin _$ValidateEntity {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ValidateEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidateEntityCopyWith<ValidateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateEntityCopyWith<$Res> {
  factory $ValidateEntityCopyWith(
          ValidateEntity value, $Res Function(ValidateEntity) then) =
      _$ValidateEntityCopyWithImpl<$Res, ValidateEntity>;
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class _$ValidateEntityCopyWithImpl<$Res, $Val extends ValidateEntity>
    implements $ValidateEntityCopyWith<$Res> {
  _$ValidateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidateEntityImplCopyWith<$Res>
    implements $ValidateEntityCopyWith<$Res> {
  factory _$$ValidateEntityImplCopyWith(_$ValidateEntityImpl value,
          $Res Function(_$ValidateEntityImpl) then) =
      __$$ValidateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class __$$ValidateEntityImplCopyWithImpl<$Res>
    extends _$ValidateEntityCopyWithImpl<$Res, _$ValidateEntityImpl>
    implements _$$ValidateEntityImplCopyWith<$Res> {
  __$$ValidateEntityImplCopyWithImpl(
      _$ValidateEntityImpl _value, $Res Function(_$ValidateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$ValidateEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateEntityImpl implements _ValidateEntity {
  const _$ValidateEntityImpl({required this.code, required this.message});

  factory _$ValidateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidateEntityImplFromJson(json);

  @override
  final int code;
  @override
  final String message;

  @override
  String toString() {
    return 'ValidateEntity(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of ValidateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateEntityImplCopyWith<_$ValidateEntityImpl> get copyWith =>
      __$$ValidateEntityImplCopyWithImpl<_$ValidateEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateEntityImplToJson(
      this,
    );
  }
}

abstract class _ValidateEntity implements ValidateEntity {
  const factory _ValidateEntity(
      {required final int code,
      required final String message}) = _$ValidateEntityImpl;

  factory _ValidateEntity.fromJson(Map<String, dynamic> json) =
      _$ValidateEntityImpl.fromJson;

  @override
  int get code;
  @override
  String get message;

  /// Create a copy of ValidateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateEntityImplCopyWith<_$ValidateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
