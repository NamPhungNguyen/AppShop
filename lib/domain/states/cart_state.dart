import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';

class CartState extends StateNotifier<AsyncValue<void>> {
  final StateNotifierProviderRef _ref;

  CartState(this._ref) : super(const AsyncData(null));

  Future<void> createCartForUser() async {
    state = const AsyncLoading();
    try {
      final cartUsecase = await _ref.read(cartUsecaseProvider);
      await cartUsecase.createCartForUser();
      state = const AsyncData(null);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> addProductToCart(
      int productId, int quantity, String color, String size) async {
    state = const AsyncLoading(); // Set state to loading
    try {
      final cartUsecase = await _ref.read(cartUsecaseProvider);
      await cartUsecase.addProductToCart(productId, quantity, color, size);
      state = const AsyncData(null); // Set state to success
    } catch (error) {
      state = AsyncError(error, StackTrace.current); // Set state to error
    }
  }
}
