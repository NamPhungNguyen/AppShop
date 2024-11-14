// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) {
  return _CommentEntity.fromJson(json);
}

/// @nodoc
mixin _$CommentEntity {
  int get commentId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get profileImgUrl => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CommentEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentEntityCopyWith<CommentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEntityCopyWith<$Res> {
  factory $CommentEntityCopyWith(
          CommentEntity value, $Res Function(CommentEntity) then) =
      _$CommentEntityCopyWithImpl<$Res, CommentEntity>;
  @useResult
  $Res call(
      {int commentId,
      String content,
      int rating,
      List<String> imageUrls,
      int productId,
      int userId,
      String fullName,
      String profileImgUrl,
      String createdAt});
}

/// @nodoc
class _$CommentEntityCopyWithImpl<$Res, $Val extends CommentEntity>
    implements $CommentEntityCopyWith<$Res> {
  _$CommentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? content = null,
    Object? rating = null,
    Object? imageUrls = null,
    Object? productId = null,
    Object? userId = null,
    Object? fullName = null,
    Object? profileImgUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgUrl: null == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentEntityImplCopyWith<$Res>
    implements $CommentEntityCopyWith<$Res> {
  factory _$$CommentEntityImplCopyWith(
          _$CommentEntityImpl value, $Res Function(_$CommentEntityImpl) then) =
      __$$CommentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int commentId,
      String content,
      int rating,
      List<String> imageUrls,
      int productId,
      int userId,
      String fullName,
      String profileImgUrl,
      String createdAt});
}

/// @nodoc
class __$$CommentEntityImplCopyWithImpl<$Res>
    extends _$CommentEntityCopyWithImpl<$Res, _$CommentEntityImpl>
    implements _$$CommentEntityImplCopyWith<$Res> {
  __$$CommentEntityImplCopyWithImpl(
      _$CommentEntityImpl _value, $Res Function(_$CommentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? content = null,
    Object? rating = null,
    Object? imageUrls = null,
    Object? productId = null,
    Object? userId = null,
    Object? fullName = null,
    Object? profileImgUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentEntityImpl(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgUrl: null == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentEntityImpl implements _CommentEntity {
  const _$CommentEntityImpl(
      {required this.commentId,
      required this.content,
      required this.rating,
      required final List<String> imageUrls,
      required this.productId,
      required this.userId,
      required this.fullName,
      required this.profileImgUrl,
      required this.createdAt})
      : _imageUrls = imageUrls;

  factory _$CommentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentEntityImplFromJson(json);

  @override
  final int commentId;
  @override
  final String content;
  @override
  final int rating;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final int productId;
  @override
  final int userId;
  @override
  final String fullName;
  @override
  final String profileImgUrl;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'CommentEntity(commentId: $commentId, content: $content, rating: $rating, imageUrls: $imageUrls, productId: $productId, userId: $userId, fullName: $fullName, profileImgUrl: $profileImgUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentEntityImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImgUrl, profileImgUrl) ||
                other.profileImgUrl == profileImgUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentId,
      content,
      rating,
      const DeepCollectionEquality().hash(_imageUrls),
      productId,
      userId,
      fullName,
      profileImgUrl,
      createdAt);

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentEntityImplCopyWith<_$CommentEntityImpl> get copyWith =>
      __$$CommentEntityImplCopyWithImpl<_$CommentEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentEntityImplToJson(
      this,
    );
  }
}

abstract class _CommentEntity implements CommentEntity {
  const factory _CommentEntity(
      {required final int commentId,
      required final String content,
      required final int rating,
      required final List<String> imageUrls,
      required final int productId,
      required final int userId,
      required final String fullName,
      required final String profileImgUrl,
      required final String createdAt}) = _$CommentEntityImpl;

  factory _CommentEntity.fromJson(Map<String, dynamic> json) =
      _$CommentEntityImpl.fromJson;

  @override
  int get commentId;
  @override
  String get content;
  @override
  int get rating;
  @override
  List<String> get imageUrls;
  @override
  int get productId;
  @override
  int get userId;
  @override
  String get fullName;
  @override
  String get profileImgUrl;
  @override
  String get createdAt;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentEntityImplCopyWith<_$CommentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentsEntity _$CommentsEntityFromJson(Map<String, dynamic> json) {
  return _CommentsEntity.fromJson(json);
}

/// @nodoc
mixin _$CommentsEntity {
  List<CommentEntity> get result => throw _privateConstructorUsedError;

  /// Serializes this CommentsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsEntityCopyWith<CommentsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsEntityCopyWith<$Res> {
  factory $CommentsEntityCopyWith(
          CommentsEntity value, $Res Function(CommentsEntity) then) =
      _$CommentsEntityCopyWithImpl<$Res, CommentsEntity>;
  @useResult
  $Res call({List<CommentEntity> result});
}

/// @nodoc
class _$CommentsEntityCopyWithImpl<$Res, $Val extends CommentsEntity>
    implements $CommentsEntityCopyWith<$Res> {
  _$CommentsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsEntity
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
              as List<CommentEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsEntityImplCopyWith<$Res>
    implements $CommentsEntityCopyWith<$Res> {
  factory _$$CommentsEntityImplCopyWith(_$CommentsEntityImpl value,
          $Res Function(_$CommentsEntityImpl) then) =
      __$$CommentsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentEntity> result});
}

/// @nodoc
class __$$CommentsEntityImplCopyWithImpl<$Res>
    extends _$CommentsEntityCopyWithImpl<$Res, _$CommentsEntityImpl>
    implements _$$CommentsEntityImplCopyWith<$Res> {
  __$$CommentsEntityImplCopyWithImpl(
      _$CommentsEntityImpl _value, $Res Function(_$CommentsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CommentsEntityImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsEntityImpl implements _CommentsEntity {
  const _$CommentsEntityImpl({required final List<CommentEntity> result})
      : _result = result;

  factory _$CommentsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsEntityImplFromJson(json);

  final List<CommentEntity> _result;
  @override
  List<CommentEntity> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'CommentsEntity(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsEntityImpl &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  /// Create a copy of CommentsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsEntityImplCopyWith<_$CommentsEntityImpl> get copyWith =>
      __$$CommentsEntityImplCopyWithImpl<_$CommentsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsEntityImplToJson(
      this,
    );
  }
}

abstract class _CommentsEntity implements CommentsEntity {
  const factory _CommentsEntity({required final List<CommentEntity> result}) =
      _$CommentsEntityImpl;

  factory _CommentsEntity.fromJson(Map<String, dynamic> json) =
      _$CommentsEntityImpl.fromJson;

  @override
  List<CommentEntity> get result;

  /// Create a copy of CommentsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsEntityImplCopyWith<_$CommentsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
