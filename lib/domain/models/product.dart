import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Products with _$Products {
  const factory Products({
    required List<Product> result
  }) = _Products;
}

@freezed
class Product with _$Product {
  const factory Product({
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
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool available,
  }) = _Product;
}

