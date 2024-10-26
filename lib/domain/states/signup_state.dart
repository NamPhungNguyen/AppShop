import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/signup.dart';

class SignUpState extends StateNotifier<AsyncValue<SignUp>> {
  final StateNotifierProviderRef _ref;
  SignUpState(this._ref) : super(const AsyncValue.loading());

  Future<void> signUp(String username, String password, String email,
      String firstName, String lastName, String phoneNumber) async {
    state = const AsyncValue.loading();
    try {
      final signUpResult = _ref.read(signupUsecaseProvider);
      final signup = await signUpResult.signUp(username, password, email, firstName, lastName, phoneNumber);
      if (signup != null) {
        state = AsyncValue.data(signup);
      } else {
        throw Exception("Invalid signup response");
      }
    }catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}