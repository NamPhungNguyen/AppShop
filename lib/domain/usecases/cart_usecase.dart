abstract class CartUsecase {
  Future<void> createCartForUser();

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size);
}
