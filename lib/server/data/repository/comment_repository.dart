import 'package:front_shop/server/data/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<CommentsEntity> fetchAllComment(String productId);
}