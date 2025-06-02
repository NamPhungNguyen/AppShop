import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_shop/server/data/entities/product_entity.dart';

part 'product_page_entity.freezed.dart';
part 'product_page_entity.g.dart';

@freezed
class ProductPageEntity with _$ProductPageEntity {
  const factory ProductPageEntity({
    required List<ProductEntity> content,
    required PageableEntity pageable,
    required bool last,
    required int totalElements,
    required int totalPages,
    required int size,
    required int number,
    required SortEntity sort,
    required bool first,
    required int numberOfElements,
    required bool empty,
  }) = _ProductPageEntity;

  factory ProductPageEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductPageEntityFromJson(json);
}

@freezed
class PageableEntity with _$PageableEntity {
  const factory PageableEntity({
    required int pageNumber,
    required int pageSize,
    required SortEntity sort,
    required int offset,
    required bool paged,
    required bool unpaged,
  }) = _PageableEntity;

  factory PageableEntity.fromJson(Map<String, dynamic> json) =>
      _$PageableEntityFromJson(json);
}

@freezed
class SortEntity with _$SortEntity {
  const factory SortEntity({
    required bool empty,
    required bool sorted,
    required bool unsorted,
  }) = _SortEntity;

  factory SortEntity.fromJson(Map<String, dynamic> json) => _$SortEntityFromJson(json);
}
