import 'package:front_shop/domain/models/cart_product.dart';
import 'package:front_shop/domain/translator/cart_product_translator.dart';
import 'package:front_shop/domain/usecases/cart_usecase.dart';
import 'package:front_shop/server/data/repository/cart_repository.dart';

class CartUsecaseImpl implements CartUsecase {
  final CartRepository _cartRepository;

  CartUsecaseImpl(this._cartRepository);

  @override
  Future<void> createCartForUser(String userId) async {
    return await _cartRepository.createCartForUser(userId);
  }

  @override
  Future<void> addProductToCart(
      int productId, int quantity, String color, String size) async {
    return await _cartRepository.addProductToCart(
        productId, quantity, color, size);
  }

  @override
  Future<CartProducts> fetchCartUser() async {
    final entity = await _cartRepository.fetchCartUser();
    return CartProductTranslator.translateAll(entity);
  }

  @override
  Future<void> deleteProductFromCart(String cartId) async {
    return await _cartRepository.deleteProductFromCart(cartId);
  }

  @override
  Future<void> updateItemQuantityFromCart(
      String cartItemId, int quantity) async {
    return await _cartRepository.updateItemQuantityFromCart(
        cartItemId, quantity);
  }

  @override
  Future<void> updateCheckoutStatus(
      List<int> cartItemIds, bool isSelect) async {
    return await _cartRepository.updateCheckoutStatus(cartItemIds, isSelect);
  }
}
