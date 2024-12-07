// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_revenue_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyRevenueEntityImpl _$$MonthlyRevenueEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyRevenueEntityImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlyRevenueEntityImplToJson(
        _$MonthlyRevenueEntityImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'revenue': instance.revenue,
    };
