import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/server/data/datastores/comment_repository_impl.dart';
import 'package:front_shop/server/data/repository/comment_repository.dart';

import '../../client/client_service.dart';

final commentRepositoryProvider = Provider<CommentRepository>(
  (ref) => CommentRepositoryImpl(ClientService()),
);
