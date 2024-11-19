import 'package:front_shop/domain/models/coupon.dart';
import 'package:front_shop/domain/models/coupon_apply.dart';

abstract class CouponUsecase {
  Future<List<Coupon>> getCoupons();

  Future<CouponApply> applyCoupon(String poolCode);
}
