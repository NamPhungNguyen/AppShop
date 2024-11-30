import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/domain/models/shipping_address.dart';

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
      final userUsecase = _ref.read(userUsecaseProvider);
      final userInfoFuture = userUsecase.myInfo();

      // Fetch categories and products
      final categoryUsecase = _ref.read(categoryUsecaseProvider);
      final productUsecase = _ref.read(productUsecaseProvider);

      final categoriesFuture = categoryUsecase.fetchAllCategories();
      final productsFuture = productUsecase.fetchAllProduct();

      // Fetch default shipping address
      final shippingAddressUsecase = _ref.read(shippingAddressUsecaseProvider);
      final defaultShippingAddressFuture =
      shippingAddressUsecase.getAddressDefault();

      // Wait for all futures
      final results = await Future.wait([
        userInfoFuture,
        categoriesFuture,
        productsFuture,
        defaultShippingAddressFuture,
      ]);

      // Extract results
      final user = results[0];
      final categories = results[1] as Categories;
      final products = results[2] as Products;
      final defaultShippingAddress = results[3] as ShippingAddressDefault;

      // Update state with all data
      state = AsyncValue.data({
        'user': user,
        'categories': categories,
        'products': products,
        'shippingAddress': defaultShippingAddress,
      });
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
