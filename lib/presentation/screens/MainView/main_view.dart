import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_create_new_password_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_code_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/presentation/screens/Location/allow_location_view.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
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
      case ForgotPasswordView.forgot_password:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case ForgotPasswordCodeView.forgot_password_code:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordCodeView());
      case ForgotCreateNewPasswordView.forgot_create_new_pass:
        return MaterialPageRoute(builder: (_) => const ForgotCreateNewPasswordView());
      case AllowLocationView.allow_location:
        return MaterialPageRoute(builder: (_) => const AllowLocationView());
      case EnterYourLocationView.enter_your_location:
        return MaterialPageRoute(builder: (_) => const EnterYourLocationView());
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
