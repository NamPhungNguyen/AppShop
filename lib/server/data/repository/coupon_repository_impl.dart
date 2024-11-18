import 'package:front_shop/server/data/entities/coupon_entity.dart';

abstract class CouponRepository {
  Future<List<CouponEntity>> getCoupons();
  Future<void> applyCoupon(String poolCode);
}
