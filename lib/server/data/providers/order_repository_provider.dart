import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/order_repository_impl.dart';
import 'package:front_shop/server/data/repository/order_repository.dart';

import '../../client/client_service.dart';

final orderRepositoryProvider = Provider<OrderRepository>(
  (ref) => OrderRepositoryImpl(ClientService()),
);
