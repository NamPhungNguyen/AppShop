import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_shop/server/data/entities/product_page_entity.dart';

part 'order_pages.freezed.dart';

@freezed
class OrderPages with _$OrderPages {
  factory OrderPages({
    required List<OrderContent> content,
    required PageableEntity pageable,
    required bool last,
    required int totalElements,
    required int totalPages,
    required int size,
    required int number,
    required SortEntity sort,
  }) = _OrderPages;
}

@freezed
class OrderContent with _$OrderContent {
  factory OrderContent({
    required int orderId,
    required int totalAmount,
    required String status,
    required List<ProductPageOrder> products,
    required int addressId,
    required ShippingPageAddress shippingAddress,
    required String createdAt,
    required String updatedAt,
  }) = _OrderContent;
}

@freezed
class ProductPageOrder with _$ProductPageOrder {
  factory ProductPageOrder({
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
  }) = _ProductPageOrder;
}

@freezed
class ShippingPageAddress with _$ShippingPageAddress {
  factory ShippingPageAddress({
    required int addressId,
    required String fullName,
    required String phoneNumber,
    required String addressDetail,
    String? additionalAddress,
    required String province,
    required String city,
    required String country,
    required bool isDefault,
  }) = _ShippingPageAddress;
}