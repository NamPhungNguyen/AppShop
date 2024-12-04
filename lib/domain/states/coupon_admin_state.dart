import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/coupon.dart';
import 'package:front_shop/domain/usecases/coupon_usecase.dart';

class CouponAdminState extends StateNotifier<AsyncValue<List<Coupon>>> {
  final CouponUsecase _couponUsecase;
  double discountAmount = 0.0;

  CouponAdminState(this._couponUsecase) : super(const AsyncValue.loading()) {
    getAllCoupon();
  }

  Future<void> getAllCoupon() async {
    try {
      state = const AsyncValue.loading();
      final coupons = await _couponUsecase.getAllCoupon();
      state = AsyncValue.data(coupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // update coupon
  Future<void> updateCoupon(
      String couponId,
      String poolCode,
      String code,
      double discountAmount,
      String expiryDate,
      bool active,
      int totalQuantity) async {
    try {
      state = const AsyncValue.loading();

      await _couponUsecase.updateCoupon(couponId, poolCode, code,
          discountAmount, expiryDate, active, totalQuantity);

      final updatedCoupons = await _couponUsecase.getAllCoupon();
      state = AsyncValue.data(updatedCoupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteCoupon(String couponId) async {
    try {
      state = const AsyncValue.loading();

      await _couponUsecase.deleteCoupon(couponId);

      final updatedCoupons = await _couponUsecase.getAllCoupon();
      state = AsyncValue.data(updatedCoupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
