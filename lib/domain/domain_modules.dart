import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/usecases/category_usecase.dart';
import 'package:front_shop/domain/usecases/category_usecase_impl.dart';
import 'package:front_shop/domain/usecases/location_usecase.dart';
import 'package:front_shop/domain/usecases/location_usecase_impl.dart';
import 'package:front_shop/domain/usecases/login_usecase.dart';
import 'package:front_shop/domain/usecases/login_usecase_impl.dart';
import 'package:front_shop/domain/usecases/product_usecase.dart';
import 'package:front_shop/domain/usecases/product_usecase_impl.dart';
import 'package:front_shop/domain/usecases/signup_usecase.dart';
import 'package:front_shop/domain/usecases/signup_usecase_impl.dart';
import 'package:front_shop/domain/usecases/user_usecase.dart';
import 'package:front_shop/domain/usecases/user_usecase_impl.dart';
import 'package:front_shop/server/data/providers/category_repository_provider.dart';
import 'package:front_shop/server/data/providers/favorite_repository_provider.dart';
import 'package:front_shop/server/data/providers/location_repository_provider.dart';
import 'package:front_shop/server/data/providers/login_repository_provider.dart';
import 'package:front_shop/server/data/providers/product_repository_provider.dart';
import 'package:front_shop/server/data/providers/user_repository_provider.dart';

import '../server/data/providers/signup_repository_provider.dart';

final loginUsecaseProvider = Provider<LoginUsecase>(
  (ref) => LoginUsecaseImpl(ref.watch(loginRepositoryProvider)),
);

final signupUsecaseProvider = Provider<SignUpUsecase>(
  (ref) => SignUpUsecaseImpl(ref.watch(signupRepositoryProvider)),
);

final locationUsecaseProvider = Provider<LocationUsecase>(
  (ref) => LocationUsecaseImpl(ref.watch(locationRepositoryProvider)),
);

final userUsecaseProvider = Provider<UserUsecase>(
  (ref) => UserUsecaseImpl(ref.watch(userRepositoryProvider)),
);

final categoryUsecaseProvider = Provider<CategoryUsecase>(
  (ref) => CategoryUsecaseImpl(ref.watch(categoryRepositoryProvider)),
);

final productUsecaseProvider = Provider<ProductUsecase>(
  (ref) => ProductUsecaseImpl(ref.watch(productRepositoryProvider)),
);

final favoriteUsecaseProvider = Provider<ProductUsecase>(
  (ref) => ProductUsecaseImpl(ref.watch(favoriteRepositoryProvider)),
);
