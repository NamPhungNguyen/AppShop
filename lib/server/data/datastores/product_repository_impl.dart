import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ClientService _clientService;
  ProductRepositoryImpl(this._clientService);
  @override
  Future<ProductsEntity> fetchAllProduct() async {
    return await _clientService.fetchAllProduct();
  }
}
