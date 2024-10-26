import '../models/signup.dart';

abstract class SignUpUsecase {
  Future<SignUp> signUp(String username, String password, String email,
      String firstName, String lastName, String phoneNumber);
}