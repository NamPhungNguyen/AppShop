import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/datastores/user_repository_impl.dart';
import 'package:front_shop/server/data/repository/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ClientService()),
);
