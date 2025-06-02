import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/domain/models/product_page.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';

import '../../server/data/entities/product_page_entity.dart';

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

  static Pageable translatePageable(PageableEntity entityPageable) {
    return Pageable(
      pageNumber: entityPageable.pageNumber,
      pageSize: entityPageable.pageSize,
      sort: Sort(
        empty: entityPageable.sort.empty,
        sorted: entityPageable.sort.sorted,
        unsorted: entityPageable.sort.unsorted,
      ),
      offset: entityPageable.offset,
      paged: entityPageable.paged,
      unpaged: entityPageable.unpaged,
    );
  }

  static Sort translateSort(SortEntity entity) {
    return Sort(
      empty: entity.empty,
      sorted: entity.sorted,
      unsorted: entity.unsorted,
    );
  }

  static ProductPage translateProductPage(final ProductPageEntity entity) {
    return ProductPage(
      content: entity.content.map((e) => translate(e)).toList(),
      pageable: translatePageable(entity.pageable),
      last: entity.last,
      totalElements: entity.totalElements,
      totalPages: entity.totalPages,
      size: entity.size,
      number: entity.number,
      sort: translateSort(entity.sort),
      first: entity.first,
      numberOfElements: entity.numberOfElements,
      empty: entity.empty,
    );
  }
}
