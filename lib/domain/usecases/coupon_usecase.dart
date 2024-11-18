import 'package:front_shop/domain/models/coupon.dart';

abstract class CouponUsecase {
  Future<List<Coupon>> getCoupons();

  Future<void> applyCoupon(String poolCode);
}
