import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  factory Order({
    required int orderId,
    required double totalAmount,
    required String status,
    required List<ProductOrder> products,
    required int addressId,
  }) = _Order;
}

@freezed
class ProductOrder with _$ProductOrder {
  factory ProductOrder({
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
  }) = _ProductOrder;
}
