import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/shipping_address_repository_impl.dart';
import 'package:front_shop/server/data/repository/shipping_address_repository.dart';

import '../../client/client_service.dart';

final shippingAddressRepositoryProvider = Provider<ShippingAddressRepository>(
  (ref) => ShippingAddressRepositoryImpl(ClientService()),
);
