import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/product_repository_impl.dart';
import 'package:front_shop/server/data/repository/product_repository.dart';

import '../../client/client_service.dart';

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => ProductRepositoryImpl(ClientService()),
);
