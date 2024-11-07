// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUp {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SignUpResult get result => throw _privateConstructorUsedError;

  /// Create a copy of SignUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpCopyWith<SignUp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpCopyWith<$Res> {
  factory $SignUpCopyWith(SignUp value, $Res Function(SignUp) then) =
      _$SignUpCopyWithImpl<$Res, SignUp>;
  @useResult
  $Res call({int code, String message, SignUpResult result});

  $SignUpResultCopyWith<$Res> get result;
}

/// @nodoc
class _$SignUpCopyWithImpl<$Res, $Val extends SignUp>
    implements $SignUpCopyWith<$Res> {
  _$SignUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUp
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
              as SignUpResult,
    ) as $Val);
  }

  /// Create a copy of SignUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignUpResultCopyWith<$Res> get result {
    return $SignUpResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpImplCopyWith<$Res> implements $SignUpCopyWith<$Res> {
  factory _$$SignUpImplCopyWith(
          _$SignUpImpl value, $Res Function(_$SignUpImpl) then) =
      __$$SignUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message, SignUpResult result});

  @override
  $SignUpResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$SignUpImplCopyWithImpl<$Res>
    extends _$SignUpCopyWithImpl<$Res, _$SignUpImpl>
    implements _$$SignUpImplCopyWith<$Res> {
  __$$SignUpImplCopyWithImpl(
      _$SignUpImpl _value, $Res Function(_$SignUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$SignUpImpl(
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
              as SignUpResult,
    ));
  }
}

/// @nodoc

class _$SignUpImpl implements _SignUp {
  const _$SignUpImpl(
      {required this.code, required this.message, required this.result});

  @override
  final int code;
  @override
  final String message;
  @override
  final SignUpResult result;

  @override
  String toString() {
    return 'SignUp(code: $code, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, result);

  /// Create a copy of SignUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpImplCopyWith<_$SignUpImpl> get copyWith =>
      __$$SignUpImplCopyWithImpl<_$SignUpImpl>(this, _$identity);
}

abstract class _SignUp implements SignUp {
  const factory _SignUp(
      {required final int code,
      required final String message,
      required final SignUpResult result}) = _$SignUpImpl;

  @override
  int get code;
  @override
  String get message;
  @override
  SignUpResult get result;

  /// Create a copy of SignUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpImplCopyWith<_$SignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpResult {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Create a copy of SignUpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpResultCopyWith<SignUpResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResultCopyWith<$Res> {
  factory $SignUpResultCopyWith(
          SignUpResult value, $Res Function(SignUpResult) then) =
      _$SignUpResultCopyWithImpl<$Res, SignUpResult>;
  @useResult
  $Res call(
      {int id,
      String username,
      String fullName,
      String email,
      String phoneNumber});
}

/// @nodoc
class _$SignUpResultCopyWithImpl<$Res, $Val extends SignUpResult>
    implements $SignUpResultCopyWith<$Res> {
  _$SignUpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpResult
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
abstract class _$$SignUpResultImplCopyWith<$Res>
    implements $SignUpResultCopyWith<$Res> {
  factory _$$SignUpResultImplCopyWith(
          _$SignUpResultImpl value, $Res Function(_$SignUpResultImpl) then) =
      __$$SignUpResultImplCopyWithImpl<$Res>;
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
class __$$SignUpResultImplCopyWithImpl<$Res>
    extends _$SignUpResultCopyWithImpl<$Res, _$SignUpResultImpl>
    implements _$$SignUpResultImplCopyWith<$Res> {
  __$$SignUpResultImplCopyWithImpl(
      _$SignUpResultImpl _value, $Res Function(_$SignUpResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpResult
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
    return _then(_$SignUpResultImpl(
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

class _$SignUpResultImpl implements _SignUpResult {
  const _$SignUpResultImpl(
      {required this.id,
      required this.username,
      required this.fullName,
      required this.email,
      required this.phoneNumber});

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
    return 'SignUpResult(id: $id, username: $username, fullName: $fullName, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, fullName, email, phoneNumber);

  /// Create a copy of SignUpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpResultImplCopyWith<_$SignUpResultImpl> get copyWith =>
      __$$SignUpResultImplCopyWithImpl<_$SignUpResultImpl>(this, _$identity);
}

abstract class _SignUpResult implements SignUpResult {
  const factory _SignUpResult(
      {required final int id,
      required final String username,
      required final String fullName,
      required final String email,
      required final String phoneNumber}) = _$SignUpResultImpl;

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

  /// Create a copy of SignUpResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpResultImplCopyWith<_$SignUpResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
