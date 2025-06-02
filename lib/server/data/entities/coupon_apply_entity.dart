import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_apply_entity.freezed.dart';
part 'coupon_apply_entity.g.dart';

@freezed
class CouponApplyEntity with _$CouponApplyEntity {
  const factory CouponApplyEntity({
    required CouponResultEntity result,
  }) = _CouponApplyEntity;

  factory CouponApplyEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponApplyEntityFromJson(json);
}

@freezed
class CouponResultEntity with _$CouponResultEntity {
  const factory CouponResultEntity({
    required double totalAfterDiscount,
    required double discountAmount,
    required double totalBeforeDiscount,
  }) = _CouponResultEntity;

  factory CouponResultEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponResultEntityFromJson(json);
}
