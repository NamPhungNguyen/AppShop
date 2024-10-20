import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../screens/Login/log_in_view.dart';
import '../../../screens/SignUp/sign_up.dart';

class FormLoginWith extends StatelessWidget {
  final String titleSuggest;
  final String titleNext;
  final bool checkTitleNext;  // if true navigator -> Sign Up, false navigator -> Login

  const FormLoginWith({
    super.key,
    required this.titleSuggest,
    required this.titleNext,
    this.checkTitleNext = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Column(
            children: [
              const Text(
                "- OR Continue with -",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF575757),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsPathUtil.login("google.png")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Image.asset(AssetsPathUtil.login("apple.png")),
                    ),
                    Image.asset(AssetsPathUtil.login("facebook.png")),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          child: Text.rich(
            TextSpan(
              text: titleSuggest,
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: titleNext,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, checkTitleNext ? SignUpView.routeName : LoginView.routeName);
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
