import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product.freezed.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required int cartItemId,
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
  }) = _CartProduct;
}

@freezed
class CartProducts with _$CartProducts {
  const factory CartProducts({required List<CartProduct> result}) = _CartProducts;
}
