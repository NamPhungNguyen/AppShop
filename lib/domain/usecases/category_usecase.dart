import 'package:front_shop/domain/models/category.dart';

abstract class CategoryUsecase {
  Future<Categories> fetchAllCategories();
}