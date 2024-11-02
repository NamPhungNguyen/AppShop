import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/category.dart';

class CategoryState extends StateNotifier<AsyncValue<Categories>> {
  final StateNotifierProviderRef _ref;

  CategoryState(this._ref) : super(const AsyncValue.loading()) {
    fetchAllCategories();
  }

  Future<void> fetchAllCategories() async {
    state = const AsyncValue.loading();
    try {
      final categoryUsecase = await _ref.read(categoryUsecaseProvider);
      final categories = await categoryUsecase.fetchAllCategories();
      state = AsyncValue.data(categories);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
