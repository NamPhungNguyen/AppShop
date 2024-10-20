import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import '../../commom/widgets/Button/button_primary.dart';

class AllowLocationView extends StatelessWidget {
  static const String routeName = "/allow_location";

  const AllowLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPathUtil.location("location.png"),
              color: AppColors.primaryColor,
              height: 50,
              width: 38,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "What is Your Location?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "We need to know your location in order to suggest nearby services.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            ButtonPrimary(
              text: "Allow Location Access",
              onPressed: () {
                Navigator.pushNamed(context, BottomBar.routeName);
              },
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, EnterYourLocationView.routeName);
              },
              child: const Text(
                "Enter Location Manually",
                style: TextStyle(
                    fontSize: 16, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
