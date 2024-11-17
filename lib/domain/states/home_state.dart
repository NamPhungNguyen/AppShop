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
      // Fetch user info
      final userUsecase = await _ref.read(userUsecaseProvider);
      final userInfoFuture = userUsecase.myInfo();

      // Fetch categories and products
      final categoryUsecase = await _ref.read(categoryUsecaseProvider);
      final productUsecase = await _ref.read(productUsecaseProvider);

      final categoriesFuture = categoryUsecase.fetchAllCategories();
      final productsFuture = productUsecase.fetchAllProduct();

      // Wait for all futures
      final results = await Future.wait([
        userInfoFuture,
        categoriesFuture,
        productsFuture,
      ]);

      // Extract results
      final user = results[0];
      final categories = results[1] as Categories;
      final products = results[2] as Products;

      // Update state
      state = AsyncValue.data({
        'user': user,
        'categories': categories,
        'products': products,
      });
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
