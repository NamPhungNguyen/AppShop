import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/usecases/order_usecase.dart';

import '../models/order.dart';

class OrderState extends StateNotifier<AsyncValue<List<Order>>> {
  final OrderUsecase _orderUsecase;

  OrderState(this._orderUsecase) : super(const AsyncValue.loading());

  Future<void> fetchAllOrders() async {
    try {
      state = const AsyncValue.loading();
      final orders = await _orderUsecase.fetchAllOrder();
      state = AsyncValue.data(orders);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      await _orderUsecase.cancelOrder(orderId);
      await fetchAllOrders();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createOrder(
      String? paymentMethod, String? couponCode, int addressId) async {
    try {
      state = const AsyncValue.loading();
      await _orderUsecase.createOrder(paymentMethod, couponCode, addressId);
      state = const AsyncValue.data([]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
