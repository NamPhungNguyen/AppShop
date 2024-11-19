import 'package:front_shop/server/data/entities/coupon_entity.dart';

import '../entities/coupon_apply_entity.dart';

abstract class CouponRepository {
  Future<List<CouponEntity>> getCoupons();
  Future<CouponApplyEntity> applyCoupon(String poolCode);
}
