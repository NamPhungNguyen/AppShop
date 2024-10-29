import 'package:front_shop/server/data/entities/my_info_entity.dart';

abstract class UserRepository {
  Future<MyInfoEntity> myInfo();

  Future<MyInfoEntity> updateProfileName(String name);

  Future<MyInfoEntity> updateProfilePhone(String phoneNumber);

  Future<MyInfoEntity> updateProfileImg(String img);

  Future<MyInfoEntity> updateProfileEmail(String email);
}
