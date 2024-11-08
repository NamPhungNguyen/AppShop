// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShippingAddressEntityImpl _$$ShippingAddressEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ShippingAddressEntityImpl(
      addressId: (json['addressId'] as num).toInt(),
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      addressDetail: json['addressDetail'] as String,
      additionalAddress: json['additionalAddress'] as String?,
      province: json['province'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$ShippingAddressEntityImplToJson(
        _$ShippingAddressEntityImpl instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'addressDetail': instance.addressDetail,
      'additionalAddress': instance.additionalAddress,
      'province': instance.province,
      'city': instance.city,
      'country': instance.country,
      'isDefault': instance.isDefault,
    };

_$ShippingAddressesEntityImpl _$$ShippingAddressesEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ShippingAddressesEntityImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => ShippingAddressEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShippingAddressesEntityImplToJson(
        _$ShippingAddressesEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$ShippingAddressDefaultEntityImpl _$$ShippingAddressDefaultEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ShippingAddressDefaultEntityImpl(
      result: ShippingAddressEntity.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShippingAddressDefaultEntityImplToJson(
        _$ShippingAddressDefaultEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
