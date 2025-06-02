// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_page_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPageEntityImpl _$$ProductPageEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPageEntityImpl(
      content: (json['content'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable:
          PageableEntity.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool,
      totalElements: (json['totalElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      sort: SortEntity.fromJson(json['sort'] as Map<String, dynamic>),
      first: json['first'] as bool,
      numberOfElements: (json['numberOfElements'] as num).toInt(),
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$$ProductPageEntityImplToJson(
        _$ProductPageEntityImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

_$PageableEntityImpl _$$PageableEntityImplFromJson(Map<String, dynamic> json) =>
    _$PageableEntityImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      sort: SortEntity.fromJson(json['sort'] as Map<String, dynamic>),
      offset: (json['offset'] as num).toInt(),
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );

Map<String, dynamic> _$$PageableEntityImplToJson(
        _$PageableEntityImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

_$SortEntityImpl _$$SortEntityImplFromJson(Map<String, dynamic> json) =>
    _$SortEntityImpl(
      empty: json['empty'] as bool,
      sorted: json['sorted'] as bool,
      unsorted: json['unsorted'] as bool,
    );

Map<String, dynamic> _$$SortEntityImplToJson(_$SortEntityImpl instance) =>
    <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };
