import '../entities/cart_product_entity.dart';

abstract class CartRepository {
  Future<void> createCartForUser(String userId);

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size);

  Future<CartProductsEntity> fetchCartUser();

  Future<void> updateCheckoutStatus(List<int> cartItemIds, bool isSelect);

  Future<void> deleteProductFromCart(String cartId);

  Future<void> updateItemQuantityFromCart(String cartItemId, int quantity);

  Future<CartCheckoutProductsEntity> fetchProductCheckout();
}
