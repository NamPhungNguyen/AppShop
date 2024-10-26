import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/datastores/signup_repository_impl.dart';
import 'package:front_shop/server/data/repository/signup_repository.dart';

final signupRepositoryProvider = Provider<SignUpRepository>(
    (ref) => SignUpRepositoryImpl(ClientService()),
);