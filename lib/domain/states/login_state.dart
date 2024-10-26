import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/utils/preference_util.dart';
import '../models/login.dart';

class LoginState extends StateNotifier<AsyncValue<Login>> {
  final StateNotifierProviderRef _ref;

  LoginState(super.state, this._ref);

  Future<void> login(String username, String password) async {
    state = AsyncValue.loading(); // Set state to loading
    try {
      final loginUsecase = _ref.read(loginUsecaseProvider);
      final login = await loginUsecase.login(username, password);
      if (login.result.authenticated) {
        state = AsyncValue.data(login); // Successful login
      } else {
        state = AsyncValue.error(login.message, StackTrace.current); // Failed login
      }
    } catch (e) {
      state = AsyncValue.error("An error occurred: ${e.toString()}", StackTrace.current);
    }
  }

  Future<void> logout() async {
    await PreferenceUtil.removeAuthToken();
    state = AsyncValue.data(Login(
      code: 0,
      message: '',
      result: const LoginResult(token: '', authenticated: false),
    ));
  }
}
