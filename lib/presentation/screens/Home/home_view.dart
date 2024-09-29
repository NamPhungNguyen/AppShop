import 'package:flutter/material.dart';
import 'package:front_shop/presentation/component/main_header.dart';

class HomeView extends StatelessWidget {
  static const String home_view = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            MainHeader(),
          ],
        ),
      ),
    );
  }
}
