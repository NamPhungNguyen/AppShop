import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/product.dart';

class ProductState extends StateNotifier<AsyncValue<Products>> {
  final StateNotifierProviderRef _ref;

  ProductState(this._ref) : super(const AsyncValue.loading()) {
    fetchAllProduct();
  }

  /// Fetch all products
  Future<void> fetchAllProduct() async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final products = await productUsecase.fetchAllProduct();
      state = AsyncValue.data(products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Fetch products by category
  Future<void> fetchAllProductByCategory(String categoryId) async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      final products =
          await productUsecase.fetchAllProductByCategory(categoryId);
      state = AsyncValue.data(products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Create a product
  Future<void> createProduct({
    required String name,
    required String description,
    required double price,
    required int stock,
    required List<String> size,
    required List<String> color,
    required String brand,
    required List<String> imgProduct,
    required int categoryId,
    required int discount,
  }) async {
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      await productUsecase.createProduct(
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
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

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
    state = const AsyncValue.loading();
    try {
      final productUsecase = _ref.read(productUsecaseProvider);
      await productUsecase.updateProduct(
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
      await fetchAllProduct();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
