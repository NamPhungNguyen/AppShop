import 'package:front_shop/server/data/entities/order_entity.dart';

abstract class OrderRepository {
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId);

  Future<List<OrderEntity>> fetchAllOrder();
}
