import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/models/login/request/login_request.dart';
import 'package:front_shop/server/data/models/login/response/login_response.dart';

class ClientRepository {
  final ClientService clientService;
  ClientRepository(this.clientService);

  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    return await clientService.login(loginRequest);
  }
}