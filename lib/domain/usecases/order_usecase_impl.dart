import 'package:front_shop/domain/models/order.dart';
import 'package:front_shop/domain/translator/order_translator.dart';
import 'package:front_shop/domain/usecases/order_usecase.dart';
import 'package:front_shop/server/data/repository/order_repository.dart';

class OrderUsecaseImpl implements OrderUsecase {
  final OrderRepository _orderRepository;

  OrderUsecaseImpl(this._orderRepository);

  @override
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId) async {
    return await _orderRepository.createOrder(
        paymentMethod, couponCode, addressId);
  }

  @override
  Future<List<Order>> fetchAllOrder() async {
    final entity = await _orderRepository.fetchAllOrder();
    return OrderTranslator.translate(entity);
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    return await _orderRepository.cancelOrder(orderId);
  }
}
