import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_shop/domain/models/product.dart';


part 'product_page.freezed.dart';

@freezed
class ProductPage with _$ProductPage {
  const factory ProductPage({
    required List<Product> content,
    required Pageable pageable,
    required bool last,
    required int totalElements,
    required int totalPages,
    required int size,
    required int number,
    required Sort sort,
    required bool first,
    required int numberOfElements,
    required bool empty,
  }) = _ProductPage;
}

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    required int pageNumber,
    required int pageSize,
    required Sort sort,
    required int offset,
    required bool paged,
    required bool unpaged,
  }) = _Pageable;
}

@freezed
class Sort with _$Sort {
  const factory Sort({
    required bool empty,
    required bool sorted,
    required bool unsorted,
  }) = _Sort;
}