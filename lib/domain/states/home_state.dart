import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/domain/models/product.dart';

import '../domain_modules.dart';

class HomeState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final StateNotifierProviderRef _ref;

  HomeState(this._ref) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();

    try {
      final categoryUsecase = await _ref.read(categoryUsecaseProvider);
      final productUsecase = await _ref.read(productUsecaseProvider);

      final categoriesFuture = categoryUsecase.fetchAllCategories();
      final productsFuture = productUsecase.fetchAllProduct();

      final results = await Future.wait([categoriesFuture, productsFuture]);
      final categories = results[0] as Categories;
      final products = results[1] as Products;

      state = AsyncValue.data({'categories': categories, 'products': products});
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
