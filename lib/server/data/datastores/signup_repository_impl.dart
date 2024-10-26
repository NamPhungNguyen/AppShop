import 'package:front_shop/server/data/entities/signup_entity.dart';
import 'package:front_shop/server/data/repository/signup_repository.dart';

import '../../client/client_service.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final ClientService _clientService;

  const SignUpRepositoryImpl(this._clientService);
  @override
  Future<SignUpEntity> signUp(String username, String password, String email, String firstName, String lastName, String phoneNumber) async {
    return await _clientService.signUp(username, password, email, firstName, lastName, phoneNumber);
  }
}