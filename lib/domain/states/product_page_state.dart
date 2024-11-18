import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product_page.dart';

import '../domain_modules.dart';

class ProductPageState extends StateNotifier<AsyncValue<ProductPage>> {
  final StateNotifierProviderRef _ref;
  int _currentPage = 0;
  bool _hasMore = true;

  ProductPageState(this._ref) : super(const AsyncValue.loading());

  Future<void> loadInitialProducts(int pageSize) async {
    _currentPage = 0;
    _hasMore = true;
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final productsPage =
          await productUsecase.getProductsPage(_currentPage, pageSize);
      _currentPage++;
      _hasMore = !productsPage.last;
      state = AsyncValue.data(productsPage);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> loadMoreProducts(int pageSize) async {
    if (!_hasMore || state.isLoading) return;

    final currentData = state.valueOrNull;
    state = const AsyncValue.loading();

    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final nextPage =
          await productUsecase.getProductsPage(_currentPage, pageSize);

      _currentPage++;
      _hasMore = !nextPage.last;

      state = AsyncValue.data(ProductPage(
        content: [...(currentData?.content ?? []), ...nextPage.content],
        pageable: nextPage.pageable,
        last: nextPage.last,
        totalElements: nextPage.totalElements,
        totalPages: nextPage.totalPages,
        size: nextPage.size,
        number: nextPage.number,
        sort: nextPage.sort,
        first: nextPage.first,
        numberOfElements: nextPage.numberOfElements,
        empty: nextPage.empty,
      ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
