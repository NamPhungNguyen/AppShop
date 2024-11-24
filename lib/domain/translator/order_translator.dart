import 'package:front_shop/domain/models/order.dart';
import 'package:front_shop/server/data/entities/order_entity.dart';

class OrderTranslator {
  static List<Order> translate(List<OrderEntity> entities) {
    return entities.map((entity) => Order(
      orderId: entity.orderId,
      totalAmount: entity.totalAmount,
      status: entity.status,
      products: entity.products.map((productEntity) => translatorProductOrder(productEntity)).toList(),
      addressId: entity.addressId,
    )).toList();
  }

  static ProductOrder translatorProductOrder(ProductOrderEntity entity) {
    return ProductOrder(
      productId: entity.productId,
      productName: entity.productName,
      imageUrl: entity.imageUrl,
      price: entity.price,
      size: entity.size,
      color: entity.color,
      quantity: entity.quantity,
      discount: entity.discount,
      totalPrice: entity.totalPrice,
      discountPrice: entity.discountPrice,
    );
  }
}
