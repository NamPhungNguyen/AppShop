import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int categoryId,
    required String name,
    required String description,
    required String image,
  }) = _Category;
}

@freezed
class Categories with _$Categories {
  const factory Categories({required List<Category> result}) = _Categories;
}
