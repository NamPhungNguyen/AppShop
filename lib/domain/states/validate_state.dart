import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/validate.dart';

import '../domain_modules.dart';

class ValidateState extends StateNotifier<AsyncValue<Validate>> {
  final StateNotifierProviderRef _ref;

  ValidateState(this._ref) : super(const AsyncValue.loading());

  Future<void> validateOtp(String email, String otp) async {
    state = const AsyncValue.loading();
    try {
      final userUsecase = _ref.read(userUsecaseProvider);
      final response = await userUsecase.validateOtp(email, otp);

      if (response.code != 200) {
        state = AsyncValue.error("Invalid OTP. Please try again.", StackTrace.current);
        return;
      } else {
        state = AsyncValue.data(response);
      }
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
