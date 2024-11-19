abstract class OrderRepository {
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId);
}
