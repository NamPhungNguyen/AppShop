import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/cart_product.dart';

import '../domain_modules.dart';

class CheckoutState extends StateNotifier<AsyncValue<CartCheckoutProducts>> {
  final StateNotifierProviderRef _ref;

  CheckoutState(this._ref) : super(const AsyncValue.loading()) {
    fetchProductCheckout();
  }

  Future<void> fetchProductCheckout() async {
    state = const AsyncLoading();
    try {
      final cartUsecase = _ref.read(cartUsecaseProvider);
      final cartCheckoutProducts = await cartUsecase.fetchProductCheckout();
      state = AsyncData(cartCheckoutProducts);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
