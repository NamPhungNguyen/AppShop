import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_shop/domain/models/login.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/presentation/screens/Location/allow_location_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../main.dart';
import '../../../utils/preference_util.dart';
import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/FormLoginWith/form_login_with.dart';
import '../../commom/widgets/Input/input_field_primary.dart';

class LoginView extends ConsumerWidget {
  static const String routeName = '/log_in_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final loginState = ref.watch(loginStateProvider);

    ref.listen<AsyncValue<Login>>(loginStateProvider, (previous, next) {
      next.when(
        data: (updatedLogin) async {
          if (updatedLogin.result.authenticated) {
            PreferenceUtil.setAuthToken(updatedLogin.result.token);

            // Check if this is the first login
            bool isFirstLogin = await PreferenceUtil.getIsFirstAllowLocation();
            if (isFirstLogin) {
              // Navigate to Allow Location screen and set first login to false
              await Navigator.pushNamed(context, AllowLocationView.routeName);
              await PreferenceUtil.setIsFirstAllowLocation(false);
            } else {
              // Navigate directly to Home screen
              Navigator.pushNamed(context, BottomBar.routeName);
            }

            Fluttertoast.showToast(
              msg: 'Login successful!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          } else {
            Fluttertoast.showToast(
              msg: 'Invalid username or password.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        loading: () => const SizedBox.shrink(),
        error: (error, st) {
          Fluttertoast.showToast(
            msg: 'Incorrect username or password. Please try again.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: ListView(
          children: [
            Text(
              "Welcome\nBack!",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 32),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            InputFieldPrimary(
              labelText: 'Username or Email',
              controller: emailController,
              icon: const Icon(Iconsax.user),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            InputFieldPrimary(
              labelText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: const Icon(Iconsax.lock),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPasswordView.routeName);
                },
                child: Text(
                  "Forgot password?",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Column(
              children: [
                if (loginState is AsyncLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ButtonPrimary(
                    text: "Login",
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'Please enter your email and password.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return;
                      }
                      ref
                          .read(loginStateProvider.notifier)
                          .login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                  ),
              ],
            ),
            const FormLoginWith(
              titleSuggest: "You don't have an account? ",
              titleNext: "Sign up",
              checkTitleNext: true,
            ),
          ],
        ),
      ),
    );
  }
}
