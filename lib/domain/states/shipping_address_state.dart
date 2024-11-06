import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/shipping_address.dart';

class ShippingAddressState
    extends StateNotifier<AsyncValue<ShippingAddresses>> {
  final StateNotifierProviderRef _ref;

  ShippingAddressState(this._ref) : super(const AsyncValue.loading());

  Future<void> fetchAllShippingAdress() async {
    state = const AsyncValue.loading();
    try {
      final shippingAddressUsecase = _ref.watch(shippingAddressUsecaseProvider);
      final shippingAddresses =
          await shippingAddressUsecase.fetchAllShippingAdress();
      state = AsyncValue.data(shippingAddresses);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
