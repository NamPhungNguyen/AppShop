import 'package:front_shop/server/data/entities/order_entity.dart';
import 'package:front_shop/server/data/entities/order_pages_entity.dart';

abstract class OrderRepository {
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId);

  Future<List<OrderEntity>> fetchAllOrder();

  Future<void> cancelOrder(String orderId);

  Future<void> updateStatusOrder(String orderId, String status);

  Future<OrderPagesEntity> getOrderPages(String status, int page, int size);

  Future<OrderPagesEntity> searchOrderPages(
    String? status,
    String? startDate,
    String? endDate,
    String? fullName,
    String? phoneNumber,
    String? addressDetail,
    int page,
    int size,
  );
}
