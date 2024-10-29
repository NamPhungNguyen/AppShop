import 'package:front_shop/domain/models/my_info.dart';

import '../../server/data/entities/my_info_entity.dart';

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
}
