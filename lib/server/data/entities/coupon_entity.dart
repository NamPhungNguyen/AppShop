import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_entity.freezed.dart';

part 'coupon_entity.g.dart';

@freezed
class CouponEntity with _$CouponEntity {
  const factory CouponEntity({
    required int id,
    required String poolCode,
    required String code,
    required double discountAmount,
    required String expiryDate,
    required bool active,
    required bool claimed,
    required int totalQuantity,
    required int remainingQuantity,
    required List<ClaimedByUserEntity>? claimedByUsers,
  }) = _CouponEntity;

  factory CouponEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponEntityFromJson(json);
}

@freezed
class ClaimedByUserEntity with _$ClaimedByUserEntity {
  const factory ClaimedByUserEntity({
    required int id,
    required bool used,
  }) = _ClaimedByUserEntity;

  factory ClaimedByUserEntity.fromJson(Map<String, dynamic> json) =>
      _$ClaimedByUserEntityFromJson(json);
}
