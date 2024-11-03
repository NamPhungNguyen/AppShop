import 'package:front_shop/server/data/entities/product_entity.dart';

abstract class ProductRepository {
  Future<ProductsEntity> fetchAllProduct();

  Future<void> addProductToFavorites(String productId);

  Future<void> removeProductToFavorites(String productId);

  Future<List<ProductEntity>> fetchAllProductToFavorites();
}
