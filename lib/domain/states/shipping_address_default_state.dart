import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/shipping_address.dart';

class ShippingAddressDefaultState extends StateNotifier<AsyncValue<ShippingAddressDefault>> {
  final StateNotifierProviderRef _ref;

  ShippingAddressDefaultState(this._ref) : super(const AsyncValue.loading()){
    getDefaultAddress();
  }

  Future<void> getDefaultAddress() async {
    state = const AsyncValue.loading();
    try {
      final shippingAddressUsecase = _ref.watch(shippingAddressUsecaseProvider);
      final defaultAddress = await shippingAddressUsecase.getAddressDefault();
      state = AsyncValue.data(defaultAddress);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
