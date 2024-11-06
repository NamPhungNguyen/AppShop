import 'package:front_shop/server/data/entities/shipping_address_entity.dart';
import 'package:front_shop/server/data/repository/shipping_address_repository.dart';

import '../../client/client_service.dart';

class ShippingAddressRepositoryImpl implements ShippingAddressRepository {
  final ClientService _clientService;

  const ShippingAddressRepositoryImpl(this._clientService);

  @override
  Future<ShippingAddressesEntity> fetchAllShippingAddress() async {
    return await _clientService.fetchAllShippingAddress();
  }

  @override
  Future<void> addShippingAddress(
    String fullName,
    String phoneNumber,
    String addressDetail,
    String province,
    String city, {
    String? additionAddress,
    bool isDefault = false,
  }) async {
    return await _clientService.addShippingAddress(
      fullName,
      phoneNumber,
      addressDetail,
      province,
      city,
      additionAddress: additionAddress,
      isDefault: isDefault,
    );
  }

  @override
  Future<void> deleteShippingAddress(String addressId) async {
    return await _clientService.deleteShippingAddress(addressId);
  }

  @override
  Future<void> setDefaultShippingAddress(String addressId) async {
    return await _clientService.setDefaultShippingAddress(addressId);
  }

  @override
  Future<void> updateShippingAddress(String addressId, String fullName,
      String phoneNumber, String addressDetail, String province, String city,
      {String? additionAddress, bool? isDefault}) async {
    return await _clientService.updateShippingAddress(
      addressId,
      fullName,
      phoneNumber,
      addressDetail,
      province,
      city,
      additionAddress: additionAddress,
      isDefault: isDefault,
    );
  }
}
