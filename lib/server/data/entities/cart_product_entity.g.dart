// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductEntityImpl _$$CartProductEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CartProductEntityImpl(
      cartItemId: (json['cartItemId'] as num).toInt(),
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

Map<String, dynamic> _$$CartProductEntityImplToJson(
        _$CartProductEntityImpl instance) =>
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

_$CartProductsEntityImpl _$$CartProductsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CartProductsEntityImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => CartProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartProductsEntityImplToJson(
        _$CartProductsEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
