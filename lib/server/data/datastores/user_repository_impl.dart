import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/user_entity.dart';
import 'package:front_shop/server/data/repository/user_repository.dart';

import '../entities/validate_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService _clientService;

  const UserRepositoryImpl(this._clientService);

  @override
  Future<MyInfoEntity> myInfo() async {
    return await _clientService.getMyInfo();
  }

  @override
  Future<MyInfoEntity> updateProfileName(String name) async {
    return await _clientService.updateProfileName(name);
  }

  @override
  Future<MyInfoEntity> updateProfilePhone(String phoneNumber) async {
    return await _clientService.updateProfilePhone(phoneNumber);
  }

  @override
  Future<MyInfoEntity> updateProfileImg(String img) async {
    return await _clientService.updateProfileImg(img);
  }

  @override
  Future<MyInfoEntity> updateProfileEmail(String email) async {
    return await _clientService.updateProfileEmail(email);
  }

  @override
  Future<UserResponseEntity> getListUser() async {
    return await _clientService.getListUser();
  }

  @override
  Future<void> deleteUser(String userId) async {
    return await _clientService.deleteUser(userId);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await _clientService.forgotPassword(email);
  }

  @override
  Future<ValidateEntity> validateOtp(String email, String otp) async {
    return await _clientService.validateOtp(email, otp);
  }

  @override
  Future<void> changePassword(String email, String newPassword) async {
    return await _clientService.changePassword(email, newPassword);
  }
}
