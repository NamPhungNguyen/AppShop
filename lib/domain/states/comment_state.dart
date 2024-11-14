import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/domain_modules.dart';
import 'package:front_shop/domain/models/comment.dart';

class CommentState extends StateNotifier<AsyncValue<Comments>> {
  final StateNotifierProviderRef _ref;
  final String productId;

  CommentState(this._ref, this.productId) : super(const AsyncValue.loading()) {
   fetchAllComment();
  }

  Future<void> fetchAllComment() async {
    state = const AsyncValue.loading();
    try {
      final commentUsecase = _ref.read(commentUsecaseProvider);
      final comments = await commentUsecase.fetchAllComment(productId);
      state = AsyncValue.data(comments);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

