// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentEntityImpl _$$CommentEntityImplFromJson(Map<String, dynamic> json) =>
    _$CommentEntityImpl(
      commentId: (json['commentId'] as num).toInt(),
      content: json['content'] as String,
      rating: (json['rating'] as num).toInt(),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productId: (json['productId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      fullName: json['fullName'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$CommentEntityImplToJson(_$CommentEntityImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
      'rating': instance.rating,
      'imageUrls': instance.imageUrls,
      'productId': instance.productId,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'profileImgUrl': instance.profileImgUrl,
      'createdAt': instance.createdAt,
    };

_$CommentsEntityImpl _$$CommentsEntityImplFromJson(Map<String, dynamic> json) =>
    _$CommentsEntityImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommentsEntityImplToJson(
        _$CommentsEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
