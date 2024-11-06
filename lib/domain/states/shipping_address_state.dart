import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/shipping_address.dart';

class ShippingAddressState
    extends StateNotifier<AsyncValue<ShippingAddresses>> {
  final StateNotifierProviderRef _ref;

  ShippingAddressState(this._ref) : super(const AsyncValue.loading());

  Future<void> fetchAllShippingAddress() async {
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

  Future<void> addShippingAddress(
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool isDefault = false,
  }) async {
    state = const AsyncValue.loading();
    try {
      final shippingAddressUsecase = _ref.watch(shippingAddressUsecaseProvider);
      await shippingAddressUsecase.addShippingAddress(
        fullName,
        phoneNumber,
        addressDetail,
        province,
        city,
        additionAddress: additionAddress,
        isDefault: isDefault,
      );

      await fetchAllShippingAddress();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteShippingAddress(String addressId) async {
    state = const AsyncValue.loading();
    try {
      final shippingAddressUsecase = _ref.watch(shippingAddressUsecaseProvider);
      await shippingAddressUsecase.deleteShippingAddress(addressId);
      await fetchAllShippingAddress();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> setDefaultShippingAddress(String addressId) async {
    state = const AsyncValue.loading();
    try {
      final shippingAddressUsecase = _ref.watch(shippingAddressUsecaseProvider);
      await shippingAddressUsecase.setDefaultShippingAddress(addressId);
      await fetchAllShippingAddress();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateShippingAddress(
    String addressId,
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool? isDefault,
  }) async {
    state = const AsyncValue.loading();
    try {
      final shippingAddressUsecase = _ref.watch(shippingAddressUsecaseProvider);
      await shippingAddressUsecase.updateShippingAddress(
        addressId,
        fullName,
        phoneNumber,
        addressDetail,
        province,
        city,
        additionAddress: additionAddress,
        isDefault: isDefault,
      );

      await fetchAllShippingAddress();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
