import '../entities/signup_entity.dart';

abstract class SignUpRepository {
  Future<SignUpEntity> signUp(String username, String password, String email,
      String fullName, String phoneNumber);
}