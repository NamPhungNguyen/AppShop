import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product_page.dart';

import '../domain_modules.dart';

class ProductPageState extends StateNotifier<AsyncValue<ProductPage>> {
  final Ref _ref;
  bool _isLoadingMore = false; // Trạng thái tải thêm
  int _currentPage = 0;

  ProductPageState(this._ref) : super(const AsyncValue.loading());

  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadProducts(int page, int size, {bool isLoadMore = false}) async {
    try {
      // Tránh gọi lại nếu đang tải thêm
      if (_isLoadingMore && isLoadMore) return;

      // Cập nhật trạng thái khi bắt đầu tải
      if (isLoadMore) {
        _isLoadingMore = true;
      } else {
        state = const AsyncValue.loading();
      }

      final productPageUsecase = _ref.read(productUsecaseProvider);
      final productPage = await productPageUsecase.getProductsPage(page, size);

      if (isLoadMore && state is AsyncData<ProductPage>) {
        final previousProducts = (state as AsyncData<ProductPage>).value.content;
        final updatedProductPage = (state as AsyncData<ProductPage>).value.copyWith(
          content: [...previousProducts, ...productPage.content],
        );
        state = AsyncValue.data(updatedProductPage);
      } else {
        state = AsyncValue.data(productPage);
      }

      if (isLoadMore) {
        _currentPage++;
      }
    } catch (e, stackTrace) {
      print('Error while loading products: $e');
      print(stackTrace);
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> fetchInitialProducts(int size) async {
    _currentPage = 0; // Đặt lại trang về 0
    await loadProducts(_currentPage, size);
  }

  Future<void> loadMoreProducts(int size) async {
    await loadProducts(_currentPage + 1, size, isLoadMore: true);
  }
}
