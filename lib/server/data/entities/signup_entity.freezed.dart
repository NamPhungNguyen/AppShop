// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpEntity _$SignUpEntityFromJson(Map<String, dynamic> json) {
  return _SignUpEntity.fromJson(json);
}

/// @nodoc
mixin _$SignUpEntity {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SignUpResultEntity get result => throw _privateConstructorUsedError;

  /// Serializes this SignUpEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpEntityCopyWith<SignUpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEntityCopyWith<$Res> {
  factory $SignUpEntityCopyWith(
          SignUpEntity value, $Res Function(SignUpEntity) then) =
      _$SignUpEntityCopyWithImpl<$Res, SignUpEntity>;
  @useResult
  $Res call({int code, String message, SignUpResultEntity result});

  $SignUpResultEntityCopyWith<$Res> get result;
}

/// @nodoc
class _$SignUpEntityCopyWithImpl<$Res, $Val extends SignUpEntity>
    implements $SignUpEntityCopyWith<$Res> {
  _$SignUpEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
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
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SignUpResultEntity,
    ) as $Val);
  }

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignUpResultEntityCopyWith<$Res> get result {
    return $SignUpResultEntityCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpEntityImplCopyWith<$Res>
    implements $SignUpEntityCopyWith<$Res> {
  factory _$$SignUpEntityImplCopyWith(
          _$SignUpEntityImpl value, $Res Function(_$SignUpEntityImpl) then) =
      __$$SignUpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message, SignUpResultEntity result});

  @override
  $SignUpResultEntityCopyWith<$Res> get result;
}

/// @nodoc
class __$$SignUpEntityImplCopyWithImpl<$Res>
    extends _$SignUpEntityCopyWithImpl<$Res, _$SignUpEntityImpl>
    implements _$$SignUpEntityImplCopyWith<$Res> {
  __$$SignUpEntityImplCopyWithImpl(
      _$SignUpEntityImpl _value, $Res Function(_$SignUpEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$SignUpEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SignUpResultEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpEntityImpl implements _SignUpEntity {
  const _$SignUpEntityImpl(
      {required this.code, required this.message, required this.result});

  factory _$SignUpEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpEntityImplFromJson(json);

  @override
  final int code;
  @override
  final String message;
  @override
  final SignUpResultEntity result;

  @override
  String toString() {
    return 'SignUpEntity(code: $code, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result);

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEntityImplCopyWith<_$SignUpEntityImpl> get copyWith =>
      __$$SignUpEntityImplCopyWithImpl<_$SignUpEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpEntityImplToJson(
      this,
    );
  }
}

abstract class _SignUpEntity implements SignUpEntity {
  const factory _SignUpEntity(
      {required final int code,
      required final String message,
      required final SignUpResultEntity result}) = _$SignUpEntityImpl;

  factory _SignUpEntity.fromJson(Map<String, dynamic> json) =
      _$SignUpEntityImpl.fromJson;

  @override
  int get code;
  @override
  String get message;
  @override
  SignUpResultEntity get result;

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpEntityImplCopyWith<_$SignUpEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpResultEntity _$SignUpResultEntityFromJson(Map<String, dynamic> json) {
  return _SignUpResultEntity.fromJson(json);
}

/// @nodoc
mixin _$SignUpResultEntity {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this SignUpResultEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpResultEntityCopyWith<SignUpResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResultEntityCopyWith<$Res> {
  factory $SignUpResultEntityCopyWith(
          SignUpResultEntity value, $Res Function(SignUpResultEntity) then) =
      _$SignUpResultEntityCopyWithImpl<$Res, SignUpResultEntity>;
  @useResult
  $Res call(
      {int id,
      String username,
      String fullName,
      String email,
      String phoneNumber});
}

/// @nodoc
class _$SignUpResultEntityCopyWithImpl<$Res, $Val extends SignUpResultEntity>
    implements $SignUpResultEntityCopyWith<$Res> {
  _$SignUpResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? fullName = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpResultEntityImplCopyWith<$Res>
    implements $SignUpResultEntityCopyWith<$Res> {
  factory _$$SignUpResultEntityImplCopyWith(_$SignUpResultEntityImpl value,
          $Res Function(_$SignUpResultEntityImpl) then) =
      __$$SignUpResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String fullName,
      String email,
      String phoneNumber});
}

/// @nodoc
class __$$SignUpResultEntityImplCopyWithImpl<$Res>
    extends _$SignUpResultEntityCopyWithImpl<$Res, _$SignUpResultEntityImpl>
    implements _$$SignUpResultEntityImplCopyWith<$Res> {
  __$$SignUpResultEntityImplCopyWithImpl(_$SignUpResultEntityImpl _value,
      $Res Function(_$SignUpResultEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? fullName = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$SignUpResultEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpResultEntityImpl implements _SignUpResultEntity {
  const _$SignUpResultEntityImpl(
      {required this.id,
      required this.username,
      required this.fullName,
      required this.email,
      required this.phoneNumber});

  factory _$SignUpResultEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpResultEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignUpResultEntity(id: $id, username: $username, fullName: $fullName, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpResultEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, fullName, email, phoneNumber);

  /// Create a copy of SignUpResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpResultEntityImplCopyWith<_$SignUpResultEntityImpl> get copyWith =>
      __$$SignUpResultEntityImplCopyWithImpl<_$SignUpResultEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpResultEntityImplToJson(
      this,
    );
  }
}

abstract class _SignUpResultEntity implements SignUpResultEntity {
  const factory _SignUpResultEntity(
      {required final int id,
      required final String username,
      required final String fullName,
      required final String email,
      required final String phoneNumber}) = _$SignUpResultEntityImpl;

  factory _SignUpResultEntity.fromJson(Map<String, dynamic> json) =
      _$SignUpResultEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get fullName;
  @override
  String get email;
  @override
  String get phoneNumber;

  /// Create a copy of SignUpResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpResultEntityImplCopyWith<_$SignUpResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
