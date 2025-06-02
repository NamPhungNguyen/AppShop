import 'package:front_shop/domain/models/order.dart';

import '../models/monthly_revenue.dart';
import '../models/order_pages.dart';

abstract class OrderUsecase {
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId);

  Future<List<Order>> fetchAllOrder();

  Future<List<MonthlyRevenue>> getMonthlyRevenue();
  Future<void> cancelOrder(String orderId);

  Future<void> updateStatusOrder(String orderId, String status);

  Future<OrderPages> getOrderPages(String status, int page, int size);

  Future<OrderPages> searchOrderPages(
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
