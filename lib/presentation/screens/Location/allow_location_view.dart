import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
import 'package:front_shop/presentation/widgets/Button/button_primary.dart';
import 'package:front_shop/utils/app_colors.dart';
import 'package:front_shop/utils/assets_path_util.dart';

class AllowLocationView extends StatelessWidget {
  static const String allow_location = "/allow_location";

  const AllowLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPathUtil.location("location.png"),
              color: AppColors.primaryTextAndButton,
              height: 50,
              width: 38,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "What is Your Location?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "We need to know your location in order to suggest nearby services.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            ButtonPrimary(
              text: "Allow Location Access",
              onPressed: () {},
            ),
            SizedBox(
              height: 32,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, EnterYourLocationView.enter_your_location);
              },
              child: Text(
                "Enter Location Manually",
                style: TextStyle(
                    fontSize: 16, color: AppColors.primaryTextAndButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}