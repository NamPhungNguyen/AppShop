// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pages_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderPagesEntityImpl _$$OrderPagesEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderPagesEntityImpl(
      content: (json['content'] as List<dynamic>)
          .map((e) => OrderContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable:
          PageableEntity.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool,
      totalElements: (json['totalElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      sort: SortEntity.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderPagesEntityImplToJson(
        _$OrderPagesEntityImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
    };

_$OrderContentEntityImpl _$$OrderContentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderContentEntityImpl(
      orderId: (json['orderId'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      status: json['status'] as String,
      products: (json['products'] as List<dynamic>)
          .map(
              (e) => ProductPageOrderEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      addressId: (json['addressId'] as num).toInt(),
      shippingAddress: ShippingPageAddressEntity.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OrderContentEntityImplToJson(
        _$OrderContentEntityImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'products': instance.products,
      'addressId': instance.addressId,
      'shippingAddress': instance.shippingAddress,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$ProductPageOrderEntityImpl _$$ProductPageOrderEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPageOrderEntityImpl(
      cartItemId: json['cartItemId'] as String?,
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toInt(),
      size: json['size'] as String,
      color: json['color'] as String,
      quantity: (json['quantity'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toInt(),
      discountPrice: (json['discountPrice'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductPageOrderEntityImplToJson(
        _$ProductPageOrderEntityImpl instance) =>
    <String, dynamic>{
      'cartItemId': instance.cartItemId,
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

_$ShippingPageAddressEntityImpl _$$ShippingPageAddressEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ShippingPageAddressEntityImpl(
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

Map<String, dynamic> _$$ShippingPageAddressEntityImplToJson(
        _$ShippingPageAddressEntityImpl instance) =>
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
