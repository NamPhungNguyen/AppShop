import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/product_page_entity.dart';

abstract class ProductRepository {
  Future<ProductsEntity> fetchAllProduct();

  Future<ProductsEntity> fetchAllProductByCategory(String categoryId);

  Future<ProductPageEntity> getProductsPage(int page, int size);

  Future<void> addProductToFavorites(String productId);

  Future<void> removeProductToFavorites(String productId);

  Future<List<ProductEntity>> fetchAllProductToFavorites();

  Future<List<ProductEntity>> searchAndFilter(
      String? name, double? priceMin, double? priceMax, bool sortByPriceAsc);
}
