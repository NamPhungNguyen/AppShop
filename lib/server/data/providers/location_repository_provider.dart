import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/datastores/location_repository_impl.dart';
import 'package:front_shop/server/data/repository/location_repository.dart';

final locationRepositoryProvider = Provider<LocationRepository>(
    (ref) => LocationRepositoryImpl(ClientService())
);