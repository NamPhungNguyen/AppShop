import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/monthly_revenue.dart';

import '../domain_modules.dart';

class MonthlyState extends StateNotifier<AsyncValue<List<MonthlyRevenue>>> {
  final StateNotifierProviderRef _ref;

  MonthlyState(this._ref) : super(const AsyncValue.loading()) {
    getMonthlyRevenue();
  }

  Future<void> getMonthlyRevenue() async {
    try {
      state = const AsyncValue.loading();
      final orderUsecase = _ref.read(orderUsecaseProvider);
      final monthly = await orderUsecase.getMonthlyRevenue();
      state = AsyncValue.data(monthly);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
