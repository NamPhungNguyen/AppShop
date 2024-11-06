import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/domain/translator/shipping_address_translator.dart';
import 'package:front_shop/domain/usecases/shipping_address_usecase.dart';
import 'package:front_shop/server/data/repository/shipping_address_repository.dart';

class ShippingAddressUsecaseImpl implements ShippingAddressUsecase {
  final ShippingAddressRepository _shippingAddressRepository;

  const ShippingAddressUsecaseImpl(this._shippingAddressRepository);

  @override
  Future<ShippingAddresses> fetchAllShippingAdress() async {
    final entity = await _shippingAddressRepository.fetchAllShippingAdress();
    return ShippingAddressTranslator.translateAll(entity);
  }
}
