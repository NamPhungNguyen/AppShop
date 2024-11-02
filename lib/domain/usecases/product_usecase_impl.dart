import 'package:front_shop/domain/models/product.dart';
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
}
