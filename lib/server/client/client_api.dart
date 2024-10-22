import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api_endpoint.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'client_api.g.dart';

@RestApi(baseUrl: "")
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  @POST('/auth/log-in')
  Future<HttpResponse<LoginEntity>> login(
    @Body() Map<String, dynamic> body,
  );
}

final clientApi = ClientApi(
  Dio(BaseOptions(contentType: 'application/json')),
  baseUrl: ClientApiEndpoint().baseUrl(),
);
