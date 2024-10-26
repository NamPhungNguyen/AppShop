import 'package:front_shop/domain/usecases/signup_usecase.dart';
import 'package:front_shop/server/data/repository/signup_repository.dart';

import '../models/signup.dart';
import '../translator/signup_translator.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository _repository;

  const SignUpUsecaseImpl(this._repository);

  @override
  Future<SignUp> signUp(String username, String password, String email,
      String firstName, String lastName, String phoneNumber) async {
    final entity = await _repository.signUp(
        username, password, email, firstName, lastName, phoneNumber);
    return SignUpTranslator.translate(entity);
  }
}
