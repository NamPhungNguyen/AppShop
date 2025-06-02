import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/coupon.dart';
import 'package:front_shop/domain/usecases/coupon_usecase.dart';

class CouponState extends StateNotifier<AsyncValue<List<Coupon>>> {
  final CouponUsecase _couponUsecase;
  double discountAmount = 0.0;

  CouponState(this._couponUsecase) : super(const AsyncValue.loading()) {
    fetchCoupons();
  }

  // Fetch coupons
  Future<void> fetchCoupons() async {
    try {
      state = const AsyncValue.loading();
      final coupons = await _couponUsecase.getCoupons();
      state = AsyncValue.data(coupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
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

  // Apply coupon
  Future<void> applyCoupon(String poolCode) async {
    try {
      state = const AsyncValue.loading();
      final result = await _couponUsecase.applyCoupon(poolCode);
      print("Code: $result");
      discountAmount = result.result.discountAmount;
      print("Coupon applied with discount: $discountAmount");

      final updatedCoupons = await _couponUsecase.getCoupons();
      state = AsyncValue.data(updatedCoupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Create coupon
  Future<void> createCoupon(String poolCode, String code, double discountAmount,
      String expiryDate, bool active, int totalQuantity) async {
    try {
      state = const AsyncValue.loading();

      await _couponUsecase.createCoupon(
          poolCode, code, discountAmount, expiryDate, active, totalQuantity);

      final updatedCoupons = await _couponUsecase.getCoupons();
      state = AsyncValue.data(updatedCoupons);
      print("Coupon created successfully");
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      print("Error creating coupon: $e");
    }
  }
  double get getDiscountAmount => discountAmount;
}
