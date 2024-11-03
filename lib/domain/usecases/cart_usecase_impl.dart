import 'package:front_shop/domain/usecases/cart_usecase.dart';
import 'package:front_shop/server/data/repository/cart_repository.dart';

class CartUsecaseImpl implements CartUsecase {
  final CartRepository _cartRepository;

  CartUsecaseImpl(this._cartRepository);

  @override
  Future<void> createCartForUser() async {
    return await _cartRepository.createCartForUser();
  }

  @override
  Future<void> addProductToCart(
      int productId, int quantity, String color, String size) async {
    return await _cartRepository.addProductToCart(
        productId, quantity, color, size);
  }
}
