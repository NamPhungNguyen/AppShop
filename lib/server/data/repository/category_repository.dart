import 'package:front_shop/server/data/entities/categories_entity.dart';

abstract class CategoryRepository {
  Future<CategoriesResponse> fetchALlCategories();
}