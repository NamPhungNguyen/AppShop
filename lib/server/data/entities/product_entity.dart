import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

part 'product_entity.g.dart';

@freezed
class ProductsEntity with _$ProductsEntity {
  const factory ProductsEntity({
    required List<ProductEntity> result
}) = _ProductsEntity;
  factory ProductsEntity.fromJson(Map<String, dynamic> json) => _$ProductsEntityFromJson(json);
}

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int productId,
    required String name,
    required String description,
    required double price,
    double? discount,
    required int stock,
    required List<String> size,
    required List<String> color,
    required double rating,
    required int ratingCount,
    required int commentCount,
    required String brand,
    String? productCode,
    required List<String> imgProduct,
    required int categoryId,
    required String categoryName,
    DateTime? createdAt,
    DateTime? updatedAt,
    required bool available,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
}
