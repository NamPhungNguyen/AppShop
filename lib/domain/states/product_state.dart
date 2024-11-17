import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/product.dart';

class ProductState extends StateNotifier<AsyncValue<Products>> {
  final StateNotifierProviderRef _ref;

  ProductState(this._ref) : super(const AsyncValue.loading()) {
    fetchAllProduct();
  }

  Future<void> fetchAllProduct() async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = await _ref.read(productUsecaseProvider);
      final products = await productUsecase.fetchAllProduct();
      state = AsyncValue.data(products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> fetchAllProductByCategory(String categoryId) async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = await _ref.read(productUsecaseProvider);
      final products =
          await productUsecase.fetchAllProductByCategory(categoryId);
      state = AsyncValue.data(products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
