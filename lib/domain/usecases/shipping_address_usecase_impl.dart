import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/domain/translator/shipping_address_translator.dart';
import 'package:front_shop/domain/usecases/shipping_address_usecase.dart';
import 'package:front_shop/server/data/repository/shipping_address_repository.dart';

class ShippingAddressUsecaseImpl implements ShippingAddressUsecase {
  final ShippingAddressRepository _shippingAddressRepository;

  const ShippingAddressUsecaseImpl(this._shippingAddressRepository);

  @override
  Future<ShippingAddresses> fetchAllShippingAdress() async {
    final entity = await _shippingAddressRepository.fetchAllShippingAddress();
    return ShippingAddressTranslator.translateAll(entity);
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
    return _shippingAddressRepository.addShippingAddress(
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
    return _shippingAddressRepository.deleteShippingAddress(addressId);
  }

  @override
  Future<void> setDefaultShippingAddress(String addressId) async {
    return _shippingAddressRepository.setDefaultShippingAddress(addressId);
  }
}
