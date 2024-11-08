import 'package:front_shop/domain/models/shipping_address.dart';

abstract class ShippingAddressUsecase {
  Future<ShippingAddresses> fetchAllShippingAddress();

  Future<ShippingAddressDefault> getAddressDefault();

  Future<void> addShippingAddress(
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool isDefault = false,
  });

  Future<void> deleteShippingAddress(String addressId);

  Future<void> setDefaultShippingAddress(String addressId);

  Future<void> updateShippingAddress(
    String addressId,
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool? isDefault,
  });
}
