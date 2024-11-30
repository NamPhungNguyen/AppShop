import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';
import 'package:front_shop/server/data/entities/comment_entity.dart';
import 'package:front_shop/server/data/entities/coupon_entity.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/order_entity.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/product_page_entity.dart';
import 'package:front_shop/server/data/entities/shipping_address_entity.dart';
import 'package:front_shop/server/data/entities/signup_entity.dart';
import 'package:front_shop/utils/header_token.dart';

import '../data/entities/cart_product_entity.dart';
import '../data/entities/coupon_apply_entity.dart';
import '../data/entities/order_pages_entity.dart';

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
      throw Exception(
          'Login failed: ${e.response?.data ?? "Unknown error occurred"}');
    }
  }

  Future<void> logout(String token) async {
    Map<String, dynamic> body = {
      'token': token,
    };
    final res = await clientApi.logout(body);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<SignUpEntity> signUp(String username, String password, String email,
      String fullName, String phoneNumber) async {
    Map<String, dynamic> body = {
      'username': username,
      'password': password,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
    try {
      final res = await clientApi.signUp(body);
      _apiErrorHandlingIfNeeded(res.response);
      return res.data;
    } on DioError catch (e) {
      final errorResponse = e.response?.data;
      if (errorResponse != null && errorResponse is Map<String, dynamic>) {
        final errorMessage =
            errorResponse["message"] ?? "Unknow error occurred";
        throw Exception(errorMessage);
      } else {
        throw Exception("An unexpected error occurred");
      }
    }
  }

  Future<void> updateLocation(bool isLocationEnable) async {
    Map<String, dynamic> body = {'isLocationEnable': isLocationEnable};
    try {
      final res = await clientApi.updateLocation(
          await Util.createAuthorization(), body);
      _apiErrorHandlingIfNeeded(res.response);
      return res.data;
    } on DioError catch (e) {
      final errResponse = e.response?.data;
      throw Exception(errResponse);
    }
  }

  Future<MyInfoEntity> getMyInfo() async {
    try {
      final res = await clientApi.getMyInfo(await Util.createAuthorization());
      _apiErrorHandlingIfNeeded(res.response);
      return res.data;
    } on DioError catch (e) {
      final errResponse = e.response?.data;
      throw Exception(errResponse);
    }
  }

  Future<MyInfoEntity> updateProfileName(String name) async {
    Map<String, dynamic> body = {
      'fullName': name,
    };
    final res = await clientApi.updateProfileName(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<MyInfoEntity> updateProfilePhone(String phoneNumber) async {
    Map<String, dynamic> body = {
      'phoneNumber': phoneNumber,
    };
    final res = await clientApi.updateProfilePhone(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<MyInfoEntity> updateProfileImg(String img) async {
    Map<String, dynamic> body = {
      'profileImg': img,
    };
    final res = await clientApi.updateProfileImg(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<MyInfoEntity> updateProfileEmail(String email) async {
    Map<String, dynamic> body = {
      'email': email,
    };
    final res = await clientApi.updateProfileEmail(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<CategoriesResponse> fetchAllCategories() async {
    final res =
        await clientApi.fetchAllCategories(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<ProductsEntity> fetchAllProduct() async {
    final res =
        await clientApi.fetchAllProduct(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<ProductsEntity> fetchAllProductByCategory(String categoryId) async {
    final res = await clientApi.fetchAllProductByCategory(
      await Util.createAuthorization(),
      categoryId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<ProductPageEntity> getProductsPage(int page, int size) async {
    final res = await clientApi.getProductsPage(
      await Util.createAuthorization(),
      page,
      size,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<List<ProductEntity>> searchAndFilter(String? name, double? priceMin,
      double? priceMax, bool sortByPriceAsc) async {
    final res = await clientApi.searchAndFilter(
      await Util.createAuthorization(),
      name,
      priceMin,
      priceMax,
      sortByPriceAsc,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> addProductToFavorites(String productId) async {
    final res = await clientApi.addProductToFavorites(
        await Util.createAuthorization(), productId);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> removeProductToFavorites(String productId) async {
    final res = await clientApi.removeProductToFavorites(
        await Util.createAuthorization(), productId);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<List<ProductEntity>> fetchAllProductToFavorites() async {
    final res = await clientApi
        .fetchAllProductToFavorites(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> createCartForUser(String userId) async {
    final res = await clientApi.createCartForUser(
      userId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size) async {
    Map<String, dynamic> body = {
      'productId': productId,
      'quantity': quantity,
      'color': color,
      'size': size
    };
    final res = await clientApi.addProductToCart(
        await Util.createAuthorization(), body);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<CartProductsEntity> fetchCartUser() async {
    final res = await clientApi.fetchCartUser(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> updateCheckoutStatus(
      List<int> cartItemIds, bool isSelect) async {
    Map<String, dynamic> body = {
      'cartItemIds': cartItemIds,
    };
    final res = await clientApi.updateCheckoutStatus(
      await Util.createAuthorization(),
      body,
      isSelect,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<CartCheckoutProductsEntity> fetchProductCheckout() async {
    final res =
        await clientApi.fetchProductCheckout(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> deleteProductFromCart(String cartId) async {
    final res = await clientApi.deleteProductFromCart(
      await Util.createAuthorization(),
      cartId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<ShippingAddressesEntity> fetchAllShippingAddress() async {
    final res = await clientApi
        .fetchAllShippingAddress(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<ShippingAddressDefaultEntity> getAddressDefault() async {
    final res =
        await clientApi.getAddressDefault(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> addShippingAddress(
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool isDefault = false,
  }) async {
    Map<String, dynamic> body = {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'addressDetail': addressDetail,
      'additionAddress': additionAddress,
      'province': province,
      'city': city,
      'isDefault': isDefault,
    };
    if (additionAddress != null) {
      body['additionAddress'] = additionAddress;
    }

    body['isDefault'] = isDefault;

    final res = await clientApi.addShippingAddress(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> deleteShippingAddress(String addressId) async {
    final res = await clientApi.deleteShippingAddress(
      await Util.createAuthorization(),
      addressId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> setDefaultShippingAddress(String addressId) async {
    final res = await clientApi.setDefaultShippingAddress(
      await Util.createAuthorization(),
      addressId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> updateShippingAddress(
    String addressId,
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool? isDefault,
  }) async {
    Map<String, dynamic> body = {};

    body['fullName'] = fullName;
    body['phoneNumber'] = phoneNumber;
    body['addressDetail'] = addressDetail;
    body['province'] = province;
    body['city'] = city;

    if (additionAddress != null && additionAddress.isNotEmpty) {
      body['additionAddress'] = additionAddress;
    }

    if (isDefault != null) {
      body['isDefault'] = isDefault;
    }

    final res = await clientApi.updateShippingAddress(
      await Util.createAuthorization(),
      addressId,
      body,
    );

    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> updateItemQuantityFromCart(
      String cartItemId, int quantity) async {
    Map<String, dynamic> body = {'quantity': quantity};
    final res = await clientApi.updateItemQuantityFromCart(
      await Util.createAuthorization(),
      cartItemId,
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<CommentsEntity> fetchAllComment(String productId) async {
    final res = await clientApi.fetchAllComment(
      await Util.createAuthorization(),
      productId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> addComment(String productId, String content, int rating,
      List<String> imageUrls) async {
    Map<String, dynamic> body = {
      "content": content,
      "rating": rating,
      "imageUrls": imageUrls,
    };
    final res = await clientApi.addComment(
      await Util.createAuthorization(),
      productId,
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> deleteComment(String commentId) async {
    final res = await clientApi.deleteComment(
        await Util.createAuthorization(), commentId);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<List<CouponEntity>> getCoupons() async {
    final res = await clientApi.getCoupons(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<CouponApplyEntity> applyCoupon(String poolCode) async {
    Map<String, dynamic> body = {
      'poolCode': poolCode,
    };
    final res = await clientApi.applyCoupon(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId) async {
    Map<String, dynamic> body = {
      'paymentMethod': paymentMethod,
      'couponCode': couponCode,
      'addressId': addressId,
    };
    final res = await clientApi.createOrder(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<List<OrderEntity>> fetchAllOrder() async {
    final res = await clientApi.fetchAllOrder(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<OrderPagesEntity> getOrderPages(
      String status, int page, int size) async {
    final res = await clientApi.getOrderPages(
        await Util.createAuthorization(), status, page, size);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<OrderPagesEntity> searchOrderPages(
    String? status,
    String? startDate,
    String? endDate,
    String? fullName,
    String? phoneNumber,
    String? addressDetail,
    int page,
    int size,
  ) async {
    final res = await clientApi.searchOrderPages(
      await Util.createAuthorization(),
      status,
      startDate,
      endDate,
      fullName,
      phoneNumber,
      addressDetail,
      page,
      size,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> cancelOrder(String orderId) async {
    final res = await clientApi.cancelOrder(
      await Util.createAuthorization(),
      orderId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> updateStatusOrder(String orderId, String status) async {
    final res = await clientApi.updateStatusOrder(
        await Util.createAuthorization(), orderId, status);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> createProduct(
    String name,
    String description,
    double price,
    int stock,
    List<String> size,
    List<String> color,
    String brand,
    List<String> imgProduct,
    int categoryId,
    int discount,
  ) async {
    Map<String, dynamic> body = {
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'size': size,
      'color': color,
      'brand': brand,
      'imgProduct': imgProduct,
      'categoryId': categoryId,
      'discount': discount,
    };
    final res = await clientApi.createProduct(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> createCategory(
      String name, String description, String image) async {
    Map<String, dynamic> body = {
      'name': name,
      'description': description,
      'image': image,
    };
    final res = await clientApi.createCategory(
      await Util.createAuthorization(),
      body,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> updateCategory(
      String categoryId, String name, String description, String image) async {
    Map<String, dynamic> body = {
      'name': name,
      'description': description,
      'image': image,
    };
    final res = await clientApi.updateCategory(
        await Util.createAuthorization(), categoryId, body);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<void> deleteCategory(String categoryId) async {
    final res = await clientApi.deleteCategory(
        await Util.createAuthorization(), categoryId);
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }
}
