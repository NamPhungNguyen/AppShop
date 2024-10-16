import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/MainView/main_view.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import 'package:front_shop/utils/theme/theme.dart';

void main() {
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



