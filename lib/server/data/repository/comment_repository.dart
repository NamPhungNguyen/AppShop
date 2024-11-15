import 'package:front_shop/server/data/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<CommentsEntity> fetchAllComment(String productId);

  Future<void> addComment(
      String productId, String content, int rating, List<String> imageUrls);

  Future<void> deleteComment(String commentId);
}
