import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/order_entity.dart';
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
}
