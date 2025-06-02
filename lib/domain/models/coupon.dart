import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon.freezed.dart';

@freezed
class Coupon with _$Coupon {
  const factory Coupon({
    required int id,
    required String poolCode,
    required String code,
    required double discountAmount,
    required String expiryDate,
    required bool active,
    required bool claimed,
    required int totalQuantity,
    required int remainingQuantity,
    required List<ClaimedByUser>? claimedByUsers,
  }) = _Coupon;
}

@freezed
class ClaimedByUser with _$ClaimedByUser {
  const factory ClaimedByUser({
    required int id,
    required bool used,
  }) = _ClaimedByUser;
}
