import 'package:front_shop/domain/models/comment.dart';

abstract class CommentUsecase {
  Future<Comments> fetchAllComment(String productId);
}