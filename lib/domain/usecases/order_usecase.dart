abstract class OrderUsecase {
  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId);
}
