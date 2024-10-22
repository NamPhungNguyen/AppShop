import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Location/allow_location_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/domain/models/login.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../domain/states/login_state.dart';
import '../../../utils/preference_util.dart';
import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/FormLoginWith/form_login_with.dart';
import '../../commom/widgets/Input/input_field_primary.dart';

// LoginState provider
final loginStateProvider = StateNotifierProvider<LoginState, AsyncValue<Login>>(
  (ref) => LoginState(
    AsyncValue.data(Login(
        code: 0,
        message: '',
        result: const LoginResult(token: '', authenticated: false))),
    ref,
  ),
);

class LoginView extends ConsumerWidget {
  static const String routeName = '/log_in_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final loginState = ref.watch(loginStateProvider);

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
            loginState.when(
              data: (login) {
                return ButtonPrimary(
                  text: "Login",
                  onPressed: () async {
                    if (login.result.authenticated) {
                      Navigator.pushNamed(context, AllowLocationView.routeName);
                      return;
                    }

                    await ref.read(loginStateProvider.notifier).login(
                          emailController.text,
                          passwordController.text,
                        );

                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please enter your email and password.')),
                      );
                      return;
                    }

                    ref.read(loginStateProvider.notifier).state = AsyncValue.loading();

                    await ref.read(loginStateProvider.notifier).login(
                          emailController.text,
                          passwordController.text,
                        );

                    final updatedLoginState = ref.read(loginStateProvider);

                    updatedLoginState.when(
                      data: (updatedLogin) {
                        if (updatedLogin.result.authenticated) {
                          // save the token after successful login
                          PreferenceUtil.setAuthToken(updatedLogin.result.token);
                          Navigator.pushNamed(context, AllowLocationView.routeName);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login successful!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login failed. Please try again.')),
                          );
                        }
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, st) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
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
