import 'package:front_shop/domain/models/coupon.dart';
import 'package:front_shop/domain/models/coupon_apply.dart';
import 'package:front_shop/domain/translator/coupon_translator.dart';
import 'package:front_shop/domain/usecases/coupon_usecase.dart';
import 'package:front_shop/server/data/repository/coupon_repository_impl.dart';

class CouponUsecaseImpl implements CouponUsecase {
  final CouponRepository _couponRepository;

  CouponUsecaseImpl(this._couponRepository);

  @override
  Future<List<Coupon>> getCoupons() async {
    final entity = await _couponRepository.getCoupons();
    return CouponTranslator.translate(entity);
  }

  @override
  Future<List<Coupon>> getAllCoupon() async {
    final entity = await _couponRepository.getAllCoupon();
    return CouponTranslator.translate(entity);
  }

  @override
  Future<CouponApply> applyCoupon(String poolCode) async {
    final entity = await _couponRepository.applyCoupon(poolCode);
    return CouponTranslator.translateCoupon(entity);
  }

  @override
  Future<void> createCoupon(String poolCode, String code, double discountAmount,
      String expiryDate, bool active, int totalQuantity) async {
    return await _couponRepository.createCoupon(
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
    return await _couponRepository.updateCoupon(couponId, poolCode, code,
        discountAmount, expiryDate, active, totalQuantity);
  }

  @override
  Future<void> deleteCoupon(String couponId) async {
    return await _couponRepository.deleteCoupon(couponId);
  }
}
