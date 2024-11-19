import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/usecases/order_usecase.dart';

class OrderState extends StateNotifier<AsyncValue<void>> {
  final OrderUsecase _orderUsecase;

  OrderState(this._orderUsecase) : super(const AsyncValue.loading());

  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId) async {
    try {
      state = const AsyncValue.loading();
      await _orderUsecase.createOrder(paymentMethod, couponCode, addressId);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
