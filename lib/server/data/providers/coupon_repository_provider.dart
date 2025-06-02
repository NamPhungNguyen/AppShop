import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/coupon_repository_impl.dart';
import 'package:front_shop/server/data/repository/coupon_repository_impl.dart';

import '../../client/client_service.dart';

final couponRepositoryProvider = Provider<CouponRepository>(
  (ref) => CouponRepositoryImpl(ClientService()),
);
