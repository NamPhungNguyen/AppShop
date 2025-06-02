import 'package:front_shop/domain/models/my_info.dart';
import 'package:front_shop/domain/models/validate.dart';

import '../../server/data/entities/my_info_entity.dart';
import '../../server/data/entities/user_entity.dart';
import '../../server/data/entities/validate_entity.dart';
import '../models/user.dart';

class UseTranslator {
  static MyInfo translate(final MyInfoEntity entity) {
    return MyInfo(result: translateMyInfoResult(entity.result));
  }

  static Result translateMyInfoResult(final ResultInfo entity) {
    return Result(
      id: entity.id,
      username: entity.username,
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      profileImg: entity.profileImg,
    );
  }

  static UserResponse translateUserResponseEntityToUserResponse(
      final UserResponseEntity entity) {
    return UserResponse(
      result: entity.result.map(translateUserEntityToUser).toList(),
    );
  }

  static Validate translateValidate(final ValidateEntity entity) {
    return Validate(code: entity.code, message: entity.message);
  }

  static User translateUserEntityToUser(final UserEntity entity) {
    return User(
      id: entity.id,
      username: entity.username,
      password: entity.password,
      email: entity.email,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      profileImgUrl: entity.profileImgUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
