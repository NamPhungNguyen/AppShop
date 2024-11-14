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
}
