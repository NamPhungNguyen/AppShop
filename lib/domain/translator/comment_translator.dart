import 'package:front_shop/domain/models/comment.dart';

import '../../server/data/entities/comment_entity.dart';

class CommentTranslator {
  static Comment translate(final CommentEntity entity) {
    return Comment(
      commentId: entity.commentId,
      content: entity.content,
      rating: entity.rating,
      imageUrls: entity.imageUrls,
      productId: entity.productId,
      userId: entity.userId,
      fullName: entity.fullName,
      profileImgUrl: entity.profileImgUrl,
      createdAt: entity.createdAt,
    );
  }

  static Comments translateAll(final CommentsEntity entity) {
    return Comments(result: entity.result.map((e) => translate(e)).toList());
  }
}
