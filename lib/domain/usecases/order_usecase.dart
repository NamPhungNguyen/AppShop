import 'package:front_shop/domain/models/order.dart';

abstract class OrderUsecase {
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId);

  Future<List<Order>> fetchAllOrder();
}
