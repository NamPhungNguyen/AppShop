import 'package:front_shop/domain/models/comment.dart';

abstract class CommentUsecase {
  Future<Comments> fetchAllComment(String productId);

  Future<void> addComment(
      String productId, String content, int rating, List<String> imageUrls);

  Future<void> deleteComment(String commentId);
}
