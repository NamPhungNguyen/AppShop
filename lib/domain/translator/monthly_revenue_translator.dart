import 'package:front_shop/domain/models/monthly_revenue.dart';
import 'package:front_shop/server/data/entities/monthly_revenue_entity.dart';

class MonthlyRevenueTranslator {
  static List<MonthlyRevenue> translatorAll(
      List<MonthlyRevenueEntity> entities) {
    return entities.map((entity) {
      return MonthlyRevenue(
        month: entity.month,
        year: entity.year,
        revenue: entity.revenue,
      );
    }).toList();
  }
}
