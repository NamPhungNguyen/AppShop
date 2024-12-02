import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/user.dart';

class UserAdminState extends StateNotifier<AsyncValue<UserResponse>> {
  final StateNotifierProviderRef _ref;

  UserAdminState(this._ref) : super(const AsyncValue.loading()) {
    getListUser();
  }

  Future<void> getListUser() async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      final user = await userUsecase.getListUser();
      state = AsyncValue.data(user);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> deleteUser(String userId) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      await userUsecase.deleteUser(userId);
      await getListUser();
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
