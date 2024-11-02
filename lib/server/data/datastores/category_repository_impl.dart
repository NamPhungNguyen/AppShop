import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/categories_entity.dart';
import 'package:front_shop/server/data/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ClientService _clientService;

  CategoryRepositoryImpl(this._clientService);

  @override
  Future<CategoriesResponse> fetchALlCategories() async {
    return await _clientService.fetchAllCategories();
  }
}
