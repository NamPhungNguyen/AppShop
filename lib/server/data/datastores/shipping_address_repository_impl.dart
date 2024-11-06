import 'package:front_shop/server/data/entities/shipping_address_entity.dart';
import 'package:front_shop/server/data/repository/shipping_address_repository.dart';

import '../../client/client_service.dart';

class ShippingAddressRepositoryImpl implements ShippingAddressRepository {
  final ClientService _clientService;

  const ShippingAddressRepositoryImpl(this._clientService);

  @override
  Future<ShippingAddressesEntity> fetchAllShippingAdress() async {
    return await _clientService.fetchAllShippingAdress();
  }
}
