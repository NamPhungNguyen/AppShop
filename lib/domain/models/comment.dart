import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int commentId,
    required String content,
    required int rating,
    required List<String> imageUrls,
    required int productId,
    required int userId,
    required String fullName,
    required String profileImgUrl,
    required String createdAt,
  }) = _Comment;
}

@freezed
class Comments with _$Comments {
  const factory Comments({
    required List<Comment> result,
  }) = _Comments;
}
