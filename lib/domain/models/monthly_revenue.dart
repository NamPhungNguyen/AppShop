import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_revenue.freezed.dart';

@freezed
class MonthlyRevenue with _$MonthlyRevenue {
  const factory MonthlyRevenue({
    required int month,
    required int year,
    required double revenue,
  }) = _MonthlyRevenue;
}
