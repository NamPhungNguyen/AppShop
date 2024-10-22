import 'package:front_shop/domain/models/login.dart';
import 'package:front_shop/domain/translator/login_translator.dart';
import 'package:front_shop/domain/usecases/login_usecase.dart';
import 'package:front_shop/server/data/repository/login_repository.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _repository;

  const LoginUsecaseImpl(this._repository);

  @override
  Future<Login> login(String username, String password) async {
    final entity = await _repository.login(username, password);
    return LoginTranslator.translate(entity);
  }
}
