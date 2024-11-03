import 'package:front_shop/domain/models/cart_product.dart';
import 'package:front_shop/server/data/entities/cart_product_entity.dart';

class CartProductTranslator {
  static CartProduct translate(final CartProductEntity entity) {
    return CartProduct(
      cartItemId: entity.cartItemId,
      productId: entity.productId,
      productName: entity.productName,
      imageUrl: entity.imageUrl,
      price: entity.price,
      size: entity.size,
      color: entity.color,
      quantity: entity.quantity,
    );
  }

  static CartProducts translateAll(final CartProductsEntity entity) {
    return CartProducts(
        result: entity.result.map((e) => translate(e)).toList());
  }
}
