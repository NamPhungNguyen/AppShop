// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_apply_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponApplyEntityImpl _$$CouponApplyEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CouponApplyEntityImpl(
      result:
          CouponResultEntity.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CouponApplyEntityImplToJson(
        _$CouponApplyEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$CouponResultEntityImpl _$$CouponResultEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CouponResultEntityImpl(
      totalAfterDiscount: (json['totalAfterDiscount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      totalBeforeDiscount: (json['totalBeforeDiscount'] as num).toDouble(),
    );

Map<String, dynamic> _$$CouponResultEntityImplToJson(
        _$CouponResultEntityImpl instance) =>
    <String, dynamic>{
      'totalAfterDiscount': instance.totalAfterDiscount,
      'discountAmount': instance.discountAmount,
      'totalBeforeDiscount': instance.totalBeforeDiscount,
    };
