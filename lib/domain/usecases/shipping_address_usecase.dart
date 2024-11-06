import 'package:front_shop/domain/models/shipping_address.dart';

abstract class ShippingAddressUsecase {
  Future<ShippingAddresses> fetchAllShippingAdress();
}