import '../entities/cart_product_entity.dart';

abstract class CartRepository {
  Future<void> createCartForUser(String userId);

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size);

  Future<CartProductsEntity> fetchCartUser();

  Future<void> deleteProductFromCart(String cartId);
}
