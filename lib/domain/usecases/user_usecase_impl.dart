import 'package:front_shop/domain/models/my_info.dart';
import 'package:front_shop/domain/models/user.dart';
import 'package:front_shop/domain/models/validate.dart';
import 'package:front_shop/domain/translator/user_translator.dart';
import 'package:front_shop/domain/usecases/user_usecase.dart';
import 'package:front_shop/server/data/repository/user_repository.dart';

class UserUsecaseImpl implements UserUsecase {
  final UserRepository _userRepository;

  UserUsecaseImpl(this._userRepository);

  @override
  Future<MyInfo> myInfo() async {
    final entity = await _userRepository.myInfo();
    return UseTranslator.translate(entity);
  }

  @override
  Future<MyInfo> updateProfileName(String name) async {
    final entity = await _userRepository.updateProfileName(name);
    return UseTranslator.translate(entity);
  }

  @override
  Future<MyInfo> updateProfilePhone(String phoneNumber) async {
    final entity = await _userRepository.updateProfilePhone(phoneNumber);
    return UseTranslator.translate(entity);
  }

  @override
  Future<MyInfo> updateProfileImg(String img) async {
    final entity = await _userRepository.updateProfileImg(img);
    return UseTranslator.translate(entity);
  }

  @override
  Future<MyInfo> updateProfileEmail(String email) async {
    final entity = await _userRepository.updateProfileEmail(email);
    return UseTranslator.translate(entity);
  }

  @override
  Future<UserResponse> getListUser() async {
    final entity = await _userRepository.getListUser();
    return UseTranslator.translateUserResponseEntityToUserResponse(entity);
  }

  @override
  Future<void> deleteUser(String userId) async {
    return await _userRepository.deleteUser(userId);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await _userRepository.forgotPassword(email);
  }

  @override
  Future<Validate> validateOtp(String email, String otp) async {
    final entity = await _userRepository.validateOtp(email, otp);
    return UseTranslator.translateValidate(entity);
  }

  @override
  Future<void> changePassword(String email, String newPassword) async {
    return await _userRepository.changePassword(email, newPassword);
  }
}
