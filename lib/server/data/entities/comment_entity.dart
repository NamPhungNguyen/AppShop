import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_entity.freezed.dart';
part 'comment_entity.g.dart';

@freezed
class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    required int commentId,
    required String content,
    required int rating,
    required List<String> imageUrls,
    required int productId,
    required int userId,
    required String fullName,
    required String profileImgUrl,
    required String createdAt,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
}

@freezed
class CommentsEntity with _$CommentsEntity {
  const factory CommentsEntity({
    required List<CommentEntity> result,
  }) = _CommentsEntity;

  factory CommentsEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentsEntityFromJson(json);
}
