import '../models/product.dart';

abstract class ProductUsecase {
  Future<Products> fetchAllProduct();
  Future<void> addProductToFavorites(String productId);
  Future<void> removeProductToFavorites(String productId);
  Future<List<Product>> fetchAllProductToFavorites();
}
