// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponEntityImpl _$$CouponEntityImplFromJson(Map<String, dynamic> json) =>
    _$CouponEntityImpl(
      id: (json['id'] as num).toInt(),
      poolCode: json['poolCode'] as String,
      code: json['code'] as String,
      discountAmount: (json['discountAmount'] as num).toDouble(),
      expiryDate: json['expiryDate'] as String,
      active: json['active'] as bool,
      claimed: json['claimed'] as bool,
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      remainingQuantity: (json['remainingQuantity'] as num).toInt(),
      claimedByUsers: (json['claimedByUsers'] as List<dynamic>?)
          ?.map((e) => ClaimedByUserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CouponEntityImplToJson(_$CouponEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poolCode': instance.poolCode,
      'code': instance.code,
      'discountAmount': instance.discountAmount,
      'expiryDate': instance.expiryDate,
      'active': instance.active,
      'claimed': instance.claimed,
      'totalQuantity': instance.totalQuantity,
      'remainingQuantity': instance.remainingQuantity,
      'claimedByUsers': instance.claimedByUsers,
    };

_$ClaimedByUserEntityImpl _$$ClaimedByUserEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ClaimedByUserEntityImpl(
      id: (json['id'] as num).toInt(),
      used: json['used'] as bool,
    );

Map<String, dynamic> _$$ClaimedByUserEntityImplToJson(
        _$ClaimedByUserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'used': instance.used,
    };
