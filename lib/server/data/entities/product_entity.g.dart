// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsEntityImpl _$$ProductsEntityImplFromJson(Map<String, dynamic> json) =>
    _$ProductsEntityImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductsEntityImplToJson(
        _$ProductsEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$ProductEntityImpl _$$ProductEntityImplFromJson(Map<String, dynamic> json) =>
    _$ProductEntityImpl(
      productId: (json['productId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      stock: (json['stock'] as num).toInt(),
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      brand: json['brand'] as String,
      productCode: json['productCode'] as String?,
      imgProduct: (json['imgProduct'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      available: json['available'] as bool,
    );

Map<String, dynamic> _$$ProductEntityImplToJson(_$ProductEntityImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'stock': instance.stock,
      'size': instance.size,
      'color': instance.color,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'commentCount': instance.commentCount,
      'brand': instance.brand,
      'productCode': instance.productCode,
      'imgProduct': instance.imgProduct,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'available': instance.available,
    };
