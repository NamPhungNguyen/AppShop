import 'package:front_shop/domain/models/comment.dart';
import 'package:front_shop/domain/translator/comment_translator.dart';
import 'package:front_shop/domain/usecases/comment_usecase.dart';
import 'package:front_shop/server/data/repository/comment_repository.dart';

class CommentUsecaseImpl implements CommentUsecase {
  final CommentRepository _commentRepository;

  CommentUsecaseImpl(this._commentRepository);

  @override
  Future<Comments> fetchAllComment(String productId) async {
    final entity = await _commentRepository.fetchAllComment(productId);
    return CommentTranslator.translateAll(entity);
  }

  @override
  Future<void> addComment(String productId, String content, int rating,
      List<String> imageUrls) async {
    return _commentRepository.addComment(productId, content, rating, imageUrls);
  }

  @override
  Future<void> deleteComment(String commentId) async {
    return _commentRepository.deleteComment(commentId);
  }
}
