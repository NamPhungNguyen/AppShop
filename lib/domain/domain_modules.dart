import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/usecases/login_usecase.dart';
import 'package:front_shop/domain/usecases/login_usecase_impl.dart';
import 'package:front_shop/server/data/providers/login_repository_provider.dart';

final loginUsecaseProvider = Provider<LoginUsecase>(
  (ref) => LoginUsecaseImpl(ref.watch(loginRepositoryProvider)),
);
