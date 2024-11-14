import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';

class ProductTranslator {
  static Product translate(final ProductEntity entity) {
    return Product(
      productId: entity.productId,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      stock: entity.stock,
      size: entity.size,
      color: entity.color,
      rating: entity.rating,
      ratingCount: entity.ratingCount,
      commentCount: entity.commentCount,
      brand: entity.brand,
      imgProduct: entity.imgProduct,
      categoryId: entity.categoryId,
      categoryName: entity.categoryName,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      available: entity.available,
    );
  }

  static Products translateAll(final ProductsEntity entity) {
    return Products(result: entity.result.map((e) => translate(e)).toList());
  }
  // New method to translate a list of ProductEntity
  static List<Product> translateListAll(List<ProductEntity> entities) {
    return entities.map((entity) => translate(entity)).toList();
  }
}
