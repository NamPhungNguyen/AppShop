import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_address.freezed.dart';

@freezed
class ShippingAddress with _$ShippingAddress {
  const factory ShippingAddress({
    required int addressId,
    required String fullName,
    required String phoneNumber,
    required String addressDetail,
    String? additionalAddress,
    required String province,
    required String city,
    required String country,
    required bool isDefault,
  }) = _ShippingAddress;
}

@freezed
class ShippingAddresses with _$ShippingAddresses {
  const factory ShippingAddresses({required List<ShippingAddress> result}) =
      _ShippingAddresses;
}

@freezed
class ShippingAddressDefault with _$ShippingAddressDefault {
  const factory ShippingAddressDefault({required ShippingAddress result}) =
      _ShippingAddressDefault;
}
