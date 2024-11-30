import 'package:front_shop/domain/models/product_page.dart';

import '../models/product.dart';

abstract class ProductUsecase {
  Future<Products> fetchAllProduct();

  Future<Products> fetchAllProductByCategory(String categoryId);

  Future<ProductPage> getProductsPage(int page, int size);

  Future<void> addProductToFavorites(String productId);

  Future<void> removeProductToFavorites(String productId);

  Future<List<Product>> fetchAllProductToFavorites();

  Future<List<Product>> searchAndFilter(
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
}
