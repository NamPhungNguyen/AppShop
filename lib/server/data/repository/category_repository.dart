import 'package:front_shop/server/data/entities/categories_entity.dart';

abstract class CategoryRepository {
  Future<CategoriesResponse> fetchALlCategories();

  Future<void> createCategory(String name, String description, String image);

  Future<void> updateCategory(
      String categoryId, String name, String description, String image);

  Future<void> deleteCategory(String categoryId);
}
