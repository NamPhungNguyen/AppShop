import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_apply.freezed.dart';

@freezed
class CouponApply with _$CouponApply {
  const factory CouponApply({
    required CouponResult result,
  }) = _CouponApply;
}

@freezed
class CouponResult with _$CouponResult {
  const factory CouponResult({
    required double totalAfterDiscount,
    required double discountAmount,
    required double totalBeforeDiscount,
  }) = _CouponResult;
}
