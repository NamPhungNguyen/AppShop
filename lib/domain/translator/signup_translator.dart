import 'package:front_shop/domain/models/signup.dart';

import '../../server/data/entities/signup_entity.dart';

class SignUpTranslator {
  static SignUp translate(final SignUpEntity entity) {
    return SignUp(
      code: entity.code,
      message: entity.message,
      result: translateResult(entity.result),
    );
  }

  static SignUpResult translateResult(final SignUpResultEntity entity) {
    return SignUpResult(
      id: entity.id,
      username: entity.username,
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
    );
  }
}
