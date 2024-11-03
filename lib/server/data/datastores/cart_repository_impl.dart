import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/cart_product_entity.dart';

import '../repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final ClientService _clientService;

  CartRepositoryImpl(this._clientService);

  @override
  Future<void> createCartForUser() async {
    return await _clientService.createCartForUser();
  }

  @override
  Future<void> addProductToCart(
      int productId, int quantity, String color, String size) async {
    return await _clientService.addProductToCart(
        productId, quantity, color, size);
  }

  @override
  Future<CartProductsEntity> fetchCartUser() async {
    return await _clientService.fetchCartUser();
  }
}
