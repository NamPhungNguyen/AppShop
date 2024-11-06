import 'package:front_shop/server/data/entities/shipping_address_entity.dart';

abstract class ShippingAddressRepository {
  Future<ShippingAddressesEntity> fetchAllShippingAdress();
}
