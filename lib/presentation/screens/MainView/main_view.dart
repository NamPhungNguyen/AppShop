import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Checkout/address_view.dart';
import 'package:front_shop/presentation/screens/Checkout/checkout_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_create_new_password_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_code_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/presentation/screens/Location/allow_location_view.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
import 'package:front_shop/presentation/screens/Menu/Account/profile.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import '../Login/log_in.dart';
import '../Menu/Account/account_view.dart';
import '../Menu/Cart/cart_view.dart';
import '../Menu/Home/home_view.dart';
import '../Menu/Saved/saved_view.dart';
import '../Notification/notification_view.dart';
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
      case NotificationView.notification:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case CartView.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case SavedView.saved_view:
        return MaterialPageRoute(builder: (_) => SavedView());
      case AccountView.account:
        return MaterialPageRoute(builder: (_) => const AccountView());
      case CheckoutView.check_out_view:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
      case AddressView.address:
        return MaterialPageRoute(builder: (_) => const AddressView());
      case ProfileView.profile_user:
        return MaterialPageRoute(builder: (_) => const ProfileView());
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
