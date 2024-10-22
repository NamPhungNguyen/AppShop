import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';

import '../models/login.dart';

class LoginState extends StateNotifier<AsyncValue<Login>> {
  final StateNotifierProviderRef _ref;

  LoginState(super.state, this._ref);

  Future<void> login(String username, String password) async {
    final loginUsecase = _ref.read(loginUsecaseProvider);
    final login = await loginUsecase.login(username, password);
    state = AsyncValue.data(login);
  }
}
