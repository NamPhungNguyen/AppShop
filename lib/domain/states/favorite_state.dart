import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/product.dart';

class FavoriteState extends StateNotifier<AsyncValue<List<Product>>> {
  final StateNotifierProviderRef _ref;

  FavoriteState(this._ref) : super(const AsyncValue.loading()) {
    fetchFavoriteProducts();
  }

  Future<void> fetchFavoriteProducts() async {
    state = const AsyncValue.loading();
    try {
      final favoriteUsecase = _ref.read(favoriteUsecaseProvider);
      final favoriteProducts =
          await favoriteUsecase.fetchAllProductToFavorites();
      state = AsyncValue.data(favoriteProducts);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> addProductToFavorites(Product product) async {
    try {
      final favoriteUsecase = _ref.read(favoriteUsecaseProvider);
      await favoriteUsecase.addProductToFavorites(product.productId.toString());

      final currentFavorites = state.value ?? [];
      state = AsyncValue.data([...currentFavorites, product]);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> removeProductFromFavorites(String productId) async {
    try {
      final favoriteUsecase = _ref.read(favoriteUsecaseProvider);
      await favoriteUsecase.removeProductToFavorites(productId);

      final currentFavorites = state.value ?? [];
      final updatedFavorites = currentFavorites
          .where((product) => product.productId != productId)
          .toList();

      state = AsyncValue.data(updatedFavorites);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
