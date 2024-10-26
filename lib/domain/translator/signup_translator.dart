import 'package:front_shop/domain/models/signup.dart';

import '../../server/data/entities/signup_entity.dart';

class SignUpTranslator {
  static SignUp translate(final SignUpEntity entity) {
    return SignUp(
      code: entity.code,
      message: entity.message
    );
  }
}
