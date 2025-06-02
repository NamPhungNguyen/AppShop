import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';

import '../models/order_pages.dart';

class OrderPagesState extends StateNotifier<AsyncValue<OrderPages>> {
  final StateNotifierProviderRef _ref;

  OrderPagesState(this._ref) : super(const AsyncValue.loading());

  Future<void> fetchOrderPages(String status, int page, int size) async {
    try {
      state = const AsyncValue.loading();
      final orderUsecase = _ref.read(orderUsecaseProvider);
      final orderPages = await orderUsecase.getOrderPages(status, page, size);
      state = AsyncValue.data(orderPages);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> searchOrderPages({
    String? status,
    String? startDate,
    String? endDate,
    String? fullName,
    String? phoneNumber,
    String? addressDetail,
    required int page,
    required int size,
  }) async {
    try {
      state = const AsyncValue.loading();
      final orderUsecase = _ref.read(orderUsecaseProvider);
      final orderPages = await orderUsecase.searchOrderPages(status, startDate,
          endDate, fullName, phoneNumber, addressDetail, page, size);
      state = AsyncValue.data(orderPages);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateStatusOrder(String orderId, String status) async {
    try {
      final orderUsecase = _ref.read(orderUsecaseProvider);
      await orderUsecase.updateStatusOrder(orderId, status);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
