import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/user_entity.dart';

abstract class UserRepository {
  Future<MyInfoEntity> myInfo();

  Future<UserResponseEntity> getListUser();

  Future<void> deleteUser(String userId);

  Future<MyInfoEntity> updateProfileName(String name);

  Future<MyInfoEntity> updateProfilePhone(String phoneNumber);

  Future<MyInfoEntity> updateProfileImg(String img);

  Future<MyInfoEntity> updateProfileEmail(String email);
}
