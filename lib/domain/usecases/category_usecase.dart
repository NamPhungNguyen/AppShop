import 'package:front_shop/domain/models/category.dart';

abstract class CategoryUsecase {
  Future<Categories> fetchAllCategories();

  Future<void> createCategory(String name, String description, String image);

  Future<void> updateCategory(
      String categoryId, String name, String description, String image);

  Future<void> deleteCategory(String categoryId);
}
