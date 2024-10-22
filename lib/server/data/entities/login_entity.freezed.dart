// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) {
  return _LoginEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginEntity {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  LoginResultEntity get result => throw _privateConstructorUsedError;

  /// Serializes this LoginEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEntityCopyWith<LoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEntityCopyWith<$Res> {
  factory $LoginEntityCopyWith(
          LoginEntity value, $Res Function(LoginEntity) then) =
      _$LoginEntityCopyWithImpl<$Res, LoginEntity>;
  @useResult
  $Res call({int code, String message, LoginResultEntity result});

  $LoginResultEntityCopyWith<$Res> get result;
}

/// @nodoc
class _$LoginEntityCopyWithImpl<$Res, $Val extends LoginEntity>
    implements $LoginEntityCopyWith<$Res> {
  _$LoginEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEntity
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
              as LoginResultEntity,
    ) as $Val);
  }

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginResultEntityCopyWith<$Res> get result {
    return $LoginResultEntityCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginEntityImplCopyWith<$Res>
    implements $LoginEntityCopyWith<$Res> {
  factory _$$LoginEntityImplCopyWith(
          _$LoginEntityImpl value, $Res Function(_$LoginEntityImpl) then) =
      __$$LoginEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message, LoginResultEntity result});

  @override
  $LoginResultEntityCopyWith<$Res> get result;
}

/// @nodoc
class __$$LoginEntityImplCopyWithImpl<$Res>
    extends _$LoginEntityCopyWithImpl<$Res, _$LoginEntityImpl>
    implements _$$LoginEntityImplCopyWith<$Res> {
  __$$LoginEntityImplCopyWithImpl(
      _$LoginEntityImpl _value, $Res Function(_$LoginEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$LoginEntityImpl(
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
              as LoginResultEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginEntityImpl implements _LoginEntity {
  const _$LoginEntityImpl(
      {required this.code, required this.message, required this.result});

  factory _$LoginEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginEntityImplFromJson(json);

  @override
  final int code;
  @override
  final String message;
  @override
  final LoginResultEntity result;

  @override
  String toString() {
    return 'LoginEntity(code: $code, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result);

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEntityImplCopyWith<_$LoginEntityImpl> get copyWith =>
      __$$LoginEntityImplCopyWithImpl<_$LoginEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginEntityImplToJson(
      this,
    );
  }
}

abstract class _LoginEntity implements LoginEntity {
  const factory _LoginEntity(
      {required final int code,
      required final String message,
      required final LoginResultEntity result}) = _$LoginEntityImpl;

  factory _LoginEntity.fromJson(Map<String, dynamic> json) =
      _$LoginEntityImpl.fromJson;

  @override
  int get code;
  @override
  String get message;
  @override
  LoginResultEntity get result;

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginEntityImplCopyWith<_$LoginEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResultEntity _$LoginResultEntityFromJson(Map<String, dynamic> json) {
  return _LoginResultEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginResultEntity {
  String get token => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;

  /// Serializes this LoginResultEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResultEntityCopyWith<LoginResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResultEntityCopyWith<$Res> {
  factory $LoginResultEntityCopyWith(
          LoginResultEntity value, $Res Function(LoginResultEntity) then) =
      _$LoginResultEntityCopyWithImpl<$Res, LoginResultEntity>;
  @useResult
  $Res call({String token, bool authenticated});
}

/// @nodoc
class _$LoginResultEntityCopyWithImpl<$Res, $Val extends LoginResultEntity>
    implements $LoginResultEntityCopyWith<$Res> {
  _$LoginResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? authenticated = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResultEntityImplCopyWith<$Res>
    implements $LoginResultEntityCopyWith<$Res> {
  factory _$$LoginResultEntityImplCopyWith(_$LoginResultEntityImpl value,
          $Res Function(_$LoginResultEntityImpl) then) =
      __$$LoginResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, bool authenticated});
}

/// @nodoc
class __$$LoginResultEntityImplCopyWithImpl<$Res>
    extends _$LoginResultEntityCopyWithImpl<$Res, _$LoginResultEntityImpl>
    implements _$$LoginResultEntityImplCopyWith<$Res> {
  __$$LoginResultEntityImplCopyWithImpl(_$LoginResultEntityImpl _value,
      $Res Function(_$LoginResultEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? authenticated = null,
  }) {
    return _then(_$LoginResultEntityImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResultEntityImpl implements _LoginResultEntity {
  const _$LoginResultEntityImpl(
      {required this.token, required this.authenticated});

  factory _$LoginResultEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResultEntityImplFromJson(json);

  @override
  final String token;
  @override
  final bool authenticated;

  @override
  String toString() {
    return 'LoginResultEntity(token: $token, authenticated: $authenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResultEntityImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, authenticated);

  /// Create a copy of LoginResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResultEntityImplCopyWith<_$LoginResultEntityImpl> get copyWith =>
      __$$LoginResultEntityImplCopyWithImpl<_$LoginResultEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResultEntityImplToJson(
      this,
    );
  }
}

abstract class _LoginResultEntity implements LoginResultEntity {
  const factory _LoginResultEntity(
      {required final String token,
      required final bool authenticated}) = _$LoginResultEntityImpl;

  factory _LoginResultEntity.fromJson(Map<String, dynamic> json) =
      _$LoginResultEntityImpl.fromJson;

  @override
  String get token;
  @override
  bool get authenticated;

  /// Create a copy of LoginResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResultEntityImplCopyWith<_$LoginResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
