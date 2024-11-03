import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_entity.g.dart';
part 'cart_product_entity.freezed.dart';

@freezed
class CartProductEntity with _$CartProductEntity {
  const factory CartProductEntity({
    required int cartItemId,
    required int productId,
    required String productName,
    required String imageUrl,
    required double price,
    required String size,
    required String color,
    required int quantity,
  }) = _CartProductEntity;

  factory CartProductEntity.fromJson(Map<String, dynamic> json) => _$CartProductEntityFromJson(json);
}

@freezed
class CartProductsEntity with _$CartProductsEntity {
  const factory CartProductsEntity({
    required List<CartProductEntity> result
  }) = _CartProductsEntity;

  factory CartProductsEntity.fromJson(Map<String, dynamic> json) => _$CartProductsEntityFromJson(json);
}
