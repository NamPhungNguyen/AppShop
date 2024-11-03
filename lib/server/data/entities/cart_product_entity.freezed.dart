// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartProductEntity _$CartProductEntityFromJson(Map<String, dynamic> json) {
  return _CartProductEntity.fromJson(json);
}

/// @nodoc
mixin _$CartProductEntity {
  int get cartItemId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartProductEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartProductEntityCopyWith<CartProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductEntityCopyWith<$Res> {
  factory $CartProductEntityCopyWith(
          CartProductEntity value, $Res Function(CartProductEntity) then) =
      _$CartProductEntityCopyWithImpl<$Res, CartProductEntity>;
  @useResult
  $Res call(
      {int cartItemId,
      int productId,
      String productName,
      String imageUrl,
      double price,
      String size,
      String color,
      int quantity});
}

/// @nodoc
class _$CartProductEntityCopyWithImpl<$Res, $Val extends CartProductEntity>
    implements $CartProductEntityCopyWith<$Res> {
  _$CartProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? productId = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? size = null,
    Object? color = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      cartItemId: null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartProductEntityImplCopyWith<$Res>
    implements $CartProductEntityCopyWith<$Res> {
  factory _$$CartProductEntityImplCopyWith(_$CartProductEntityImpl value,
          $Res Function(_$CartProductEntityImpl) then) =
      __$$CartProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cartItemId,
      int productId,
      String productName,
      String imageUrl,
      double price,
      String size,
      String color,
      int quantity});
}

/// @nodoc
class __$$CartProductEntityImplCopyWithImpl<$Res>
    extends _$CartProductEntityCopyWithImpl<$Res, _$CartProductEntityImpl>
    implements _$$CartProductEntityImplCopyWith<$Res> {
  __$$CartProductEntityImplCopyWithImpl(_$CartProductEntityImpl _value,
      $Res Function(_$CartProductEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? productId = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? size = null,
    Object? color = null,
    Object? quantity = null,
  }) {
    return _then(_$CartProductEntityImpl(
      cartItemId: null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartProductEntityImpl implements _CartProductEntity {
  const _$CartProductEntityImpl(
      {required this.cartItemId,
      required this.productId,
      required this.productName,
      required this.imageUrl,
      required this.price,
      required this.size,
      required this.color,
      required this.quantity});

  factory _$CartProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartProductEntityImplFromJson(json);

  @override
  final int cartItemId;
  @override
  final int productId;
  @override
  final String productName;
  @override
  final String imageUrl;
  @override
  final double price;
  @override
  final String size;
  @override
  final String color;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartProductEntity(cartItemId: $cartItemId, productId: $productId, productName: $productName, imageUrl: $imageUrl, price: $price, size: $size, color: $color, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductEntityImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartItemId, productId,
      productName, imageUrl, price, size, color, quantity);

  /// Create a copy of CartProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductEntityImplCopyWith<_$CartProductEntityImpl> get copyWith =>
      __$$CartProductEntityImplCopyWithImpl<_$CartProductEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartProductEntityImplToJson(
      this,
    );
  }
}

abstract class _CartProductEntity implements CartProductEntity {
  const factory _CartProductEntity(
      {required final int cartItemId,
      required final int productId,
      required final String productName,
      required final String imageUrl,
      required final double price,
      required final String size,
      required final String color,
      required final int quantity}) = _$CartProductEntityImpl;

  factory _CartProductEntity.fromJson(Map<String, dynamic> json) =
      _$CartProductEntityImpl.fromJson;

  @override
  int get cartItemId;
  @override
  int get productId;
  @override
  String get productName;
  @override
  String get imageUrl;
  @override
  double get price;
  @override
  String get size;
  @override
  String get color;
  @override
  int get quantity;

  /// Create a copy of CartProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartProductEntityImplCopyWith<_$CartProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartProductsEntity _$CartProductsEntityFromJson(Map<String, dynamic> json) {
  return _CartProductsEntity.fromJson(json);
}

/// @nodoc
mixin _$CartProductsEntity {
  List<CartProductEntity> get result => throw _privateConstructorUsedError;

  /// Serializes this CartProductsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartProductsEntityCopyWith<CartProductsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductsEntityCopyWith<$Res> {
  factory $CartProductsEntityCopyWith(
          CartProductsEntity value, $Res Function(CartProductsEntity) then) =
      _$CartProductsEntityCopyWithImpl<$Res, CartProductsEntity>;
  @useResult
  $Res call({List<CartProductEntity> result});
}

/// @nodoc
class _$CartProductsEntityCopyWithImpl<$Res, $Val extends CartProductsEntity>
    implements $CartProductsEntityCopyWith<$Res> {
  _$CartProductsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartProductsEntity
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
              as List<CartProductEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartProductsEntityImplCopyWith<$Res>
    implements $CartProductsEntityCopyWith<$Res> {
  factory _$$CartProductsEntityImplCopyWith(_$CartProductsEntityImpl value,
          $Res Function(_$CartProductsEntityImpl) then) =
      __$$CartProductsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartProductEntity> result});
}

/// @nodoc
class __$$CartProductsEntityImplCopyWithImpl<$Res>
    extends _$CartProductsEntityCopyWithImpl<$Res, _$CartProductsEntityImpl>
    implements _$$CartProductsEntityImplCopyWith<$Res> {
  __$$CartProductsEntityImplCopyWithImpl(_$CartProductsEntityImpl _value,
      $Res Function(_$CartProductsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CartProductsEntityImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CartProductEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartProductsEntityImpl implements _CartProductsEntity {
  const _$CartProductsEntityImpl(
      {required final List<CartProductEntity> result})
      : _result = result;

  factory _$CartProductsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartProductsEntityImplFromJson(json);

  final List<CartProductEntity> _result;
  @override
  List<CartProductEntity> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'CartProductsEntity(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductsEntityImpl &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  /// Create a copy of CartProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductsEntityImplCopyWith<_$CartProductsEntityImpl> get copyWith =>
      __$$CartProductsEntityImplCopyWithImpl<_$CartProductsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartProductsEntityImplToJson(
      this,
    );
  }
}

abstract class _CartProductsEntity implements CartProductsEntity {
  const factory _CartProductsEntity(
          {required final List<CartProductEntity> result}) =
      _$CartProductsEntityImpl;

  factory _CartProductsEntity.fromJson(Map<String, dynamic> json) =
      _$CartProductsEntityImpl.fromJson;

  @override
  List<CartProductEntity> get result;

  /// Create a copy of CartProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartProductsEntityImplCopyWith<_$CartProductsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
