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
}
