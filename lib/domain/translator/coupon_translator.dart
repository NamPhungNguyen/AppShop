import '../../server/data/entities/coupon_entity.dart';
import '../models/coupon.dart';

class CouponTranslator {
  static List<Coupon> translate(final List<CouponEntity> entities) {
    return entities.map((entity) {
      return Coupon(
        id: entity.id,
        poolCode: entity.poolCode,
        code: entity.code,
        discountAmount: entity.discountAmount,
        expiryDate: entity.expiryDate,
        active: entity.active,
        claimed: entity.claimed,
        totalQuantity: entity.totalQuantity,
        remainingQuantity: entity.remainingQuantity,
        claimedByUsers: entity.claimedByUsers != null
            ? translateAll(entity.claimedByUsers!)
            : [],
      );
    }).toList();
  }

  static List<ClaimedByUser> translateAll(
      final List<ClaimedByUserEntity> entities) {
    return entities.map((entity) {
      return ClaimedByUser(
        id: entity.id,
        used: entity.used,
      );
    }).toList();
  }
}
