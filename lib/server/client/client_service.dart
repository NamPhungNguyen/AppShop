import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:front_shop/server/client/client_api.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';
import 'package:front_shop/server/data/entities/login_entity.dart';
import 'package:front_shop/server/data/entities/my_info_entity.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/shipping_address_entity.dart';
import 'package:front_shop/server/data/entities/signup_entity.dart';
import 'package:front_shop/utils/header_token.dart';

import '../data/entities/cart_product_entity.dart';

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

  Future<void> createCartForUser() async {
    final res =
        await clientApi.createCartForUser(await Util.createAuthorization());
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

  Future<void> deleteProductFromCart(String cartId) async {
    final res = await clientApi.deleteProductFromCart(
      await Util.createAuthorization(),
      cartId,
    );
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }

  Future<ShippingAddressesEntity> fetchAllShippingAdress() async {
    final res = await clientApi
        .fetchAllShippingAdress(await Util.createAuthorization());
    _apiErrorHandlingIfNeeded(res.response);
    return res.data;
  }
}
