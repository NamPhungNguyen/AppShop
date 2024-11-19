import 'package:front_shop/server/client/client_service.dart';
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
}
