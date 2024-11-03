import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api_endpoint.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/signup_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'client_api.g.dart';

@RestApi(baseUrl: "")
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  @POST('/auth/log-in')
  Future<HttpResponse<LoginEntity>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/sign-up')
  Future<HttpResponse<SignUpEntity>> signUp(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/users/location-preference')
  Future<HttpResponse<void>> updateLocation(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @GET('/users/my-infor')
  Future<HttpResponse<MyInfoEntity>> getMyInfo(
    @Header("Authorization") authorization,
  );

  @PUT('/users/update-profile-name-user')
  Future<HttpResponse<MyInfoEntity>> updateProfileName(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/users/update-profile-phone-user')
  Future<HttpResponse<MyInfoEntity>> updateProfilePhone(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/users/update-profile-img-user')
  Future<HttpResponse<MyInfoEntity>> updateProfileImg(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/users/update-profile-email-user')
  Future<HttpResponse<MyInfoEntity>> updateProfileEmail(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @GET('/categories/list-categories')
  Future<HttpResponse<CategoriesResponse>> fetchAllCategories(
    @Header("Authorization") authorization,
  );

  @GET('/product/list')
  Future<HttpResponse<ProductsEntity>> fetchAllProduct(
    @Header("Authorization") authorization,
  );

  @POST('/favorites/add/{productId}')
  Future<HttpResponse<void>> addProductToFavorites(
    @Header("Authorization") authorization,
    @Path("productId") String productId,
  );

  @DELETE('/favorites/remove/{productId}')
  Future<HttpResponse<void>> removeProductToFavorites(
    @Header("Authorization") authorization,
    @Path("productId") String productId,
  );

  @GET('/favorites')
  Future<HttpResponse<List<ProductEntity>>> fetchAllProductToFavorites(
    @Header("Authorization") authorization,
  );
}

final clientApi = ClientApi(
  Dio(BaseOptions(contentType: 'application/json')),
  baseUrl: ClientApiEndpoint().baseUrl(),
);
