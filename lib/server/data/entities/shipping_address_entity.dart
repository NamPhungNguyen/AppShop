import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_address_entity.freezed.dart';
part 'shipping_address_entity.g.dart';

@freezed
class ShippingAddressEntity with _$ShippingAddressEntity {
  const factory ShippingAddressEntity({
    required int addressId,
    required String fullName,
    required String phoneNumber,
    required String addressDetail,
    String? additionalAddress,
    required String province,
    required String city,
    required String country,
    required bool isDefault,
  }) = _ShippingAddressEntity;

  factory ShippingAddressEntity.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressEntityFromJson(json);
}

@freezed
class ShippingAddressesEntity with _$ShippingAddressesEntity {
  const factory ShippingAddressesEntity({
    required List<ShippingAddressEntity> result,
  }) = _ShippingAddressesEntity;

  factory ShippingAddressesEntity.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressesEntityFromJson(json);
}

@freezed
class ShippingAddressDefaultEntity with _$ShippingAddressDefaultEntity {
  const factory ShippingAddressDefaultEntity(
      {required List<ShippingAddressEntity> result}) = _ShippingAddressDefaultEntity;

  factory ShippingAddressDefaultEntity.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressDefaultEntityFromJson(json);
}
