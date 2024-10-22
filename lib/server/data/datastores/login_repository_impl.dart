import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:front_shop/server/data/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ClientService _clientService;

  const LoginRepositoryImpl(this._clientService);

  @override
  Future<LoginEntity> login(String username, String password) async {
    return await _clientService.login(username, password);
  }
}
