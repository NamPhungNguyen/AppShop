import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/domain/models/my_info.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/domain/models/signup.dart';
import 'package:front_shop/domain/states/category_state.dart';
import 'package:front_shop/domain/states/location_state.dart';
import 'package:front_shop/domain/states/product_state.dart';
import 'package:front_shop/domain/states/signup_state.dart';
import 'package:front_shop/domain/states/token_state.dart';
import 'package:front_shop/domain/states/user_state.dart';
import 'package:front_shop/presentation/screens/MainView/main_view.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import 'package:front_shop/utils/theme/theme.dart';

import 'domain/models/login.dart';
import 'domain/states/login_state.dart';

// TokenState provider
final tokenStateProvider =
    StateNotifierProvider<TokenState, AsyncValue<String?>>(
  (ref) => TokenState(),
);

final signUpStateProvider =
    StateNotifierProvider<SignUpState, AsyncValue<SignUp>>(
  (ref) => SignUpState(ref),
);

final loginStateProvider = StateNotifierProvider<LoginState, AsyncValue<Login>>(
  (ref) => LoginState(
    AsyncValue.data(
      Login(
        code: 0,
        message: '',
        result: const LoginResult(token: '', authenticated: false),
      ),
    ),
    ref,
  ),
);

final locationStateProvider =
    StateNotifierProvider<LocationState, AsyncValue<bool>>(
  (ref) => LocationState(ref),
);

final userStateProvider = StateNotifierProvider<UserState, AsyncValue<MyInfo>>(
  (ref) => UserState(ref),
);

final categoryStateProvider =
    StateNotifierProvider<CategoryState, AsyncValue<Categories>>(
  (ref) => CategoryState(ref),
);

final productStateProvider =
    StateNotifierProvider<ProductState, AsyncValue<Products>>(
  (ref) => ProductState(ref),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      initialRoute: SplashView.routeName,
      onGenerateRoute: MainView.generateRoute,
    );
  }
}
