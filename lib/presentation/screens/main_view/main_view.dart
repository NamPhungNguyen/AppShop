import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import 'package:front_shop/presentation/screens/home/home_view.dart';

class MainView {
  static const String splash = '/';
  static const String home_view = '/home_view';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashView());
      case home_view:
        return MaterialPageRoute(builder: (_) => HomeView());
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
