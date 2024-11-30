import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/server/data/entities/shipping_address_entity.dart';

class ShippingAddressTranslator {
  static ShippingAddress translate(final ShippingAddressEntity entity) {
    return ShippingAddress(
      addressId: entity.addressId,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      addressDetail: entity.addressDetail,
      additionalAddress: entity.additionalAddress,
      province: entity.province,
      city: entity.city,
      country: entity.country,
      isDefault: entity.isDefault,
    );
  }

  static ShippingAddresses translateAll(final ShippingAddressesEntity entity) {
    return ShippingAddresses(
      result: entity.result.map((e) => translate(e)).toList(),
    );
  }

  static ShippingAddressDefault translateDefault(
      final ShippingAddressDefaultEntity entity) {
    return ShippingAddressDefault(
      result: entity.result
          .map((e) => translate(e)) // Gọi hàm translate cho từng phần tử
          .toList(), // Chuyển Iterable thành List
    );
  }
}
