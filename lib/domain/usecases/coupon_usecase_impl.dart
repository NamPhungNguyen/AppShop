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
  Future<CouponApply> applyCoupon(String poolCode) async {
    final entity = await _couponRepository.applyCoupon(poolCode);
    return CouponTranslator.translateCoupon(entity);
  }
}
