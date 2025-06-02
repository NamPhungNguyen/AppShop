// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_pages_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderPagesEntity _$OrderPagesEntityFromJson(Map<String, dynamic> json) {
  return _OrderPagesEntity.fromJson(json);
}

/// @nodoc
mixin _$OrderPagesEntity {
  List<OrderContentEntity> get content => throw _privateConstructorUsedError;
  PageableEntity get pageable => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  SortEntity get sort => throw _privateConstructorUsedError;

  /// Serializes this OrderPagesEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderPagesEntityCopyWith<OrderPagesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPagesEntityCopyWith<$Res> {
  factory $OrderPagesEntityCopyWith(
          OrderPagesEntity value, $Res Function(OrderPagesEntity) then) =
      _$OrderPagesEntityCopyWithImpl<$Res, OrderPagesEntity>;
  @useResult
  $Res call(
      {List<OrderContentEntity> content,
      PageableEntity pageable,
      bool last,
      int totalElements,
      int totalPages,
      int size,
      int number,
      SortEntity sort});

  $PageableEntityCopyWith<$Res> get pageable;
  $SortEntityCopyWith<$Res> get sort;
}

/// @nodoc
class _$OrderPagesEntityCopyWithImpl<$Res, $Val extends OrderPagesEntity>
    implements $OrderPagesEntityCopyWith<$Res> {
  _$OrderPagesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? pageable = null,
    Object? last = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? size = null,
    Object? number = null,
    Object? sort = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<OrderContentEntity>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as PageableEntity,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortEntity,
    ) as $Val);
  }

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageableEntityCopyWith<$Res> get pageable {
    return $PageableEntityCopyWith<$Res>(_value.pageable, (value) {
      return _then(_value.copyWith(pageable: value) as $Val);
    });
  }

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SortEntityCopyWith<$Res> get sort {
    return $SortEntityCopyWith<$Res>(_value.sort, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderPagesEntityImplCopyWith<$Res>
    implements $OrderPagesEntityCopyWith<$Res> {
  factory _$$OrderPagesEntityImplCopyWith(_$OrderPagesEntityImpl value,
          $Res Function(_$OrderPagesEntityImpl) then) =
      __$$OrderPagesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderContentEntity> content,
      PageableEntity pageable,
      bool last,
      int totalElements,
      int totalPages,
      int size,
      int number,
      SortEntity sort});

  @override
  $PageableEntityCopyWith<$Res> get pageable;
  @override
  $SortEntityCopyWith<$Res> get sort;
}

