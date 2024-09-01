import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import 'package:front_shop/presentation/screens/home/home_view.dart';


import '../SignIn/sign_in.dart';
import '../SignUp/sign_up.dart';

class MainView {
  static const String splash = '/';
  static const String sign_in_view = '/sign_in_view';
  static const String home_view = '/home_view';
  static const String sign_up_view = '/SignUp';
  static const String bottom_bar = '/bottom_bar';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case sign_in_view:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case sign_up_view:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case home_view:
        return MaterialPageRoute(builder: (_) => HomeView());
      case bottom_bar:
        return MaterialPageRoute(builder: (_) => BottomBar());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
