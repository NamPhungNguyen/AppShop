import 'package:dio/dio.dart';
import 'package:front_shop/server/data/models/login/response/login_response.dart';
import 'package:retrofit/http.dart';
import '../data/models/login/request/login_request.dart';

part 'client_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080/shopping/")
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  @POST('auth/login-in')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}

