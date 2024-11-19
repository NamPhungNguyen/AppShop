// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_apply_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CouponApplyEntity _$CouponApplyEntityFromJson(Map<String, dynamic> json) {
  return _CouponApplyEntity.fromJson(json);
}

/// @nodoc
mixin _$CouponApplyEntity {
  CouponResultEntity get result => throw _privateConstructorUsedError;

  /// Serializes this CouponApplyEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CouponApplyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponApplyEntityCopyWith<CouponApplyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponApplyEntityCopyWith<$Res> {
  factory $CouponApplyEntityCopyWith(
          CouponApplyEntity value, $Res Function(CouponApplyEntity) then) =
      _$CouponApplyEntityCopyWithImpl<$Res, CouponApplyEntity>;
  @useResult
  $Res call({CouponResultEntity result});

  $CouponResultEntityCopyWith<$Res> get result;
}

/// @nodoc
class _$CouponApplyEntityCopyWithImpl<$Res, $Val extends CouponApplyEntity>
    implements $CouponApplyEntityCopyWith<$Res> {
  _$CouponApplyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponApplyEntity
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
              as CouponResultEntity,
    ) as $Val);
  }

  /// Create a copy of CouponApplyEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponResultEntityCopyWith<$Res> get result {
    return $CouponResultEntityCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CouponApplyEntityImplCopyWith<$Res>
    implements $CouponApplyEntityCopyWith<$Res> {
  factory _$$CouponApplyEntityImplCopyWith(_$CouponApplyEntityImpl value,
          $Res Function(_$CouponApplyEntityImpl) then) =
      __$$CouponApplyEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CouponResultEntity result});

  @override
  $CouponResultEntityCopyWith<$Res> get result;
}

/// @nodoc
class __$$CouponApplyEntityImplCopyWithImpl<$Res>
    extends _$CouponApplyEntityCopyWithImpl<$Res, _$CouponApplyEntityImpl>
    implements _$$CouponApplyEntityImplCopyWith<$Res> {
  __$$CouponApplyEntityImplCopyWithImpl(_$CouponApplyEntityImpl _value,
      $Res Function(_$CouponApplyEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponApplyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CouponApplyEntityImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CouponResultEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponApplyEntityImpl implements _CouponApplyEntity {
  const _$CouponApplyEntityImpl({required this.result});

  factory _$CouponApplyEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponApplyEntityImplFromJson(json);

  @override
  final CouponResultEntity result;

  @override
  String toString() {
    return 'CouponApplyEntity(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponApplyEntityImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of CouponApplyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponApplyEntityImplCopyWith<_$CouponApplyEntityImpl> get copyWith =>
      __$$CouponApplyEntityImplCopyWithImpl<_$CouponApplyEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponApplyEntityImplToJson(
      this,
    );
  }
}

abstract class _CouponApplyEntity implements CouponApplyEntity {
  const factory _CouponApplyEntity({required final CouponResultEntity result}) =
      _$CouponApplyEntityImpl;

  factory _CouponApplyEntity.fromJson(Map<String, dynamic> json) =
      _$CouponApplyEntityImpl.fromJson;

  @override
  CouponResultEntity get result;

  /// Create a copy of CouponApplyEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponApplyEntityImplCopyWith<_$CouponApplyEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CouponResultEntity _$CouponResultEntityFromJson(Map<String, dynamic> json) {
  return _CouponResultEntity.fromJson(json);
}

/// @nodoc
mixin _$CouponResultEntity {
  double get totalAfterDiscount => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  double get totalBeforeDiscount => throw _privateConstructorUsedError;

  /// Serializes this CouponResultEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CouponResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponResultEntityCopyWith<CouponResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponResultEntityCopyWith<$Res> {
  factory $CouponResultEntityCopyWith(
          CouponResultEntity value, $Res Function(CouponResultEntity) then) =
      _$CouponResultEntityCopyWithImpl<$Res, CouponResultEntity>;
  @useResult
  $Res call(
      {double totalAfterDiscount,
      double discountAmount,
      double totalBeforeDiscount});
}

/// @nodoc
class _$CouponResultEntityCopyWithImpl<$Res, $Val extends CouponResultEntity>
    implements $CouponResultEntityCopyWith<$Res> {
  _$CouponResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAfterDiscount = null,
    Object? discountAmount = null,
    Object? totalBeforeDiscount = null,
  }) {
    return _then(_value.copyWith(
      totalAfterDiscount: null == totalAfterDiscount
          ? _value.totalAfterDiscount
          : totalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalBeforeDiscount: null == totalBeforeDiscount
          ? _value.totalBeforeDiscount
          : totalBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponResultEntityImplCopyWith<$Res>
    implements $CouponResultEntityCopyWith<$Res> {
  factory _$$CouponResultEntityImplCopyWith(_$CouponResultEntityImpl value,
          $Res Function(_$CouponResultEntityImpl) then) =
      __$$CouponResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalAfterDiscount,
      double discountAmount,
      double totalBeforeDiscount});
}

/// @nodoc
class __$$CouponResultEntityImplCopyWithImpl<$Res>
    extends _$CouponResultEntityCopyWithImpl<$Res, _$CouponResultEntityImpl>
    implements _$$CouponResultEntityImplCopyWith<$Res> {
  __$$CouponResultEntityImplCopyWithImpl(_$CouponResultEntityImpl _value,
      $Res Function(_$CouponResultEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAfterDiscount = null,
    Object? discountAmount = null,
    Object? totalBeforeDiscount = null,
  }) {
    return _then(_$CouponResultEntityImpl(
      totalAfterDiscount: null == totalAfterDiscount
          ? _value.totalAfterDiscount
          : totalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalBeforeDiscount: null == totalBeforeDiscount
          ? _value.totalBeforeDiscount
          : totalBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponResultEntityImpl implements _CouponResultEntity {
  const _$CouponResultEntityImpl(
      {required this.totalAfterDiscount,
      required this.discountAmount,
      required this.totalBeforeDiscount});

  factory _$CouponResultEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponResultEntityImplFromJson(json);

  @override
  final double totalAfterDiscount;
  @override
  final double discountAmount;
  @override
  final double totalBeforeDiscount;

  @override
  String toString() {
    return 'CouponResultEntity(totalAfterDiscount: $totalAfterDiscount, discountAmount: $discountAmount, totalBeforeDiscount: $totalBeforeDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponResultEntityImpl &&
            (identical(other.totalAfterDiscount, totalAfterDiscount) ||
                other.totalAfterDiscount == totalAfterDiscount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.totalBeforeDiscount, totalBeforeDiscount) ||
                other.totalBeforeDiscount == totalBeforeDiscount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalAfterDiscount, discountAmount, totalBeforeDiscount);

  /// Create a copy of CouponResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponResultEntityImplCopyWith<_$CouponResultEntityImpl> get copyWith =>
      __$$CouponResultEntityImplCopyWithImpl<_$CouponResultEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponResultEntityImplToJson(
      this,
    );
  }
}

abstract class _CouponResultEntity implements CouponResultEntity {
  const factory _CouponResultEntity(
      {required final double totalAfterDiscount,
      required final double discountAmount,
      required final double totalBeforeDiscount}) = _$CouponResultEntityImpl;

  factory _CouponResultEntity.fromJson(Map<String, dynamic> json) =
      _$CouponResultEntityImpl.fromJson;

  @override
  double get totalAfterDiscount;
  @override
  double get discountAmount;
  @override
  double get totalBeforeDiscount;

  /// Create a copy of CouponResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponResultEntityImplCopyWith<_$CouponResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
