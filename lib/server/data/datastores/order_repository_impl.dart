import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/monthly_revenue_entity.dart';
import 'package:front_shop/server/data/entities/order_entity.dart';
import 'package:front_shop/server/data/entities/order_pages_entity.dart';
import 'package:front_shop/server/data/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ClientService _clientService;

  OrderRepositoryImpl(this._clientService);

  @override
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId) async {
    return await _clientService.createOrder(
        paymentMethod, couponCode, addressId);
  }

  @override
  Future<List<OrderEntity>> fetchAllOrder() async {
    return await _clientService.fetchAllOrder();
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    return await _clientService.cancelOrder(orderId);
  }

  @override
  Future<OrderPagesEntity> getOrderPages(
      String status, int page, int size) async {
    return await _clientService.getOrderPages(status, page, size);
  }

  @override
  Future<OrderPagesEntity> searchOrderPages(
    String? status,
    String? startDate,
    String? endDate,
    String? fullName,
    String? phoneNumber,
    String? addressDetail,
    int page,
    int size,
  ) async {
    return await _clientService.searchOrderPages(status, startDate, endDate,
        fullName, phoneNumber, addressDetail, page, size);
  }

  @override
  Future<void> updateStatusOrder(String orderId, String status) async {
    return await _clientService.updateStatusOrder(orderId, status);
  }

  @override
  Future<List<MonthlyRevenueEntity>> getMonthlyRevenue() async {
    return await _clientService.getMonthlyRevenue();
  }
}
