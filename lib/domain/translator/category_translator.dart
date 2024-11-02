import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';

class CategoryTranslator {
  static Category translate(final CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      description: entity.description,
      image: entity.image,
    );
  }

  static Categories translateAll(final CategoriesResponse entity) {
    return Categories(result: entity.result.map((e) => translate(e)).toList());
  }
}
