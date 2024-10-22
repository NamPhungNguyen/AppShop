import 'package:front_shop/domain/models/login.dart';

import '../../server/data/entities/login_entity.dart';

class LoginTranslator {
  static Login translate(final LoginEntity entity) {
    return Login(
      code: entity.code,
      message: entity.message,
      result: translateLoginResult(entity.result),
    );
  }

  static LoginResult translateLoginResult(final LoginResultEntity entity) {
    return LoginResult(
      token: entity.token,
      authenticated: entity.authenticated,
    );
  }
}
