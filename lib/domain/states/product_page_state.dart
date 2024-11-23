import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product_page.dart';

import '../domain_modules.dart';

class ProductPageState extends StateNotifier<AsyncValue<ProductPage>> {
  final Ref _ref;
  bool _isLoadingMore = false; // Trạng thái tải thêm
  int _currentPage = 0; // Trang hiện tại

  ProductPageState(this._ref) : super(const AsyncValue.loading());

  bool get isLoadingMore => _isLoadingMore;

  // Hàm load sản phẩm
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

      // Gọi use case để lấy dữ liệu sản phẩm
      final productPageUsecase = _ref.read(productUsecaseProvider);
      final productPage = await productPageUsecase.getProductsPage(page, size);

      // Nếu đang tải thêm (load more), nối thêm sản phẩm vào danh sách hiện tại
      if (isLoadMore && state is AsyncData<ProductPage>) {
        final previousProducts = (state as AsyncData<ProductPage>).value.content;
        final updatedProductPage = (state as AsyncData<ProductPage>).value.copyWith(
          content: [...previousProducts, ...productPage.content],
        );
        state = AsyncValue.data(updatedProductPage);
      } else {
        // Nếu không phải load more, đặt lại toàn bộ dữ liệu
        state = AsyncValue.data(productPage);
      }

      // Cập nhật trang hiện tại
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

  // Hàm tải sản phẩm ban đầu
  Future<void> fetchInitialProducts(int size) async {
    _currentPage = 0; // Đặt lại trang về 0
    await loadProducts(_currentPage, size);
  }

  // Hàm tải thêm sản phẩm
  Future<void> loadMoreProducts(int size) async {
    await loadProducts(_currentPage + 1, size, isLoadMore: true);
  }
}
