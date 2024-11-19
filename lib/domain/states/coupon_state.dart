import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/coupon.dart';
import 'package:front_shop/domain/usecases/coupon_usecase.dart';

class CouponState extends StateNotifier<AsyncValue<List<Coupon>>> {
  final CouponUsecase _couponUsecase;

  CouponState(this._couponUsecase) : super(const AsyncValue.loading()) {
    _fetchCoupons();
  }

  Future<void> _fetchCoupons() async {
    try {
      state = const AsyncValue.loading();
      final coupons = await _couponUsecase.getCoupons();
      state = AsyncValue.data(coupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> applyCoupon(String poolCode) async {
    try {
      state = const AsyncValue.loading();
      final result = await _couponUsecase.applyCoupon(poolCode);
      print("Code: $result");

      final updatedCoupons = await _couponUsecase.getCoupons();
      state = AsyncValue.data(updatedCoupons);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
