import 'package:front_shop/server/data/entities/coupon_entity.dart';

import '../entities/coupon_apply_entity.dart';

abstract class CouponRepository {
  Future<List<CouponEntity>> getCoupons();

  Future<List<CouponEntity>> getAllCoupon();

  Future<void> createCoupon(
    String poolCode,
    String code,
    double discountAmount,
    String expiryDate,
    bool active,
    int totalQuantity,
  );

  Future<void> updateCoupon(
    String couponId,
    String poolCode,
    String code,
    double discountAmount,
    String expiryDate,
    bool active,
    int totalQuantity,
  );

  Future<CouponApplyEntity> applyCoupon(String poolCode);

  Future<void> deleteCoupon(String couponId);
}
