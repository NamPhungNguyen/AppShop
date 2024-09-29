import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import '../Home/home_view.dart';
import '../Login/log_in.dart';
import '../SignUp/sign_up.dart';

class MainView {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.log_in_view:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case SignUpView.sign_up_view:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case HomeView.home_view:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case BottomBar.bottom_bar:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      case OnBoardingView.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
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
