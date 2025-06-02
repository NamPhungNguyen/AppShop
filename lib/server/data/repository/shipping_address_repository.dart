import 'package:front_shop/server/data/entities/shipping_address_entity.dart';

abstract class ShippingAddressRepository {
  Future<ShippingAddressesEntity> fetchAllShippingAddress();
  Future<ShippingAddressDefaultEntity> getAddressDefault();

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
