import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/cart_repository_impl.dart';
import 'package:front_shop/server/data/repository/cart_repository.dart';

import '../../client/client_service.dart';

final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRepositoryImpl(ClientService()),
);
