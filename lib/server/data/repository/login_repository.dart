import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String username, String password);
}