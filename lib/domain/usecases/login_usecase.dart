import 'package:front_shop/domain/models/login.dart';

abstract class LoginUsecase {
  Future<Login> login(String username, String password);
}
