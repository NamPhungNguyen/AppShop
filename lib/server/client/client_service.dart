import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';

class ClientService {
  factory ClientService() => _instance;

  ClientService._internal();

  static final ClientService _instance = ClientService._internal();

  _apiErrorHandlingIfNeeded(Response res) {
    developer.log(
      "API: (${res.statusCode}) [${res.requestOptions.method}] ${res.requestOptions.uri}",
      name: 'APPLOG',
    );
    if (res.statusCode != 200) {
      throw Exception('API error: ${res.data}');
    }
  }

  Future<LoginEntity> login(String username, String password) async {
    Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };
    try {
      final res = await clientApi.login(body);
      _apiErrorHandlingIfNeeded(res.response);
      return res.data;
    } on DioError catch (e) {
      throw Exception('Login failed: ${e.response?.data ?? "Unknown error occurred"}');
    }
  }
}
