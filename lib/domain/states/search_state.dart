import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain_modules.dart';
import '../models/product.dart';

class SearchState extends StateNotifier<AsyncValue<List<Product>>> {
  final StateNotifierProviderRef _ref;

  SearchState(this._ref) : super(const AsyncValue.loading());

  // This method is responsible for calling the API when triggered
  Future<void> searchAndFilter(
      String? name,
      double? priceMin,
      double? priceMax,
      ) async {
    if (name == null || name.isEmpty) {
      state = AsyncValue.data([]);  // Return empty list if search query is empty
      return;
    }

    state = const AsyncValue.loading();  // Set loading state before calling API
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final products = await productUsecase.searchAndFilter(name, priceMin, priceMax);
      state = AsyncValue.data(products);  // Set data when API call succeeds
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);  // Set error state on failure
    }
  }
}

