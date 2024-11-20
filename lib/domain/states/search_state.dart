import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain_modules.dart';
import '../models/product.dart';

class SearchState extends StateNotifier<AsyncValue<List<Product>>> {
  final StateNotifierProviderRef _ref;

  SearchState(this._ref) : super(const AsyncValue.data([]));

  Future<void> searchAndFilter(
      String? name,
      double? priceMin,
      double? priceMax,
      ) async {
    print('Debugging: name=$name, priceMin=$priceMin, priceMax=$priceMax');
    if (name == null || name.isEmpty) {
      state = AsyncValue.data([]);  // Trả về danh sách rỗng nếu không có từ khóa tìm kiếm
      return;
    }

    state = const AsyncValue.loading();  // Đặt trạng thái loading trước khi gọi API
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final products = await productUsecase.searchAndFilter(name, priceMin, priceMax);
      state = AsyncValue.data(products);  // Đặt dữ liệu khi gọi API thành công
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);  // Đặt trạng thái lỗi nếu thất bại
    }
  }
}

