import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/coupon_entity.dart';
import 'package:front_shop/server/data/repository/coupon_repository_impl.dart';

import '../entities/coupon_apply_entity.dart';

class CouponRepositoryImpl implements CouponRepository {
  final ClientService _clientService;

  CouponRepositoryImpl(this._clientService);

  @override
  Future<List<CouponEntity>> getCoupons() async {
    return await _clientService.getCoupons();
  }

  @override
  Future<List<CouponEntity>> getAllCoupon() async {
    return await _clientService.getAllCoupon();
  }

  @override
  Future<CouponApplyEntity> applyCoupon(String poolCode) async {
    return await _clientService.applyCoupon(poolCode);
  }

  @override
  Future<void> createCoupon(String poolCode, String code, double discountAmount,
      String expiryDate, bool active, int totalQuantity) async {
    return await _clientService.createCoupon(
        poolCode, code, discountAmount, expiryDate, active, totalQuantity);
  }

  @override
  Future<void> updateCoupon(
      String couponId,
      String poolCode,
      String code,
      double discountAmount,
      String expiryDate,
      bool active,
      int totalQuantity) async {
    return await _clientService.updateCoupon(couponId, poolCode, code,
        discountAmount, expiryDate, active, totalQuantity);
  }

  @override
  Future<void> deleteCoupon(String couponId) async {
    return await _clientService.deleteCoupon(couponId);
  }
}
