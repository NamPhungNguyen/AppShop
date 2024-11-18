// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CouponEntity _$CouponEntityFromJson(Map<String, dynamic> json) {
  return _CouponEntity.fromJson(json);
}

/// @nodoc
mixin _$CouponEntity {
  int get id => throw _privateConstructorUsedError;
  String get poolCode => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  String get expiryDate => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get claimed => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get remainingQuantity => throw _privateConstructorUsedError;
  List<ClaimedByUserEntity>? get claimedByUsers =>
      throw _privateConstructorUsedError;

  /// Serializes this CouponEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CouponEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponEntityCopyWith<CouponEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponEntityCopyWith<$Res> {
  factory $CouponEntityCopyWith(
          CouponEntity value, $Res Function(CouponEntity) then) =
      _$CouponEntityCopyWithImpl<$Res, CouponEntity>;
  @useResult
  $Res call(
      {int id,
      String poolCode,
      String code,
      double discountAmount,
      String expiryDate,
      bool active,
      bool claimed,
      int totalQuantity,
      int remainingQuantity,
      List<ClaimedByUserEntity>? claimedByUsers});
}

/// @nodoc
class _$CouponEntityCopyWithImpl<$Res, $Val extends CouponEntity>
    implements $CouponEntityCopyWith<$Res> {
  _$CouponEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poolCode = null,
    Object? code = null,
    Object? discountAmount = null,
    Object? expiryDate = null,
    Object? active = null,
    Object? claimed = null,
    Object? totalQuantity = null,
    Object? remainingQuantity = null,
    Object? claimedByUsers = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      poolCode: null == poolCode
          ? _value.poolCode
          : poolCode // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      claimed: null == claimed
          ? _value.claimed
          : claimed // ignore: cast_nullable_to_non_nullable
              as bool,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      remainingQuantity: null == remainingQuantity
          ? _value.remainingQuantity
          : remainingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      claimedByUsers: freezed == claimedByUsers
          ? _value.claimedByUsers
          : claimedByUsers // ignore: cast_nullable_to_non_nullable
              as List<ClaimedByUserEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponEntityImplCopyWith<$Res>
    implements $CouponEntityCopyWith<$Res> {
  factory _$$CouponEntityImplCopyWith(
          _$CouponEntityImpl value, $Res Function(_$CouponEntityImpl) then) =
      __$$CouponEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String poolCode,
      String code,
      double discountAmount,
      String expiryDate,
      bool active,
      bool claimed,
      int totalQuantity,
      int remainingQuantity,
      List<ClaimedByUserEntity>? claimedByUsers});
}

/// @nodoc
class __$$CouponEntityImplCopyWithImpl<$Res>
    extends _$CouponEntityCopyWithImpl<$Res, _$CouponEntityImpl>
    implements _$$CouponEntityImplCopyWith<$Res> {
  __$$CouponEntityImplCopyWithImpl(
      _$CouponEntityImpl _value, $Res Function(_$CouponEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poolCode = null,
    Object? code = null,
    Object? discountAmount = null,
    Object? expiryDate = null,
    Object? active = null,
    Object? claimed = null,
    Object? totalQuantity = null,
    Object? remainingQuantity = null,
    Object? claimedByUsers = freezed,
  }) {
    return _then(_$CouponEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      poolCode: null == poolCode
          ? _value.poolCode
          : poolCode // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      claimed: null == claimed
          ? _value.claimed
          : claimed // ignore: cast_nullable_to_non_nullable
              as bool,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      remainingQuantity: null == remainingQuantity
          ? _value.remainingQuantity
          : remainingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      claimedByUsers: freezed == claimedByUsers
          ? _value._claimedByUsers
          : claimedByUsers // ignore: cast_nullable_to_non_nullable
              as List<ClaimedByUserEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponEntityImpl implements _CouponEntity {
  const _$CouponEntityImpl(
      {required this.id,
      required this.poolCode,
      required this.code,
      required this.discountAmount,
      required this.expiryDate,
      required this.active,
      required this.claimed,
      required this.totalQuantity,
      required this.remainingQuantity,
      required final List<ClaimedByUserEntity>? claimedByUsers})
      : _claimedByUsers = claimedByUsers;

  factory _$CouponEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String poolCode;
  @override
  final String code;
  @override
  final double discountAmount;
  @override
  final String expiryDate;
  @override
  final bool active;
  @override
  final bool claimed;
  @override
  final int totalQuantity;
  @override
  final int remainingQuantity;
  final List<ClaimedByUserEntity>? _claimedByUsers;
  @override
  List<ClaimedByUserEntity>? get claimedByUsers {
    final value = _claimedByUsers;
    if (value == null) return null;
    if (_claimedByUsers is EqualUnmodifiableListView) return _claimedByUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CouponEntity(id: $id, poolCode: $poolCode, code: $code, discountAmount: $discountAmount, expiryDate: $expiryDate, active: $active, claimed: $claimed, totalQuantity: $totalQuantity, remainingQuantity: $remainingQuantity, claimedByUsers: $claimedByUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poolCode, poolCode) ||
                other.poolCode == poolCode) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.claimed, claimed) || other.claimed == claimed) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.remainingQuantity, remainingQuantity) ||
                other.remainingQuantity == remainingQuantity) &&
            const DeepCollectionEquality()
                .equals(other._claimedByUsers, _claimedByUsers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      poolCode,
      code,
      discountAmount,
      expiryDate,
      active,
      claimed,
      totalQuantity,
      remainingQuantity,
      const DeepCollectionEquality().hash(_claimedByUsers));

  /// Create a copy of CouponEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponEntityImplCopyWith<_$CouponEntityImpl> get copyWith =>
      __$$CouponEntityImplCopyWithImpl<_$CouponEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponEntityImplToJson(
      this,
    );
  }
}

