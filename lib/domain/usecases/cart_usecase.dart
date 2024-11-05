import 'package:front_shop/domain/models/cart_product.dart';

abstract class CartUsecase {
  Future<void> createCartForUser();

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size);

  Future<CartProducts> fetchCartUser();

  Future<void> deleteProductFromCart(String cartId);
}
