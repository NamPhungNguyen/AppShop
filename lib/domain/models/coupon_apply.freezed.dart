// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_apply.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CouponApply {
  CouponResult get result => throw _privateConstructorUsedError;

  /// Create a copy of CouponApply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponApplyCopyWith<CouponApply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponApplyCopyWith<$Res> {
  factory $CouponApplyCopyWith(
          CouponApply value, $Res Function(CouponApply) then) =
      _$CouponApplyCopyWithImpl<$Res, CouponApply>;
  @useResult
  $Res call({CouponResult result});

  $CouponResultCopyWith<$Res> get result;
}

/// @nodoc
class _$CouponApplyCopyWithImpl<$Res, $Val extends CouponApply>
    implements $CouponApplyCopyWith<$Res> {
  _$CouponApplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponApply
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
              as CouponResult,
    ) as $Val);
  }

  /// Create a copy of CouponApply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponResultCopyWith<$Res> get result {
    return $CouponResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CouponApplyImplCopyWith<$Res>
    implements $CouponApplyCopyWith<$Res> {
  factory _$$CouponApplyImplCopyWith(
          _$CouponApplyImpl value, $Res Function(_$CouponApplyImpl) then) =
      __$$CouponApplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CouponResult result});

  @override
  $CouponResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$CouponApplyImplCopyWithImpl<$Res>
    extends _$CouponApplyCopyWithImpl<$Res, _$CouponApplyImpl>
    implements _$$CouponApplyImplCopyWith<$Res> {
  __$$CouponApplyImplCopyWithImpl(
      _$CouponApplyImpl _value, $Res Function(_$CouponApplyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponApply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CouponApplyImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CouponResult,
    ));
  }
}

/// @nodoc

class _$CouponApplyImpl implements _CouponApply {
  const _$CouponApplyImpl({required this.result});

  @override
  final CouponResult result;

  @override
  String toString() {
    return 'CouponApply(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponApplyImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of CouponApply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponApplyImplCopyWith<_$CouponApplyImpl> get copyWith =>
      __$$CouponApplyImplCopyWithImpl<_$CouponApplyImpl>(this, _$identity);
}

abstract class _CouponApply implements CouponApply {
  const factory _CouponApply({required final CouponResult result}) =
      _$CouponApplyImpl;

  @override
  CouponResult get result;

  /// Create a copy of CouponApply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponApplyImplCopyWith<_$CouponApplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CouponResult {
  double get totalAfterDiscount => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  double get totalBeforeDiscount => throw _privateConstructorUsedError;

  /// Create a copy of CouponResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponResultCopyWith<CouponResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponResultCopyWith<$Res> {
  factory $CouponResultCopyWith(
          CouponResult value, $Res Function(CouponResult) then) =
      _$CouponResultCopyWithImpl<$Res, CouponResult>;
  @useResult
  $Res call(
      {double totalAfterDiscount,
      double discountAmount,
      double totalBeforeDiscount});
}

/// @nodoc
class _$CouponResultCopyWithImpl<$Res, $Val extends CouponResult>
    implements $CouponResultCopyWith<$Res> {
  _$CouponResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponResult
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
abstract class _$$CouponResultImplCopyWith<$Res>
    implements $CouponResultCopyWith<$Res> {
  factory _$$CouponResultImplCopyWith(
          _$CouponResultImpl value, $Res Function(_$CouponResultImpl) then) =
      __$$CouponResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalAfterDiscount,
      double discountAmount,
      double totalBeforeDiscount});
}

/// @nodoc
class __$$CouponResultImplCopyWithImpl<$Res>
    extends _$CouponResultCopyWithImpl<$Res, _$CouponResultImpl>
    implements _$$CouponResultImplCopyWith<$Res> {
  __$$CouponResultImplCopyWithImpl(
      _$CouponResultImpl _value, $Res Function(_$CouponResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAfterDiscount = null,
    Object? discountAmount = null,
    Object? totalBeforeDiscount = null,
  }) {
    return _then(_$CouponResultImpl(
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

class _$CouponResultImpl implements _CouponResult {
  const _$CouponResultImpl(
      {required this.totalAfterDiscount,
      required this.discountAmount,
      required this.totalBeforeDiscount});

  @override
  final double totalAfterDiscount;
  @override
  final double discountAmount;
  @override
  final double totalBeforeDiscount;

  @override
  String toString() {
    return 'CouponResult(totalAfterDiscount: $totalAfterDiscount, discountAmount: $discountAmount, totalBeforeDiscount: $totalBeforeDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponResultImpl &&
            (identical(other.totalAfterDiscount, totalAfterDiscount) ||
                other.totalAfterDiscount == totalAfterDiscount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.totalBeforeDiscount, totalBeforeDiscount) ||
                other.totalBeforeDiscount == totalBeforeDiscount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totalAfterDiscount, discountAmount, totalBeforeDiscount);

  /// Create a copy of CouponResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponResultImplCopyWith<_$CouponResultImpl> get copyWith =>
      __$$CouponResultImplCopyWithImpl<_$CouponResultImpl>(this, _$identity);
}

abstract class _CouponResult implements CouponResult {
  const factory _CouponResult(
      {required final double totalAfterDiscount,
      required final double discountAmount,
      required final double totalBeforeDiscount}) = _$CouponResultImpl;

  @override
  double get totalAfterDiscount;
  @override
  double get discountAmount;
  @override
  double get totalBeforeDiscount;

  /// Create a copy of CouponResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponResultImplCopyWith<_$CouponResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