abstract class _CouponEntity implements CouponEntity {
  const factory _CouponEntity(
          {required final int id,
          required final String poolCode,
          required final String code,
          required final double discountAmount,
          required final String expiryDate,
          required final bool active,
          required final bool claimed,
          required final int totalQuantity,
          required final int remainingQuantity,
          required final List<ClaimedByUserEntity>? claimedByUsers}) =
      _$CouponEntityImpl;

  factory _CouponEntity.fromJson(Map<String, dynamic> json) =
      _$CouponEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get poolCode;
  @override
  String get code;
  @override
  double get discountAmount;
  @override
  String get expiryDate;
  @override
  bool get active;
  @override
  bool get claimed;
  @override
  int get totalQuantity;
  @override
  int get remainingQuantity;
  @override
  List<ClaimedByUserEntity>? get claimedByUsers;

  /// Create a copy of CouponEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponEntityImplCopyWith<_$CouponEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClaimedByUserEntity _$ClaimedByUserEntityFromJson(Map<String, dynamic> json) {
  return _ClaimedByUserEntity.fromJson(json);
}

/// @nodoc
mixin _$ClaimedByUserEntity {
  int get id => throw _privateConstructorUsedError;
  bool get used => throw _privateConstructorUsedError;

  /// Serializes this ClaimedByUserEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClaimedByUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimedByUserEntityCopyWith<ClaimedByUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimedByUserEntityCopyWith<$Res> {
  factory $ClaimedByUserEntityCopyWith(
          ClaimedByUserEntity value, $Res Function(ClaimedByUserEntity) then) =
      _$ClaimedByUserEntityCopyWithImpl<$Res, ClaimedByUserEntity>;
  @useResult
  $Res call({int id, bool used});
}

/// @nodoc
class _$ClaimedByUserEntityCopyWithImpl<$Res, $Val extends ClaimedByUserEntity>
    implements $ClaimedByUserEntityCopyWith<$Res> {
  _$ClaimedByUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimedByUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? used = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimedByUserEntityImplCopyWith<$Res>
    implements $ClaimedByUserEntityCopyWith<$Res> {
  factory _$$ClaimedByUserEntityImplCopyWith(_$ClaimedByUserEntityImpl value,
          $Res Function(_$ClaimedByUserEntityImpl) then) =
      __$$ClaimedByUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool used});
}

/// @nodoc
class __$$ClaimedByUserEntityImplCopyWithImpl<$Res>
    extends _$ClaimedByUserEntityCopyWithImpl<$Res, _$ClaimedByUserEntityImpl>
    implements _$$ClaimedByUserEntityImplCopyWith<$Res> {
  __$$ClaimedByUserEntityImplCopyWithImpl(_$ClaimedByUserEntityImpl _value,
      $Res Function(_$ClaimedByUserEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimedByUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? used = null,
  }) {
    return _then(_$ClaimedByUserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimedByUserEntityImpl implements _ClaimedByUserEntity {
  const _$ClaimedByUserEntityImpl({required this.id, required this.used});

  factory _$ClaimedByUserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimedByUserEntityImplFromJson(json);

  @override
  final int id;
  @override
  final bool used;

  @override
  String toString() {
    return 'ClaimedByUserEntity(id: $id, used: $used)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimedByUserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.used, used) || other.used == used));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, used);

  /// Create a copy of ClaimedByUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimedByUserEntityImplCopyWith<_$ClaimedByUserEntityImpl> get copyWith =>
      __$$ClaimedByUserEntityImplCopyWithImpl<_$ClaimedByUserEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimedByUserEntityImplToJson(
      this,
    );
  }
}

abstract class _ClaimedByUserEntity implements ClaimedByUserEntity {
  const factory _ClaimedByUserEntity(
      {required final int id,
      required final bool used}) = _$ClaimedByUserEntityImpl;

  factory _ClaimedByUserEntity.fromJson(Map<String, dynamic> json) =
      _$ClaimedByUserEntityImpl.fromJson;

  @override
  int get id;
  @override
  bool get used;

  /// Create a copy of ClaimedByUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimedByUserEntityImplCopyWith<_$ClaimedByUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
