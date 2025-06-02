import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_entity.g.dart';
part 'categories_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required int categoryId,
    required String name,
    required String description,
    required String image,
  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);
}

@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    required List<CategoryEntity> result
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
}
