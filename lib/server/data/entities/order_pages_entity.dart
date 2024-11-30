import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_shop/server/data/entities/product_page_entity.dart';

part 'order_pages_entity.freezed.dart';
part 'order_pages_entity.g.dart';

@freezed
class OrderPagesEntity with _$OrderPagesEntity {
  factory OrderPagesEntity({
    required List<OrderContentEntity> content,
    required PageableEntity pageable,
    required bool last,
    required int totalElements,
    required int totalPages,
    required int size,
    required int number,
    required SortEntity sort,
  }) = _OrderPagesEntity;

  factory OrderPagesEntity.fromJson(Map<String, dynamic> json) => _$OrderPagesEntityFromJson(json);
}

@freezed
class OrderContentEntity with _$OrderContentEntity {
  factory OrderContentEntity({
    required int orderId,
    required int totalAmount,
    required String status,
    required List<ProductPageOrderEntity> products,
    required int addressId,
    required String createdAt,
    required String updatedAt,
  }) = _OrderContentEntity;

  factory OrderContentEntity.fromJson(Map<String, dynamic> json) => _$OrderContentEntityFromJson(json);
}

@freezed
class ProductPageOrderEntity with _$ProductPageOrderEntity {
  factory ProductPageOrderEntity({
    String? cartItemId,
    required int productId,
    required String productName,
    required String imageUrl,
    required int price,
    required String size,
    required String color,
    required int quantity,
    required int discount,
    required int totalPrice,
    required int discountPrice,
  }) = _ProductPageOrderEntity;

  factory ProductPageOrderEntity.fromJson(Map<String, dynamic> json) => _$ProductPageOrderEntityFromJson(json);
}
