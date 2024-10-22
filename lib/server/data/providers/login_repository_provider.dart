import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/datastores/login_repository_impl.dart';
import 'package:front_shop/server/data/repository/login_repository.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepositoryImpl(ClientService()),
);
