import '../entities/cart_product_entity.dart';

abstract class CartRepository {
  Future<void> createCartForUser();

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size);

  Future<CartProductsEntity> fetchCartUser();
}
