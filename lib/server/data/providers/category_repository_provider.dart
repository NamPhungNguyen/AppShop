import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/category_repository_impl.dart';
import 'package:front_shop/server/data/repository/category_repository.dart';

import '../../client/client_service.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(ClientService()),
);
