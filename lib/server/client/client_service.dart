import 'dart:io';

import 'package:front_shop/server/client/client_api.dart';
import 'package:front_shop/server/data/models/login/request/login_request.dart';
import 'package:front_shop/server/data/models/login/response/login_response.dart';

class ClientService {
  final ClientApi clientApi;

  ClientService(this.clientApi);

  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    try {
      final response = await clientApi.login(loginRequest);
      return response;
    }catch(e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
