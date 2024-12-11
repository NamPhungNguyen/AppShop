import 'package:front_shop/server/data/entities/product_entity.dart';
import 'package:front_shop/server/data/entities/product_page_entity.dart';

abstract class ProductRepository {
  Future<ProductsEntity> fetchAllProduct();

  Future<ProductsEntity> fetchAllProductByCategory(String categoryId);

  Future<ProductPageEntity> getProductsPage(int page, int size);

  Future<void> addProductToFavorites(String productId);

  Future<void> removeProductToFavorites(String productId);

  Future<List<ProductEntity>> fetchAllProductToFavorites();

  Future<void> deleteProduct(String productId);

  Future<List<ProductEntity>> searchAndFilter(
      String? name, double? priceMin, double? priceMax, bool sortByPriceAsc);

  Future<void> createProduct(
    String name,
    String description,
    double price,
    int stock,
    List<String> size,
    List<String> color,
    String brand,
    List<String> imgProduct,
    int categoryId,
    int discount,
  );

  Future<void> updateProduct(
    String productId,
    String? name,
    String? description,
    double? price,
    int? stock,
    List<String>? size,
    List<String>? color,
    String? brand,
    List<String>? imgProduct,
    int? categoryId,
    double? discount,
    bool? isAvailable,
  );
}
