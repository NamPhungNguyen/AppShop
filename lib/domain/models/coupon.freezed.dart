// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  String get poolCode => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  String get expiryDate => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get claimed => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get remainingQuantity => throw _privateConstructorUsedError;
  List<ClaimedByUser>? get claimedByUsers => throw _privateConstructorUsedError;

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
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
      List<ClaimedByUser>? claimedByUsers});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Coupon
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
              as List<ClaimedByUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponImplCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$CouponImplCopyWith(
          _$CouponImpl value, $Res Function(_$CouponImpl) then) =
      __$$CouponImplCopyWithImpl<$Res>;
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
      List<ClaimedByUser>? claimedByUsers});
}

/// @nodoc
class __$$CouponImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponImpl>
    implements _$$CouponImplCopyWith<$Res> {
  __$$CouponImplCopyWithImpl(
      _$CouponImpl _value, $Res Function(_$CouponImpl) _then)
      : super(_value, _then);

  /// Create a copy of Coupon
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
    return _then(_$CouponImpl(
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
              as List<ClaimedByUser>?,
    ));
  }
}

/// @nodoc

class _$CouponImpl implements _Coupon {
  const _$CouponImpl(
      {required this.id,
      required this.poolCode,
      required this.code,
      required this.discountAmount,
      required this.expiryDate,
      required this.active,
      required this.claimed,
      required this.totalQuantity,
      required this.remainingQuantity,
      required final List<ClaimedByUser>? claimedByUsers})
      : _claimedByUsers = claimedByUsers;

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
  final List<ClaimedByUser>? _claimedByUsers;
  @override
  List<ClaimedByUser>? get claimedByUsers {
    final value = _claimedByUsers;
    if (value == null) return null;
    if (_claimedByUsers is EqualUnmodifiableListView) return _claimedByUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Coupon(id: $id, poolCode: $poolCode, code: $code, discountAmount: $discountAmount, expiryDate: $expiryDate, active: $active, claimed: $claimed, totalQuantity: $totalQuantity, remainingQuantity: $remainingQuantity, claimedByUsers: $claimedByUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponImpl &&
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

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      __$$CouponImplCopyWithImpl<_$CouponImpl>(this, _$identity);
}

abstract class _Coupon implements Coupon {
  const factory _Coupon(
      {required final int id,
      required final String poolCode,
      required final String code,
      required final double discountAmount,
      required final String expiryDate,
      required final bool active,
      required final bool claimed,
      required final int totalQuantity,
      required final int remainingQuantity,
      required final List<ClaimedByUser>? claimedByUsers}) = _$CouponImpl;

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
  List<ClaimedByUser>? get claimedByUsers;

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClaimedByUser {
  int get id => throw _privateConstructorUsedError;
  bool get used => throw _privateConstructorUsedError;

  /// Create a copy of ClaimedByUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimedByUserCopyWith<ClaimedByUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimedByUserCopyWith<$Res> {
  factory $ClaimedByUserCopyWith(
          ClaimedByUser value, $Res Function(ClaimedByUser) then) =
      _$ClaimedByUserCopyWithImpl<$Res, ClaimedByUser>;
  @useResult
  $Res call({int id, bool used});
}

/// @nodoc
class _$ClaimedByUserCopyWithImpl<$Res, $Val extends ClaimedByUser>
    implements $ClaimedByUserCopyWith<$Res> {
  _$ClaimedByUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimedByUser
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
abstract class _$$ClaimedByUserImplCopyWith<$Res>
    implements $ClaimedByUserCopyWith<$Res> {
  factory _$$ClaimedByUserImplCopyWith(
          _$ClaimedByUserImpl value, $Res Function(_$ClaimedByUserImpl) then) =
      __$$ClaimedByUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool used});
}

/// @nodoc
class __$$ClaimedByUserImplCopyWithImpl<$Res>
    extends _$ClaimedByUserCopyWithImpl<$Res, _$ClaimedByUserImpl>
    implements _$$ClaimedByUserImplCopyWith<$Res> {
  __$$ClaimedByUserImplCopyWithImpl(
      _$ClaimedByUserImpl _value, $Res Function(_$ClaimedByUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimedByUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? used = null,
  }) {
    return _then(_$ClaimedByUserImpl(
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

class _$ClaimedByUserImpl implements _ClaimedByUser {
  const _$ClaimedByUserImpl({required this.id, required this.used});

  @override
  final int id;
  @override
  final bool used;

  @override
  String toString() {
    return 'ClaimedByUser(id: $id, used: $used)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimedByUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.used, used) || other.used == used));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, used);

  /// Create a copy of ClaimedByUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimedByUserImplCopyWith<_$ClaimedByUserImpl> get copyWith =>
      __$$ClaimedByUserImplCopyWithImpl<_$ClaimedByUserImpl>(this, _$identity);
}

abstract class _ClaimedByUser implements ClaimedByUser {
  const factory _ClaimedByUser(
      {required final int id, required final bool used}) = _$ClaimedByUserImpl;

  @override
  int get id;
  @override
  bool get used;

  /// Create a copy of ClaimedByUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimedByUserImplCopyWith<_$ClaimedByUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
