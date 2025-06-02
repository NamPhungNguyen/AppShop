import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/domain/models/product_page.dart';
import 'package:front_shop/domain/translator/product_translator.dart';
import 'package:front_shop/domain/usecases/product_usecase.dart';
import 'package:front_shop/server/data/repository/product_repository.dart';

class ProductUsecaseImpl implements ProductUsecase {
  final ProductRepository _productRepository;

  ProductUsecaseImpl(this._productRepository);

  @override
  Future<Products> fetchAllProduct() async {
    final entity = await _productRepository.fetchAllProduct();
    return ProductTranslator.translateAll(entity);
  }

  @override
  Future<Products> fetchAllProductByCategory(String categoryId) async {
    final entity =
        await _productRepository.fetchAllProductByCategory(categoryId);
    return ProductTranslator.translateAll(entity);
  }

  @override
  Future<ProductPage> getProductsPage(int page, int size) async {
    final entity = await _productRepository.getProductsPage(page, size);
    return ProductTranslator.translateProductPage(entity);
  }

  @override
  Future<void> addProductToFavorites(String productId) async {
    return await _productRepository.addProductToFavorites(productId);
  }

  @override
  Future<void> removeProductToFavorites(String productId) async {
    return await _productRepository.removeProductToFavorites(productId);
  }

  @override
  Future<List<Product>> fetchAllProductToFavorites() async {
    final entity = await _productRepository.fetchAllProductToFavorites();
    return ProductTranslator.translateListAll(entity);
  }

  @override
  Future<List<Product>> searchAndFilter(String? name, double? priceMin,
      double? priceMax, bool sortByPriceAsc) async {
    final entity = await _productRepository.searchAndFilter(
      name,
      priceMin,
      priceMax,
      sortByPriceAsc,
    );
    return ProductTranslator.translateListAll(entity);
  }

  @override
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
  ) async {
    return await _productRepository.createProduct(
      name,
      description,
      price,
      stock,
      size,
      color,
      brand,
      imgProduct,
      categoryId,
      discount,
    );
  }

  @override
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
  ) async {
    return await _productRepository.updateProduct(
        productId,
        name,
        description,
        price,
        stock,
        size,
        color,
        brand,
        imgProduct,
        categoryId,
        discount,
        isAvailable);
  }

  @override
  Future<void> deleteProduct(String productId) async {
    return _productRepository.deleteProduct(productId);
  }
}
