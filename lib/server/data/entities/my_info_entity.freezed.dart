// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyInfoEntity _$MyInfoEntityFromJson(Map<String, dynamic> json) {
  return _MyInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$MyInfoEntity {
  ResultInfo get result => throw _privateConstructorUsedError;

  /// Serializes this MyInfoEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyInfoEntityCopyWith<MyInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyInfoEntityCopyWith<$Res> {
  factory $MyInfoEntityCopyWith(
          MyInfoEntity value, $Res Function(MyInfoEntity) then) =
      _$MyInfoEntityCopyWithImpl<$Res, MyInfoEntity>;
  @useResult
  $Res call({ResultInfo result});

  $ResultInfoCopyWith<$Res> get result;
}

/// @nodoc
class _$MyInfoEntityCopyWithImpl<$Res, $Val extends MyInfoEntity>
    implements $MyInfoEntityCopyWith<$Res> {
  _$MyInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultInfo,
    ) as $Val);
  }

  /// Create a copy of MyInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultInfoCopyWith<$Res> get result {
    return $ResultInfoCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyInfoEntityImplCopyWith<$Res>
    implements $MyInfoEntityCopyWith<$Res> {
  factory _$$MyInfoEntityImplCopyWith(
          _$MyInfoEntityImpl value, $Res Function(_$MyInfoEntityImpl) then) =
      __$$MyInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResultInfo result});

  @override
  $ResultInfoCopyWith<$Res> get result;
}

/// @nodoc
class __$$MyInfoEntityImplCopyWithImpl<$Res>
    extends _$MyInfoEntityCopyWithImpl<$Res, _$MyInfoEntityImpl>
    implements _$$MyInfoEntityImplCopyWith<$Res> {
  __$$MyInfoEntityImplCopyWithImpl(
      _$MyInfoEntityImpl _value, $Res Function(_$MyInfoEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$MyInfoEntityImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyInfoEntityImpl implements _MyInfoEntity {
  const _$MyInfoEntityImpl({required this.result});

  factory _$MyInfoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyInfoEntityImplFromJson(json);

  @override
  final ResultInfo result;

  @override
  String toString() {
    return 'MyInfoEntity(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyInfoEntityImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of MyInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyInfoEntityImplCopyWith<_$MyInfoEntityImpl> get copyWith =>
      __$$MyInfoEntityImplCopyWithImpl<_$MyInfoEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyInfoEntityImplToJson(
      this,
    );
  }
}

abstract class _MyInfoEntity implements MyInfoEntity {
  const factory _MyInfoEntity({required final ResultInfo result}) =
      _$MyInfoEntityImpl;

  factory _MyInfoEntity.fromJson(Map<String, dynamic> json) =
      _$MyInfoEntityImpl.fromJson;

  @override
  ResultInfo get result;

  /// Create a copy of MyInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyInfoEntityImplCopyWith<_$MyInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultInfo _$ResultInfoFromJson(Map<String, dynamic> json) {
  return _ResultInfo.fromJson(json);
}

/// @nodoc
mixin _$ResultInfo {
  int get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profileImg => throw _privateConstructorUsedError;

  /// Serializes this ResultInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultInfoCopyWith<ResultInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultInfoCopyWith<$Res> {
  factory $ResultInfoCopyWith(
          ResultInfo value, $Res Function(ResultInfo) then) =
      _$ResultInfoCopyWithImpl<$Res, ResultInfo>;
  @useResult
  $Res call(
      {int id,
      String? username,
      String? fullName,
      String? email,
      String? phoneNumber,
      String? profileImg});
}

/// @nodoc
class _$ResultInfoCopyWithImpl<$Res, $Val extends ResultInfo>
    implements $ResultInfoCopyWith<$Res> {
  _$ResultInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profileImg = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultInfoImplCopyWith<$Res>
    implements $ResultInfoCopyWith<$Res> {
  factory _$$ResultInfoImplCopyWith(
          _$ResultInfoImpl value, $Res Function(_$ResultInfoImpl) then) =
      __$$ResultInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? username,
      String? fullName,
      String? email,
      String? phoneNumber,
      String? profileImg});
}

/// @nodoc
class __$$ResultInfoImplCopyWithImpl<$Res>
    extends _$ResultInfoCopyWithImpl<$Res, _$ResultInfoImpl>
    implements _$$ResultInfoImplCopyWith<$Res> {
  __$$ResultInfoImplCopyWithImpl(
      _$ResultInfoImpl _value, $Res Function(_$ResultInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profileImg = freezed,
  }) {
    return _then(_$ResultInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultInfoImpl implements _ResultInfo {
  const _$ResultInfoImpl(
      {required this.id,
      this.username,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.profileImg});

  factory _$ResultInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String? username;
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? profileImg;

  @override
  String toString() {
    return 'ResultInfo(id: $id, username: $username, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, profileImg: $profileImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, username, fullName, email, phoneNumber, profileImg);

  /// Create a copy of ResultInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultInfoImplCopyWith<_$ResultInfoImpl> get copyWith =>
      __$$ResultInfoImplCopyWithImpl<_$ResultInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultInfoImplToJson(
      this,
    );
  }
}

abstract class _ResultInfo implements ResultInfo {
  const factory _ResultInfo(
      {required final int id,
      final String? username,
      final String? fullName,
      final String? email,
      final String? phoneNumber,
      final String? profileImg}) = _$ResultInfoImpl;

  factory _ResultInfo.fromJson(Map<String, dynamic> json) =
      _$ResultInfoImpl.fromJson;

  @override
  int get id;
  @override
  String? get username;
  @override
  String? get fullName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get profileImg;

  /// Create a copy of ResultInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultInfoImplCopyWith<_$ResultInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
