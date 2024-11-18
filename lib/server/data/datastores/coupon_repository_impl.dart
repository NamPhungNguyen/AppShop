import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/coupon_entity.dart';
import 'package:front_shop/server/data/repository/coupon_repository_impl.dart';

class CouponRepositoryImpl implements CouponRepository {
  final ClientService _clientService;

  CouponRepositoryImpl(this._clientService);

  @override
  Future<List<CouponEntity>> getCoupons() async {
    return await _clientService.getCoupons();
  }

  @override
  Future<void> applyCoupon(String poolCode) async {
    return await _clientService.applyCoupon(poolCode);
  }
}
