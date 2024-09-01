import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/main_view/main_view.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainView.splash,
      onGenerateRoute: MainView.generateRoute,
    );
  }
}



