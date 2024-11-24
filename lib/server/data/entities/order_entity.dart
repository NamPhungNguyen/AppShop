import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
class OrderEntity with _$OrderEntity {
  factory OrderEntity({
    required int orderId,
    required double totalAmount,
    required String status,
    required List<ProductOrderEntity> products,
    required int addressId,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, dynamic> json) => _$OrderEntityFromJson(json);
}

@freezed
class ProductOrderEntity with _$ProductOrderEntity {
  factory ProductOrderEntity({
    required int productId,
    required String productName,
    required String imageUrl,
    required double price,
    required String size,
    required String color,
    required int quantity,
    required double discount,
    required double totalPrice,
    required double discountPrice,
  }) = _ProductOrderEntity;

  factory ProductOrderEntity.fromJson(Map<String, dynamic> json) => _$ProductOrderEntityFromJson(json);
}
