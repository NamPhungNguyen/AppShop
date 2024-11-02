import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/domain/translator/category_translator.dart';
import 'package:front_shop/domain/usecases/category_usecase.dart';
import 'package:front_shop/server/data/repository/category_repository.dart';

class CategoryUsecaseImpl implements CategoryUsecase {
  final CategoryRepository _categoryRepository;

  CategoryUsecaseImpl(this._categoryRepository);

  @override
  Future<Categories> fetchAllCategories() async {
    final entity = await _categoryRepository.fetchALlCategories();
    return CategoryTranslator.translateAll(entity);
  }
}
