import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_revenue_entity.freezed.dart';
part 'monthly_revenue_entity.g.dart';

@freezed
class MonthlyRevenueEntity with _$MonthlyRevenueEntity {
  const factory MonthlyRevenueEntity({
    required int month,
    required int year,
    required double revenue,
  }) = _MonthlyRevenueEntity;

  factory MonthlyRevenueEntity.fromJson(Map<String, dynamic> json) =>
      _$MonthlyRevenueEntityFromJson(json);
}
