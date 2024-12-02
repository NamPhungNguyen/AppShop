import 'package:front_shop/domain/models/coupon.dart';
import 'package:front_shop/domain/models/coupon_apply.dart';

abstract class CouponUsecase {
  Future<List<Coupon>> getCoupons();

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

  Future<CouponApply> applyCoupon(String poolCode);

  Future<void> deleteCoupon(String couponId);
}