/// @nodoc
class __$$OrderPagesEntityImplCopyWithImpl<$Res>
    extends _$OrderPagesEntityCopyWithImpl<$Res, _$OrderPagesEntityImpl>
    implements _$$OrderPagesEntityImplCopyWith<$Res> {
  __$$OrderPagesEntityImplCopyWithImpl(_$OrderPagesEntityImpl _value,
      $Res Function(_$OrderPagesEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? pageable = null,
    Object? last = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? size = null,
    Object? number = null,
    Object? sort = null,
  }) {
    return _then(_$OrderPagesEntityImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<OrderContentEntity>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as PageableEntity,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPagesEntityImpl implements _OrderPagesEntity {
  _$OrderPagesEntityImpl(
      {required final List<OrderContentEntity> content,
      required this.pageable,
      required this.last,
      required this.totalElements,
      required this.totalPages,
      required this.size,
      required this.number,
      required this.sort})
      : _content = content;

  factory _$OrderPagesEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPagesEntityImplFromJson(json);

  final List<OrderContentEntity> _content;
  @override
  List<OrderContentEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final PageableEntity pageable;
  @override
  final bool last;
  @override
  final int totalElements;
  @override
  final int totalPages;
  @override
  final int size;
  @override
  final int number;
  @override
  final SortEntity sort;

  @override
  String toString() {
    return 'OrderPagesEntity(content: $content, pageable: $pageable, last: $last, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, sort: $sort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPagesEntityImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      pageable,
      last,
      totalElements,
      totalPages,
      size,
      number,
      sort);

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPagesEntityImplCopyWith<_$OrderPagesEntityImpl> get copyWith =>
      __$$OrderPagesEntityImplCopyWithImpl<_$OrderPagesEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPagesEntityImplToJson(
      this,
    );
  }
}

abstract class _OrderPagesEntity implements OrderPagesEntity {
  factory _OrderPagesEntity(
      {required final List<OrderContentEntity> content,
      required final PageableEntity pageable,
      required final bool last,
      required final int totalElements,
      required final int totalPages,
      required final int size,
      required final int number,
      required final SortEntity sort}) = _$OrderPagesEntityImpl;

  factory _OrderPagesEntity.fromJson(Map<String, dynamic> json) =
      _$OrderPagesEntityImpl.fromJson;

  @override
  List<OrderContentEntity> get content;
  @override
  PageableEntity get pageable;
  @override
  bool get last;
  @override
  int get totalElements;
  @override
  int get totalPages;
  @override
  int get size;
  @override
  int get number;
  @override
  SortEntity get sort;

  /// Create a copy of OrderPagesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPagesEntityImplCopyWith<_$OrderPagesEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderContentEntity _$OrderContentEntityFromJson(Map<String, dynamic> json) {
  return _OrderContentEntity.fromJson(json);
}

/// @nodoc
mixin _$OrderContentEntity {
  int get orderId => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<ProductPageOrderEntity> get products =>
      throw _privateConstructorUsedError;
  int get addressId => throw _privateConstructorUsedError;
  ShippingPageAddressEntity get shippingAddress =>
      throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderContentEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderContentEntityCopyWith<OrderContentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderContentEntityCopyWith<$Res> {
  factory $OrderContentEntityCopyWith(
          OrderContentEntity value, $Res Function(OrderContentEntity) then) =
      _$OrderContentEntityCopyWithImpl<$Res, OrderContentEntity>;
  @useResult
  $Res call(
      {int orderId,
      int totalAmount,
      String status,
      List<ProductPageOrderEntity> products,
      int addressId,
      ShippingPageAddressEntity shippingAddress,
      String createdAt,
      String updatedAt});

  $ShippingPageAddressEntityCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class _$OrderContentEntityCopyWithImpl<$Res, $Val extends OrderContentEntity>
    implements $OrderContentEntityCopyWith<$Res> {
  _$OrderContentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? products = null,
    Object? addressId = null,
    Object? shippingAddress = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductPageOrderEntity>,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as ShippingPageAddressEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of OrderContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShippingPageAddressEntityCopyWith<$Res> get shippingAddress {
    return $ShippingPageAddressEntityCopyWith<$Res>(_value.shippingAddress,
        (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderContentEntityImplCopyWith<$Res>
    implements $OrderContentEntityCopyWith<$Res> {
  factory _$$OrderContentEntityImplCopyWith(_$OrderContentEntityImpl value,
          $Res Function(_$OrderContentEntityImpl) then) =
      __$$OrderContentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderId,
      int totalAmount,
      String status,
      List<ProductPageOrderEntity> products,
      int addressId,
      ShippingPageAddressEntity shippingAddress,
      String createdAt,
      String updatedAt});

  @override
  $ShippingPageAddressEntityCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class __$$OrderContentEntityImplCopyWithImpl<$Res>
    extends _$OrderContentEntityCopyWithImpl<$Res, _$OrderContentEntityImpl>
    implements _$$OrderContentEntityImplCopyWith<$Res> {
  __$$OrderContentEntityImplCopyWithImpl(_$OrderContentEntityImpl _value,
      $Res Function(_$OrderContentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? products = null,
    Object? addressId = null,
    Object? shippingAddress = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderContentEntityImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductPageOrderEntity>,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as ShippingPageAddressEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderContentEntityImpl implements _OrderContentEntity {
  _$OrderContentEntityImpl(
      {required this.orderId,
      required this.totalAmount,
      required this.status,
      required final List<ProductPageOrderEntity> products,
      required this.addressId,
      required this.shippingAddress,
      required this.createdAt,
      required this.updatedAt})
      : _products = products;

  factory _$OrderContentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderContentEntityImplFromJson(json);

  @override
  final int orderId;
  @override
  final int totalAmount;
  @override
  final String status;
  final List<ProductPageOrderEntity> _products;
  @override
  List<ProductPageOrderEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int addressId;
  @override
  final ShippingPageAddressEntity shippingAddress;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OrderContentEntity(orderId: $orderId, totalAmount: $totalAmount, status: $status, products: $products, addressId: $addressId, shippingAddress: $shippingAddress, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderContentEntityImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      totalAmount,
      status,
      const DeepCollectionEquality().hash(_products),
      addressId,
      shippingAddress,
      createdAt,
      updatedAt);

  /// Create a copy of OrderContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderContentEntityImplCopyWith<_$OrderContentEntityImpl> get copyWith =>
      __$$OrderContentEntityImplCopyWithImpl<_$OrderContentEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderContentEntityImplToJson(
      this,
    );
  }
}

abstract class _OrderContentEntity implements OrderContentEntity {
  factory _OrderContentEntity(
      {required final int orderId,
      required final int totalAmount,
      required final String status,
      required final List<ProductPageOrderEntity> products,
      required final int addressId,
      required final ShippingPageAddressEntity shippingAddress,
      required final String createdAt,
      required final String updatedAt}) = _$OrderContentEntityImpl;

  factory _OrderContentEntity.fromJson(Map<String, dynamic> json) =
      _$OrderContentEntityImpl.fromJson;

  @override
  int get orderId;
  @override
  int get totalAmount;
  @override
  String get status;
  @override
  List<ProductPageOrderEntity> get products;
  @override
  int get addressId;
  @override
  ShippingPageAddressEntity get shippingAddress;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of OrderContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderContentEntityImplCopyWith<_$OrderContentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductPageOrderEntity _$ProductPageOrderEntityFromJson(
    Map<String, dynamic> json) {
  return _ProductPageOrderEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductPageOrderEntity {
  String? get cartItemId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  int get discountPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductPageOrderEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPageOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPageOrderEntityCopyWith<ProductPageOrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPageOrderEntityCopyWith<$Res> {
  factory $ProductPageOrderEntityCopyWith(ProductPageOrderEntity value,
          $Res Function(ProductPageOrderEntity) then) =
      _$ProductPageOrderEntityCopyWithImpl<$Res, ProductPageOrderEntity>;
  @useResult
  $Res call(
      {String? cartItemId,
      int productId,
      String productName,
      String imageUrl,
      int price,
      String size,
      String color,
      int quantity,
      int discount,
      int totalPrice,
      int discountPrice});
}

/// @nodoc
class _$ProductPageOrderEntityCopyWithImpl<$Res,
        $Val extends ProductPageOrderEntity>
    implements $ProductPageOrderEntityCopyWith<$Res> {
  _$ProductPageOrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPageOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = freezed,
    Object? productId = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? size = null,
    Object? color = null,
    Object? quantity = null,
    Object? discount = null,
    Object? totalPrice = null,
    Object? discountPrice = null,
  }) {
    return _then(_value.copyWith(
      cartItemId: freezed == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int,
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
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPageOrderEntityImplCopyWith<$Res>
    implements $ProductPageOrderEntityCopyWith<$Res> {
  factory _$$ProductPageOrderEntityImplCopyWith(
          _$ProductPageOrderEntityImpl value,
          $Res Function(_$ProductPageOrderEntityImpl) then) =
      __$$ProductPageOrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cartItemId,
      int productId,
      String productName,
      String imageUrl,
      int price,
      String size,
      String color,
      int quantity,
      int discount,
      int totalPrice,
      int discountPrice});
}

/// @nodoc
class __$$ProductPageOrderEntityImplCopyWithImpl<$Res>
    extends _$ProductPageOrderEntityCopyWithImpl<$Res,
        _$ProductPageOrderEntityImpl>
    implements _$$ProductPageOrderEntityImplCopyWith<$Res> {
  __$$ProductPageOrderEntityImplCopyWithImpl(
      _$ProductPageOrderEntityImpl _value,
      $Res Function(_$ProductPageOrderEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPageOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = freezed,
    Object? productId = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? size = null,
    Object? color = null,
    Object? quantity = null,
    Object? discount = null,
    Object? totalPrice = null,
    Object? discountPrice = null,
  }) {
    return _then(_$ProductPageOrderEntityImpl(
      cartItemId: freezed == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int,
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
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductPageOrderEntityImpl implements _ProductPageOrderEntity {
  _$ProductPageOrderEntityImpl(
      {this.cartItemId,
      required this.productId,
      required this.productName,
      required this.imageUrl,
      required this.price,
      required this.size,
      required this.color,
      required this.quantity,
      required this.discount,
      required this.totalPrice,
      required this.discountPrice});

  factory _$ProductPageOrderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPageOrderEntityImplFromJson(json);

  @override
  final String? cartItemId;
  @override
  final int productId;
  @override
  final String productName;
  @override
  final String imageUrl;
  @override
  final int price;
  @override
  final String size;
  @override
  final String color;
  @override
  final int quantity;
  @override
  final int discount;
  @override
  final int totalPrice;
  @override
  final int discountPrice;

  @override
  String toString() {
    return 'ProductPageOrderEntity(cartItemId: $cartItemId, productId: $productId, productName: $productName, imageUrl: $imageUrl, price: $price, size: $size, color: $color, quantity: $quantity, discount: $discount, totalPrice: $totalPrice, discountPrice: $discountPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPageOrderEntityImpl &&
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
                other.quantity == quantity) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartItemId,
      productId,
      productName,
      imageUrl,
      price,
      size,
      color,
      quantity,
      discount,
      totalPrice,
      discountPrice);

  /// Create a copy of ProductPageOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPageOrderEntityImplCopyWith<_$ProductPageOrderEntityImpl>
      get copyWith => __$$ProductPageOrderEntityImplCopyWithImpl<
          _$ProductPageOrderEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPageOrderEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductPageOrderEntity implements ProductPageOrderEntity {
  factory _ProductPageOrderEntity(
      {final String? cartItemId,
      required final int productId,
      required final String productName,
      required final String imageUrl,
      required final int price,
      required final String size,
      required final String color,
      required final int quantity,
      required final int discount,
      required final int totalPrice,
      required final int discountPrice}) = _$ProductPageOrderEntityImpl;

  factory _ProductPageOrderEntity.fromJson(Map<String, dynamic> json) =
      _$ProductPageOrderEntityImpl.fromJson;

  @override
  String? get cartItemId;
  @override
  int get productId;
  @override
  String get productName;
  @override
  String get imageUrl;
  @override
  int get price;
  @override
  String get size;
  @override
  String get color;
  @override
  int get quantity;
  @override
  int get discount;
  @override
  int get totalPrice;
  @override
  int get discountPrice;

  /// Create a copy of ProductPageOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPageOrderEntityImplCopyWith<_$ProductPageOrderEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ShippingPageAddressEntity _$ShippingPageAddressEntityFromJson(
    Map<String, dynamic> json) {
  return _ShippingPageAddressEntity.fromJson(json);
}

/// @nodoc
mixin _$ShippingPageAddressEntity {
  int get addressId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get addressDetail => throw _privateConstructorUsedError;
  String? get additionalAddress => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this ShippingPageAddressEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShippingPageAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShippingPageAddressEntityCopyWith<ShippingPageAddressEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingPageAddressEntityCopyWith<$Res> {
  factory $ShippingPageAddressEntityCopyWith(ShippingPageAddressEntity value,
          $Res Function(ShippingPageAddressEntity) then) =
      _$ShippingPageAddressEntityCopyWithImpl<$Res, ShippingPageAddressEntity>;
  @useResult
  $Res call(
      {int addressId,
      String fullName,
      String phoneNumber,
      String addressDetail,
      String? additionalAddress,
      String province,
      String city,
      String country,
      bool isDefault});
}

/// @nodoc
class _$ShippingPageAddressEntityCopyWithImpl<$Res,
        $Val extends ShippingPageAddressEntity>
    implements $ShippingPageAddressEntityCopyWith<$Res> {
  _$ShippingPageAddressEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShippingPageAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? addressDetail = null,
    Object? additionalAddress = freezed,
    Object? province = null,
    Object? city = null,
    Object? country = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      addressDetail: null == addressDetail
          ? _value.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as String,
      additionalAddress: freezed == additionalAddress
          ? _value.additionalAddress
          : additionalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShippingPageAddressEntityImplCopyWith<$Res>
    implements $ShippingPageAddressEntityCopyWith<$Res> {
  factory _$$ShippingPageAddressEntityImplCopyWith(
          _$ShippingPageAddressEntityImpl value,
          $Res Function(_$ShippingPageAddressEntityImpl) then) =
      __$$ShippingPageAddressEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int addressId,
      String fullName,
      String phoneNumber,
      String addressDetail,
      String? additionalAddress,
      String province,
      String city,
      String country,
      bool isDefault});
}

/// @nodoc
class __$$ShippingPageAddressEntityImplCopyWithImpl<$Res>
    extends _$ShippingPageAddressEntityCopyWithImpl<$Res,
        _$ShippingPageAddressEntityImpl>
    implements _$$ShippingPageAddressEntityImplCopyWith<$Res> {
  __$$ShippingPageAddressEntityImplCopyWithImpl(
      _$ShippingPageAddressEntityImpl _value,
      $Res Function(_$ShippingPageAddressEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShippingPageAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? addressDetail = null,
    Object? additionalAddress = freezed,
    Object? province = null,
    Object? city = null,
    Object? country = null,
    Object? isDefault = null,
  }) {
    return _then(_$ShippingPageAddressEntityImpl(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      addressDetail: null == addressDetail
          ? _value.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as String,
      additionalAddress: freezed == additionalAddress
          ? _value.additionalAddress
          : additionalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingPageAddressEntityImpl implements _ShippingPageAddressEntity {
  _$ShippingPageAddressEntityImpl(
      {required this.addressId,
      required this.fullName,
      required this.phoneNumber,
      required this.addressDetail,
      this.additionalAddress,
      required this.province,
      required this.city,
      required this.country,
      required this.isDefault});

  factory _$ShippingPageAddressEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingPageAddressEntityImplFromJson(json);

  @override
  final int addressId;
  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String addressDetail;
  @override
  final String? additionalAddress;
  @override
  final String province;
  @override
  final String city;
  @override
  final String country;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'ShippingPageAddressEntity(addressId: $addressId, fullName: $fullName, phoneNumber: $phoneNumber, addressDetail: $addressDetail, additionalAddress: $additionalAddress, province: $province, city: $city, country: $country, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingPageAddressEntityImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.addressDetail, addressDetail) ||
                other.addressDetail == addressDetail) &&
            (identical(other.additionalAddress, additionalAddress) ||
                other.additionalAddress == additionalAddress) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addressId, fullName, phoneNumber,
      addressDetail, additionalAddress, province, city, country, isDefault);

  /// Create a copy of ShippingPageAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingPageAddressEntityImplCopyWith<_$ShippingPageAddressEntityImpl>
      get copyWith => __$$ShippingPageAddressEntityImplCopyWithImpl<
          _$ShippingPageAddressEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingPageAddressEntityImplToJson(
      this,
    );
  }
}

abstract class _ShippingPageAddressEntity implements ShippingPageAddressEntity {
  factory _ShippingPageAddressEntity(
      {required final int addressId,
      required final String fullName,
      required final String phoneNumber,
      required final String addressDetail,
      final String? additionalAddress,
      required final String province,
      required final String city,
      required final String country,
      required final bool isDefault}) = _$ShippingPageAddressEntityImpl;

  factory _ShippingPageAddressEntity.fromJson(Map<String, dynamic> json) =
      _$ShippingPageAddressEntityImpl.fromJson;

  @override
  int get addressId;
  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String get addressDetail;
  @override
  String? get additionalAddress;
  @override
  String get province;
  @override
  String get city;
  @override
  String get country;
  @override
  bool get isDefault;

  /// Create a copy of ShippingPageAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingPageAddressEntityImplCopyWith<_$ShippingPageAddressEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
