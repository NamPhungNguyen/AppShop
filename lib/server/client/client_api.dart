import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api_endpoint.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';
import 'package:front_shop/server/data/entities/comment_entity.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/signup_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../data/entities/cart_product_entity.dart';
import '../data/entities/shipping_address_entity.dart';

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

  @POST('/cart/create/{userId}')
  Future<HttpResponse<void>> createCartForUser(
    @Path("userId") String userId,
  );

  @POST('/cart/add-item-to-cart')
  Future<HttpResponse<void>> addProductToCart(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/cart/update-item-quantity/{cartItemId}')
  Future<HttpResponse<void>> updateItemQuantityFromCart(
    @Header("Authorization") authorization,
    @Path("cartItemId") String cartItemId,
    @Body() Map<String, dynamic> body,
  );

  @GET('/cart/fetch-cart')
  Future<HttpResponse<CartProductsEntity>> fetchCartUser(
    @Header("Authorization") authorization,
  );

  @PUT('/cart/update-checkout-status')
  Future<HttpResponse<void>> updateCheckoutStatus(
    @Header("Authorization") String authorization,
    @Body() Map<String, dynamic> body,
    @Query('isSelect') bool isSelect,
  );

  @GET('/cart/product-checkout')
  Future<HttpResponse<CartCheckoutProductsEntity>> fetchProductCheckout(
    @Header("Authorization") String authorization,
  );

  @DELETE('/cart/items/{cartId}')
  Future<HttpResponse<void>> deleteProductFromCart(
    @Header("Authorization") authorization,
    @Path("cartId") String cartId,
  );

  @GET('/shipping-address/addresses')
  Future<HttpResponse<ShippingAddressesEntity>> fetchAllShippingAddress(
    @Header("Authorization") authorization,
  );

  @GET('/shipping-address/default')
  Future<HttpResponse<ShippingAddressDefaultEntity>> getAddressDefault(
    @Header("Authorization") authorization,
  );

  @POST('/shipping-address/add')
  Future<HttpResponse<void>> addShippingAddress(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/shipping-address/delete/{addressId}')
  Future<HttpResponse<void>> deleteShippingAddress(
    @Header("Authorization") authorization,
    @Path("addressId") String addressId,
  );

  @PUT('/shipping-address/set-default/{addressId}')
  Future<HttpResponse<void>> setDefaultShippingAddress(
    @Header("Authorization") authorization,
    @Path("addressId") String addressId,
  );

  @PUT('/shipping-address/update/{addressId}')
  Future<HttpResponse<void>> updateShippingAddress(
    @Header("Authorization") authorization,
    @Path("addressId") String addressId,
    @Body() Map<String, dynamic> body,
  );

  @GET('/comment/list/{productId}')
  Future<HttpResponse<CommentsEntity>> fetchAllComment(
    @Header("Authorization") authorization,
    @Path("productId") String productId,
  );

  @POST('/comment/{productId}')
  Future<HttpResponse<void>> addComment(
    @Header("Authorization") authorization,
    @Path("productId") String productId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/comment/{commentId}')
  Future<HttpResponse<void>> deleteComment(
    @Header("Authorization") authorization,
    @Path("commentId") String commentId,
  );
}

final clientApi = ClientApi(
  Dio(BaseOptions(contentType: 'application/json')),
  baseUrl: ClientApiEndpoint().baseUrl(),
);
