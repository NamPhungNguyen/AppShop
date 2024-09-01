import 'package:flutter/material.dart';
import 'package:front_shop/presentation/component/main_header.dart';

class HomeView extends StatelessWidget {
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
