import 'package:front_shop/domain/models/cart_product.dart';

abstract class CartUsecase {
  Future<void> createCartForUser(String userId);

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size);

  Future<CartProducts> fetchCartUser();

  Future<void> deleteProductFromCart(String cartId);

  Future<void> updateCheckoutStatus(List<int> cartItemIds, bool isSelect);

  Future<void> updateItemQuantityFromCart(String cartItemId, int quantity);
}
