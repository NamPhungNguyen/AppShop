// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductsEntity _$ProductsEntityFromJson(Map<String, dynamic> json) {
  return _ProductsEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductsEntity {
  List<ProductEntity> get result => throw _privateConstructorUsedError;

  /// Serializes this ProductsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsEntityCopyWith<ProductsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEntityCopyWith<$Res> {
  factory $ProductsEntityCopyWith(
          ProductsEntity value, $Res Function(ProductsEntity) then) =
      _$ProductsEntityCopyWithImpl<$Res, ProductsEntity>;
  @useResult
  $Res call({List<ProductEntity> result});
}

/// @nodoc
class _$ProductsEntityCopyWithImpl<$Res, $Val extends ProductsEntity>
    implements $ProductsEntityCopyWith<$Res> {
  _$ProductsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsEntityImplCopyWith<$Res>
    implements $ProductsEntityCopyWith<$Res> {
  factory _$$ProductsEntityImplCopyWith(_$ProductsEntityImpl value,
          $Res Function(_$ProductsEntityImpl) then) =
      __$$ProductsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductEntity> result});
}

/// @nodoc
class __$$ProductsEntityImplCopyWithImpl<$Res>
    extends _$ProductsEntityCopyWithImpl<$Res, _$ProductsEntityImpl>
    implements _$$ProductsEntityImplCopyWith<$Res> {
  __$$ProductsEntityImplCopyWithImpl(
      _$ProductsEntityImpl _value, $Res Function(_$ProductsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ProductsEntityImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsEntityImpl implements _ProductsEntity {
  const _$ProductsEntityImpl({required final List<ProductEntity> result})
      : _result = result;

  factory _$ProductsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsEntityImplFromJson(json);

  final List<ProductEntity> _result;
  @override
  List<ProductEntity> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'ProductsEntity(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsEntityImpl &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  /// Create a copy of ProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsEntityImplCopyWith<_$ProductsEntityImpl> get copyWith =>
      __$$ProductsEntityImplCopyWithImpl<_$ProductsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductsEntity implements ProductsEntity {
  const factory _ProductsEntity({required final List<ProductEntity> result}) =
      _$ProductsEntityImpl;

  factory _ProductsEntity.fromJson(Map<String, dynamic> json) =
      _$ProductsEntityImpl.fromJson;

  @override
  List<ProductEntity> get result;

  /// Create a copy of ProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsEntityImplCopyWith<_$ProductsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) {
  return _ProductEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductEntity {
  int get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  List<String> get size => throw _privateConstructorUsedError;
  List<String> get color => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get ratingCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String? get productCode => throw _privateConstructorUsedError;
  List<String> get imgProduct => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;

  /// Serializes this ProductEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
          ProductEntity value, $Res Function(ProductEntity) then) =
      _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call(
      {int productId,
      String name,
      String description,
      double price,
      double? discount,
      int stock,
      List<String> size,
      List<String> color,
      double rating,
      int ratingCount,
      int commentCount,
      String brand,
      String? productCode,
      List<String> imgProduct,
      int categoryId,
      String categoryName,
      DateTime createdAt,
      DateTime updatedAt,
      bool available});
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discount = freezed,
    Object? stock = null,
    Object? size = null,
    Object? color = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? commentCount = null,
    Object? brand = null,
    Object? productCode = freezed,
    Object? imgProduct = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imgProduct: null == imgProduct
          ? _value.imgProduct
          : imgProduct // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductEntityImplCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$ProductEntityImplCopyWith(
          _$ProductEntityImpl value, $Res Function(_$ProductEntityImpl) then) =
      __$$ProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productId,
      String name,
      String description,
      double price,
      double? discount,
      int stock,
      List<String> size,
      List<String> color,
      double rating,
      int ratingCount,
      int commentCount,
      String brand,
      String? productCode,
      List<String> imgProduct,
      int categoryId,
      String categoryName,
      DateTime createdAt,
      DateTime updatedAt,
      bool available});
}

/// @nodoc
class __$$ProductEntityImplCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$ProductEntityImpl>
    implements _$$ProductEntityImplCopyWith<$Res> {
  __$$ProductEntityImplCopyWithImpl(
      _$ProductEntityImpl _value, $Res Function(_$ProductEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discount = freezed,
    Object? stock = null,
    Object? size = null,
    Object? color = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? commentCount = null,
    Object? brand = null,
    Object? productCode = freezed,
    Object? imgProduct = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? available = null,
  }) {
    return _then(_$ProductEntityImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value._size
          : size // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _value._color
          : color // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imgProduct: null == imgProduct
          ? _value._imgProduct
          : imgProduct // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductEntityImpl implements _ProductEntity {
  const _$ProductEntityImpl(
      {required this.productId,
      required this.name,
      required this.description,
      required this.price,
      this.discount,
      required this.stock,
      required final List<String> size,
      required final List<String> color,
      required this.rating,
      required this.ratingCount,
      required this.commentCount,
      required this.brand,
      this.productCode,
      required final List<String> imgProduct,
      required this.categoryId,
      required this.categoryName,
      required this.createdAt,
      required this.updatedAt,
      required this.available})
      : _size = size,
        _color = color,
        _imgProduct = imgProduct;

  factory _$ProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductEntityImplFromJson(json);

  @override
  final int productId;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final double? discount;
  @override
  final int stock;
  final List<String> _size;
  @override
  List<String> get size {
    if (_size is EqualUnmodifiableListView) return _size;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_size);
  }

  final List<String> _color;
  @override
  List<String> get color {
    if (_color is EqualUnmodifiableListView) return _color;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_color);
  }

  @override
  final double rating;
  @override
  final int ratingCount;
  @override
  final int commentCount;
  @override
  final String brand;
  @override
  final String? productCode;
  final List<String> _imgProduct;
  @override
  List<String> get imgProduct {
    if (_imgProduct is EqualUnmodifiableListView) return _imgProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgProduct);
  }

  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final bool available;

  @override
  String toString() {
    return 'ProductEntity(productId: $productId, name: $name, description: $description, price: $price, discount: $discount, stock: $stock, size: $size, color: $color, rating: $rating, ratingCount: $ratingCount, commentCount: $commentCount, brand: $brand, productCode: $productCode, imgProduct: $imgProduct, categoryId: $categoryId, categoryName: $categoryName, createdAt: $createdAt, updatedAt: $updatedAt, available: $available)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEntityImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            const DeepCollectionEquality().equals(other._size, _size) &&
            const DeepCollectionEquality().equals(other._color, _color) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            const DeepCollectionEquality()
                .equals(other._imgProduct, _imgProduct) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        name,
        description,
        price,
        discount,
        stock,
        const DeepCollectionEquality().hash(_size),
        const DeepCollectionEquality().hash(_color),
        rating,
        ratingCount,
        commentCount,
        brand,
        productCode,
        const DeepCollectionEquality().hash(_imgProduct),
        categoryId,
        categoryName,
        createdAt,
        updatedAt,
        available
      ]);

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      __$$ProductEntityImplCopyWithImpl<_$ProductEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductEntity implements ProductEntity {
  const factory _ProductEntity(
      {required final int productId,
      required final String name,
      required final String description,
      required final double price,
      final double? discount,
      required final int stock,
      required final List<String> size,
      required final List<String> color,
      required final double rating,
      required final int ratingCount,
      required final int commentCount,
      required final String brand,
      final String? productCode,
      required final List<String> imgProduct,
      required final int categoryId,
      required final String categoryName,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final bool available}) = _$ProductEntityImpl;

  factory _ProductEntity.fromJson(Map<String, dynamic> json) =
      _$ProductEntityImpl.fromJson;

  @override
  int get productId;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  double? get discount;
  @override
  int get stock;
  @override
  List<String> get size;
  @override
  List<String> get color;
  @override
  double get rating;
  @override
  int get ratingCount;
  @override
  int get commentCount;
  @override
  String get brand;
  @override
  String? get productCode;
  @override
  List<String> get imgProduct;
  @override
  int get categoryId;
  @override
  String get categoryName;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get available;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
