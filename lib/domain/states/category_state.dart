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
      final categoryUsecase = _ref.read(categoryUsecaseProvider);
      final categories = await categoryUsecase.fetchAllCategories();
      state = AsyncValue.data(categories);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createCategory(
      String name, String description, String image) async {
    state = const AsyncValue.loading();
    try {
      final categoryUsecase = _ref.read(categoryUsecaseProvider);
      await categoryUsecase.createCategory(name, description, image);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateCategory(
    String categoryId,
    String name,
    String description,
    String image,
  ) async {
    state = const AsyncValue.loading();
    try {
      final categoryUsecase = _ref.read(categoryUsecaseProvider);
      await categoryUsecase.updateCategory(
        categoryId,
        name,
        description,
        image,
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    state = const AsyncValue.loading();
    try {
      final categoryUsecase = _ref.read(categoryUsecaseProvider);
      await categoryUsecase.deleteCategory(categoryId);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
