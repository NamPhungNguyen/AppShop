// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderEntityImpl _$$OrderEntityImplFromJson(Map<String, dynamic> json) =>
    _$OrderEntityImpl(
      orderId: (json['orderId'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductOrderEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      addressId: (json['addressId'] as num).toInt(),
      shippingAddress: AddressEntity.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderEntityImplToJson(_$OrderEntityImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'products': instance.products,
      'addressId': instance.addressId,
      'shippingAddress': instance.shippingAddress,
    };

_$ProductOrderEntityImpl _$$ProductOrderEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductOrderEntityImpl(
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      size: json['size'] as String,
      color: json['color'] as String,
      quantity: (json['quantity'] as num).toInt(),
      discount: (json['discount'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductOrderEntityImplToJson(
        _$ProductOrderEntityImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'size': instance.size,
      'color': instance.color,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'totalPrice': instance.totalPrice,
      'discountPrice': instance.discountPrice,
    };

_$AddressEntityImpl _$$AddressEntityImplFromJson(Map<String, dynamic> json) =>
    _$AddressEntityImpl(
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

Map<String, dynamic> _$$AddressEntityImplToJson(_$AddressEntityImpl instance) =>
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
