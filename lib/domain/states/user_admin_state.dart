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
      final userUsecase = _ref.read(userUsecaseProvider);
      final user = await userUsecase.getListUser();
      state = AsyncValue.data(user);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> deleteUser(String userId) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = _ref.read(userUsecaseProvider);
      await userUsecase.deleteUser(userId);
      await getListUser();
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> forgotPassword(String email) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = _ref.read(userUsecaseProvider);
      await userUsecase.forgotPassword(email);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> changePassword(String email, String newPassword) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = _ref.read(userUsecaseProvider);
      await userUsecase.changePassword(email, newPassword);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
