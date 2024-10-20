import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/client/client_api.dart';
import 'package:front_shop/server/client/client_service.dart';
import 'package:dio/dio.dart';
import 'client_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(); // You can customize the Dio instance as needed
});

// Provider for ClientService
final clientServiceProvider = Provider<ClientService>((ref) {
  final dio = ref.watch(dioProvider);
  final clientApi = ClientApi(dio);
  return ClientService(clientApi);
});

// Provider for ClientRepository
final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  final clientService = ref.watch(clientServiceProvider);
  return ClientRepository(clientService);
});
