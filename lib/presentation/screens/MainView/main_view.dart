import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Checkout/address_view.dart';
import 'package:front_shop/presentation/screens/Checkout/checkout_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_create_new_password_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_code_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/presentation/screens/Location/allow_location_view.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
import 'package:front_shop/presentation/screens/Menu/Account/profile_view.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';
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
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case SignUpView.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case BottomBar.routeName:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      case OnBoardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case ForgotPasswordView.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case ForgotPasswordCodeView.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordCodeView());
      case ForgotCreateNewPasswordView.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotCreateNewPasswordView());
      case AllowLocationView.routeName:
        return MaterialPageRoute(builder: (_) => const AllowLocationView());
      case EnterYourLocationView.routeName:
        return MaterialPageRoute(builder: (_) => const EnterYourLocationView());
      case NotificationView.routeName:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case CartView.routeName:
        return MaterialPageRoute(builder: (_) => const CartView());
      case SavedView.routeName:
        return MaterialPageRoute(builder: (_) => SavedView());
      case AccountView.routeName:
        return MaterialPageRoute(builder: (_) => const AccountView());
      case CheckoutView.routeName:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
      case AddressView.routeName:
        return MaterialPageRoute(builder: (_) => const AddressView());
      case ProfileView.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case ProductDetailView.routeName:
        return MaterialPageRoute(builder: (_) => const ProductDetailView());
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
