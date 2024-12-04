// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) {
  return _OrderEntity.fromJson(json);
}

/// @nodoc
mixin _$OrderEntity {
  int get orderId => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<ProductOrderEntity> get products => throw _privateConstructorUsedError;
  int get addressId => throw _privateConstructorUsedError;
  AddressEntity get shippingAddress => throw _privateConstructorUsedError;

  /// Serializes this OrderEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderEntityCopyWith<OrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntityCopyWith<$Res> {
  factory $OrderEntityCopyWith(
          OrderEntity value, $Res Function(OrderEntity) then) =
      _$OrderEntityCopyWithImpl<$Res, OrderEntity>;
  @useResult
  $Res call(
      {int orderId,
      double totalAmount,
      String status,
      List<ProductOrderEntity> products,
      int addressId,
      AddressEntity shippingAddress});

  $AddressEntityCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class _$OrderEntityCopyWithImpl<$Res, $Val extends OrderEntity>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEntity
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
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductOrderEntity>,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity,
    ) as $Val);
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res> get shippingAddress {
    return $AddressEntityCopyWith<$Res>(_value.shippingAddress, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderEntityImplCopyWith<$Res>
    implements $OrderEntityCopyWith<$Res> {
  factory _$$OrderEntityImplCopyWith(
          _$OrderEntityImpl value, $Res Function(_$OrderEntityImpl) then) =
      __$$OrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderId,
      double totalAmount,
      String status,
      List<ProductOrderEntity> products,
      int addressId,
      AddressEntity shippingAddress});

  @override
  $AddressEntityCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class __$$OrderEntityImplCopyWithImpl<$Res>
    extends _$OrderEntityCopyWithImpl<$Res, _$OrderEntityImpl>
    implements _$$OrderEntityImplCopyWith<$Res> {
  __$$OrderEntityImplCopyWithImpl(
      _$OrderEntityImpl _value, $Res Function(_$OrderEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntity
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
  }) {
    return _then(_$OrderEntityImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductOrderEntity>,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderEntityImpl implements _OrderEntity {
  _$OrderEntityImpl(
      {required this.orderId,
      required this.totalAmount,
      required this.status,
      required final List<ProductOrderEntity> products,
      required this.addressId,
      required this.shippingAddress})
      : _products = products;

  factory _$OrderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderEntityImplFromJson(json);

  @override
  final int orderId;
  @override
  final double totalAmount;
  @override
  final String status;
  final List<ProductOrderEntity> _products;
  @override
  List<ProductOrderEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int addressId;
  @override
  final AddressEntity shippingAddress;

  @override
  String toString() {
    return 'OrderEntity(orderId: $orderId, totalAmount: $totalAmount, status: $status, products: $products, addressId: $addressId, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEntityImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress));
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
      shippingAddress);

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      __$$OrderEntityImplCopyWithImpl<_$OrderEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderEntityImplToJson(
      this,
    );
  }
}

abstract class _OrderEntity implements OrderEntity {
  factory _OrderEntity(
      {required final int orderId,
      required final double totalAmount,
      required final String status,
      required final List<ProductOrderEntity> products,
      required final int addressId,
      required final AddressEntity shippingAddress}) = _$OrderEntityImpl;

  factory _OrderEntity.fromJson(Map<String, dynamic> json) =
      _$OrderEntityImpl.fromJson;

  @override
  int get orderId;
  @override
  double get totalAmount;
  @override
  String get status;
  @override
  List<ProductOrderEntity> get products;
  @override
  int get addressId;
  @override
  AddressEntity get shippingAddress;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductOrderEntity _$ProductOrderEntityFromJson(Map<String, dynamic> json) {
  return _ProductOrderEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductOrderEntity {
  int get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductOrderEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOrderEntityCopyWith<ProductOrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOrderEntityCopyWith<$Res> {
  factory $ProductOrderEntityCopyWith(
          ProductOrderEntity value, $Res Function(ProductOrderEntity) then) =
      _$ProductOrderEntityCopyWithImpl<$Res, ProductOrderEntity>;
  @useResult
  $Res call(
      {int productId,
      String productName,
      String imageUrl,
      double price,
      String size,
      String color,
      int quantity,
      double discount,
      double totalPrice,
      double discountPrice});
}

/// @nodoc
class _$ProductOrderEntityCopyWithImpl<$Res, $Val extends ProductOrderEntity>
    implements $ProductOrderEntityCopyWith<$Res> {
  _$ProductOrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductOrderEntityImplCopyWith<$Res>
    implements $ProductOrderEntityCopyWith<$Res> {
  factory _$$ProductOrderEntityImplCopyWith(_$ProductOrderEntityImpl value,
          $Res Function(_$ProductOrderEntityImpl) then) =
      __$$ProductOrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productId,
      String productName,
      String imageUrl,
      double price,
      String size,
      String color,
      int quantity,
      double discount,
      double totalPrice,
      double discountPrice});
}

/// @nodoc
class __$$ProductOrderEntityImplCopyWithImpl<$Res>
    extends _$ProductOrderEntityCopyWithImpl<$Res, _$ProductOrderEntityImpl>
    implements _$$ProductOrderEntityImplCopyWith<$Res> {
  __$$ProductOrderEntityImplCopyWithImpl(_$ProductOrderEntityImpl _value,
      $Res Function(_$ProductOrderEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    return _then(_$ProductOrderEntityImpl(
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
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductOrderEntityImpl implements _ProductOrderEntity {
  _$ProductOrderEntityImpl(
      {required this.productId,
      required this.productName,
      required this.imageUrl,
      required this.price,
      required this.size,
      required this.color,
      required this.quantity,
      required this.discount,
      required this.totalPrice,
      required this.discountPrice});

  factory _$ProductOrderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOrderEntityImplFromJson(json);

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
  final double discount;
  @override
  final double totalPrice;
  @override
  final double discountPrice;

  @override
  String toString() {
    return 'ProductOrderEntity(productId: $productId, productName: $productName, imageUrl: $imageUrl, price: $price, size: $size, color: $color, quantity: $quantity, discount: $discount, totalPrice: $totalPrice, discountPrice: $discountPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOrderEntityImpl &&
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
  int get hashCode => Object.hash(runtimeType, productId, productName, imageUrl,
      price, size, color, quantity, discount, totalPrice, discountPrice);

  /// Create a copy of ProductOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOrderEntityImplCopyWith<_$ProductOrderEntityImpl> get copyWith =>
      __$$ProductOrderEntityImplCopyWithImpl<_$ProductOrderEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOrderEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductOrderEntity implements ProductOrderEntity {
  factory _ProductOrderEntity(
      {required final int productId,
      required final String productName,
      required final String imageUrl,
      required final double price,
      required final String size,
      required final String color,
      required final int quantity,
      required final double discount,
      required final double totalPrice,
      required final double discountPrice}) = _$ProductOrderEntityImpl;

  factory _ProductOrderEntity.fromJson(Map<String, dynamic> json) =
      _$ProductOrderEntityImpl.fromJson;

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
  @override
  double get discount;
  @override
  double get totalPrice;
  @override
  double get discountPrice;

  /// Create a copy of ProductOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOrderEntityImplCopyWith<_$ProductOrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressEntity _$AddressEntityFromJson(Map<String, dynamic> json) {
  return _AddressEntity.fromJson(json);
}

/// @nodoc
mixin _$AddressEntity {
  int get addressId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get addressDetail => throw _privateConstructorUsedError;
  String? get additionalAddress => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this AddressEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressEntityCopyWith<AddressEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressEntityCopyWith<$Res> {
  factory $AddressEntityCopyWith(
          AddressEntity value, $Res Function(AddressEntity) then) =
      _$AddressEntityCopyWithImpl<$Res, AddressEntity>;
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
class _$AddressEntityCopyWithImpl<$Res, $Val extends AddressEntity>
    implements $AddressEntityCopyWith<$Res> {
  _$AddressEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressEntity
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
abstract class _$$AddressEntityImplCopyWith<$Res>
    implements $AddressEntityCopyWith<$Res> {
  factory _$$AddressEntityImplCopyWith(
          _$AddressEntityImpl value, $Res Function(_$AddressEntityImpl) then) =
      __$$AddressEntityImplCopyWithImpl<$Res>;
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
class __$$AddressEntityImplCopyWithImpl<$Res>
    extends _$AddressEntityCopyWithImpl<$Res, _$AddressEntityImpl>
    implements _$$AddressEntityImplCopyWith<$Res> {
  __$$AddressEntityImplCopyWithImpl(
      _$AddressEntityImpl _value, $Res Function(_$AddressEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressEntity
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
    return _then(_$AddressEntityImpl(
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
class _$AddressEntityImpl implements _AddressEntity {
  _$AddressEntityImpl(
      {required this.addressId,
      required this.fullName,
      required this.phoneNumber,
      required this.addressDetail,
      this.additionalAddress,
      required this.province,
      required this.city,
      required this.country,
      required this.isDefault});

  factory _$AddressEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressEntityImplFromJson(json);

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
    return 'AddressEntity(addressId: $addressId, fullName: $fullName, phoneNumber: $phoneNumber, addressDetail: $addressDetail, additionalAddress: $additionalAddress, province: $province, city: $city, country: $country, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressEntityImpl &&
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

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressEntityImplCopyWith<_$AddressEntityImpl> get copyWith =>
      __$$AddressEntityImplCopyWithImpl<_$AddressEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressEntityImplToJson(
      this,
    );
  }
}

abstract class _AddressEntity implements AddressEntity {
  factory _AddressEntity(
      {required final int addressId,
      required final String fullName,
      required final String phoneNumber,
      required final String addressDetail,
      final String? additionalAddress,
      required final String province,
      required final String city,
      required final String country,
      required final bool isDefault}) = _$AddressEntityImpl;

  factory _AddressEntity.fromJson(Map<String, dynamic> json) =
      _$AddressEntityImpl.fromJson;

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

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressEntityImplCopyWith<_$AddressEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
