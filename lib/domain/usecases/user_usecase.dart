import 'package:front_shop/domain/models/my_info.dart';

abstract class UserUsecase {
  Future<MyInfo> myInfo();

  Future<MyInfo> updateProfileName(String name);

  Future<MyInfo> updateProfilePhone(String phoneNumber);

  Future<MyInfo> updateProfileImg(String img);

  Future<MyInfo> updateProfileEmail(String email);
}
