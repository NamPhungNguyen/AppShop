import 'package:front_shop/server/data/entities/product_entity.dart';

abstract class ProductRepository {
  Future<ProductsEntity> fetchAllProduct();
}