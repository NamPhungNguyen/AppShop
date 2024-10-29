import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/my_info.dart';

class UserState extends StateNotifier<AsyncValue<MyInfo>> {
  final StateNotifierProviderRef _ref;

  UserState(this._ref) : super(const AsyncValue.loading()) {
    getMyInfo();
  }

  Future<void> getMyInfo() async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      final user = await userUsecase.myInfo();
      state = AsyncValue.data(user);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> updateProfile(String name) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      final updatedUser = await userUsecase.updateProfileName(name);
      state = AsyncValue.data(updatedUser);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> updatePhone(String phoneNumber) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      final updatedUser = await userUsecase.updateProfilePhone(phoneNumber);
      state = AsyncValue.data(updatedUser);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> updateImg(String img) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      final updatedUser = await userUsecase.updateProfileImg(img);
      state = AsyncValue.data(updatedUser);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> updateEmail(String email) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = await _ref.read(userUsecaseProvider);
      final updatedUser = await userUsecase.updateProfileEmail(email);
      state = AsyncValue.data(updatedUser);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
