import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain_modules.dart';
import '../models/product.dart';

class SearchState extends StateNotifier<AsyncValue<List<Product>>> {
  final StateNotifierProviderRef _ref;

  SearchState(this._ref) : super(const AsyncValue.data([]));

  Future<void> searchAndFilter(String? name, double? priceMin, double? priceMax,
      bool sortByPriceAsc) async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final products = await productUsecase.searchAndFilter(
        name,
        priceMin,
        priceMax,
        sortByPriceAsc,
      );
      state = AsyncValue.data(products);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
