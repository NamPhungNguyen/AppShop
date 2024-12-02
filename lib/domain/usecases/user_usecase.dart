import 'package:front_shop/domain/models/my_info.dart';
import 'package:front_shop/domain/models/user.dart';

abstract class UserUsecase {
  Future<MyInfo> myInfo();

  Future<UserResponse> getListUser();

  Future<MyInfo> updateProfileName(String name);

  Future<MyInfo> updateProfilePhone(String phoneNumber);

  Future<MyInfo> updateProfileImg(String img);

  Future<MyInfo> updateProfileEmail(String email);

  Future<void> deleteUser(String userId);
}
