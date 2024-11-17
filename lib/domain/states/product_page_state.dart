import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product_page.dart';

import '../domain_modules.dart';

class ProductPageState extends StateNotifier<AsyncValue<ProductPage>> {
  final StateNotifierProviderRef _ref;

  ProductPageState(this._ref) : super(const AsyncValue.loading());

  Future<void> getProductsPage(int page, int size) async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final products = await productUsecase.getProductsPage(page, size);
      state = AsyncValue.data(products);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
