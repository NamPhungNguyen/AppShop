import '../models/product.dart';

abstract class ProductUsecase {
  Future<Products> fetchAllProduct();
}
