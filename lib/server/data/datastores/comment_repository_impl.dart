import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/entities/comment_entity.dart';
import 'package:front_shop/server/data/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final ClientService _clientService;

  CommentRepositoryImpl(this._clientService);

  @override
  Future<CommentsEntity> fetchAllComment(String productId) async {
    return await _clientService.fetchAllComment(productId);
  }

  @override
  Future<void> addComment(String productId, String content, int rating,
      List<String> imageUrls) async {
    return await _clientService.addComment(
        productId, content, rating, imageUrls);
  }

  @override
  Future<void> deleteComment(String commentId) async {
    return await _clientService.deleteComment(commentId);
  }
}
