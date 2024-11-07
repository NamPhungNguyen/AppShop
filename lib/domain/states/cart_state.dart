import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/cart_product.dart';

class CartState extends StateNotifier<AsyncValue<CartProducts>> {
  final Ref _ref;

  CartState(this._ref) : super(const AsyncData(CartProducts(result: []))) {
    _init();
  }

  Future<void> _init() async {
    await fetchCartUser();
  }

  Future<void> createCartForUser(String userId) async {
    state = const AsyncLoading();
    try {
      final cartUsecase = _ref.read(cartUsecaseProvider);
      await cartUsecase.createCartForUser(userId);
      state = const AsyncData(CartProducts(result: []));
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      print('Error creating cart: $error');
    }
  }

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size) async {
    state = const AsyncLoading();
    try {
      final cartUsecase = _ref.read(cartUsecaseProvider);
      await cartUsecase.addProductToCart(productId, quantity, color, size);
      await fetchCartUser();
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> deleteProductFromCart(String cartId) async {
    state = const AsyncLoading();
    try {
      final cartUsecase = _ref.read(cartUsecaseProvider);
      await cartUsecase.deleteProductFromCart(cartId);
      await fetchCartUser();
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> fetchCartUser() async {
    state = const AsyncLoading();
    try {
      final cartUsecase = _ref.read(cartUsecaseProvider);
      final cartProducts = await cartUsecase.fetchCartUser();
      state = AsyncData(cartProducts);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
