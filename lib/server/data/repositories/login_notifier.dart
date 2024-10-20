import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/models/login/request/login_request.dart';
import 'package:front_shop/server/data/models/login/response/login_response.dart';

import 'client_repository.dart';
import 'client_repository_provider.dart';

class LoginNotifier extends StateNotifier<bool> {
  final ClientRepository clientRepository;

  LoginNotifier(this.clientRepository) : super(false); // Initial state is not loading

  Future<LoginResponse?> login(String username, String password) async {
    state = true; // Set loading to true
    final loginRequest = LoginRequest(username: username, password: password);

    try {
      final response = await clientRepository.login(loginRequest);
      state = false; // Set loading to false
      return response; // Return the response on success
    } catch (e) {
      state = false; // Set loading to false
      print('Login failed: $e');
      return null; // Return null on failure
    }
  }
}

// Provider for the LoginNotifier
final loginNotifierProvider = StateNotifierProvider<LoginNotifier, bool>(
      (ref) {
    final clientRepository = ref.watch(clientRepositoryProvider);
    return LoginNotifier(clientRepository);
  },
);
