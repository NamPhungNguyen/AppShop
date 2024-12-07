import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api_endpoint.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';
import 'package:front_shop/server/data/entities/comment_entity.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/order_entity.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/signup_entity.dart';
import 'package:front_shop/server/data/entities/user_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../data/entities/cart_product_entity.dart';
import '../data/entities/coupon_apply_entity.dart';
import '../data/entities/coupon_entity.dart';
import '../data/entities/monthly_revenue_entity.dart';
import '../data/entities/order_pages_entity.dart';
import '../data/entities/product_page_entity.dart';
import '../data/entities/shipping_address_entity.dart';

part 'client_api.g.dart';

@RestApi(baseUrl: "")
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  @POST('/auth/log-in')
  Future<HttpResponse<LoginEntity>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/log-out')
  Future<HttpResponse<void>> logout(
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

  @GET('/users/list-user')
  Future<HttpResponse<UserResponseEntity>> getListUser(
    @Header("Authorization") authorization,
  );

  @DELETE('/users/delete-user/{userId}')
  Future<HttpResponse<void>> deleteUser(
    @Header("Authorization") authorization,
    @Path("userId") String userid,
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

  @POST('/product/create')
  Future<HttpResponse<void>> createProduct(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @GET('/product/list-product-category/{categoryId}')
  Future<HttpResponse<ProductsEntity>> fetchAllProductByCategory(
    @Header("Authorization") authorization,
    @Path("categoryId") String categoryId,
  );

  @GET('/product/products')
  Future<HttpResponse<ProductPageEntity>> getProductsPage(
    @Header("Authorization") authorization,
    @Query('page') int page,
    @Query('size') int size,
  );

  @PUT('/product/update/{productId}')
  Future<HttpResponse<void>> updateProduct(
    @Header("Authorization") authorization,
    @Path("productId") String productId,
    @Body() Map<String, dynamic> body,
  );

  @GET('/product/search')
  Future<HttpResponse<List<ProductEntity>>> searchAndFilter(
    @Header("Authorization") String authorization,
    @Query("name") String? name,
    @Query("priceMin") double? priceMin,
    @Query("priceMax") double? priceMax,
    @Query("sortByPriceAsc") bool sortByPriceAsc,
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

  @GET('/coupon/active')
  Future<HttpResponse<List<CouponEntity>>> getCoupons(
    @Header("Authorization") authorization,
  );

  @GET('/coupon/list-all')
  Future<HttpResponse<List<CouponEntity>>> getAllCoupon(
    @Header("Authorization") authorization,
  );

  @POST('/coupon')
  Future<HttpResponse<void>> createCoupon(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/coupon/{couponId}')
  Future<HttpResponse<void>> updateCoupon(
    @Header("Authorization") authorization,
    @Path("couponId") String couponId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/coupon/{couponId}')
  Future<HttpResponse<void>> deleteCoupon(
    @Header("Authorization") authorization,
    @Path("couponId") String couponId,
  );

  @POST('/coupon/apply-coupon')
  Future<HttpResponse<CouponApplyEntity>> applyCoupon(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @POST('/order/create')
  Future<HttpResponse<void>> createOrder(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @GET('/order/list-all')
  Future<HttpResponse<List<OrderEntity>>> fetchAllOrder(
    @Header("Authorization") authorization,
  );

  @GET('/order/orders')
  Future<HttpResponse<OrderPagesEntity>> getOrderPages(
    @Header("Authorization") authorization,
    @Query("status") String status,
    @Query("page") int page,
    @Query("size") int size,
  );

  @GET('/order/monthly')
  Future<HttpResponse<List<MonthlyRevenueEntity>>> getMonthlyRevenue(
    @Header("Authorization") authorization,
  );

  @GET('/order/orders/search')
  Future<HttpResponse<OrderPagesEntity>> searchOrderPages(
    @Header("Authorization") authorization,
    @Query("status") String? status,
    @Query("startDate") String? startDate,
    @Query("endDate") String? endDate,
    @Query("fullName") String? fullName,
    @Query("phoneNumber") String? phoneNumber,
    @Query("addressDetail") String? addressDetail,
    @Query("page") int page,
    @Query("size") int size,
  );

  @PUT('/order/cancel/{orderId}')
  Future<HttpResponse<void>> cancelOrder(
    @Header("Authorization") authorization,
    @Path("orderId") String orderId,
  );

  @PUT('/order/{orderId}/status')
  Future<HttpResponse<void>> updateStatusOrder(
    @Header("Authorization") authorization,
    @Path("orderId") String orderId,
    @Query("status") String status,
  );

  @POST('/categories/create-categories')
  Future<HttpResponse<void>> createCategory(
    @Header("Authorization") authorization,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/categories/update-category/{categoryId}')
  Future<HttpResponse<void>> updateCategory(
    @Header("Authorization") authorization,
    @Path("categoryId") String categoryId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/categories/delete-category/{categoryId}')
  Future<HttpResponse<void>> deleteCategory(
    @Header("Authorization") authorization,
    @Path("categoryId") String categoryId,
  );
}

final clientApi = ClientApi(
  Dio(BaseOptions(contentType: 'application/json')),
  baseUrl: ClientApiEndpoint().baseUrl(),
);
