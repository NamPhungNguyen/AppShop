import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_shop/domain/models/signup.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../main.dart';
import '../../commom/widgets/Button/button_primary.dart';
import '../../commom/widgets/Dialog/base_dialog_view.dart';
import '../../commom/widgets/Input/input_field_primary.dart';
import '../Login/log_in_view.dart';

class SignUpView extends ConsumerStatefulWidget {
  static const String routeName = '/sign_up';

  const SignUpView({super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  bool isPrivacyChecked = false;
  bool isLoading = false; // Add this variable

  bool _validateInputs() {
    // Validate username
    if (usernameController.text.trim().isEmpty) {
      _showError("Username is required");
      return false;
    }
    // Validate email
    if (emailController.text.trim().isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text.trim())) {
      _showError("Please enter email in correct format");
      return false;
    }
    // Validate first name
    if (firstNameController.text.trim().isEmpty) {
      _showError("First name is required");
      return false;
    }
    // Validate last name
    if (lastNameController.text.trim().isEmpty) {
      _showError("Last name is required");
      return false;
    }
    // Validate phone number
    if (phoneNumberController.text.trim().isEmpty) {
      _showError("Phone number is required");
      return false;
    }
    // Validate password
    if (passwordController.text.trim().isEmpty) {
      _showError("Password is required");
      return false;
    }
    // Validate repeat password
    if (repeatPasswordController.text.trim().isEmpty) {
      _showError("Confirm Password is required");
      return false;
    }
    // Check if passwords match
    if (passwordController.text.trim() !=
        repeatPasswordController.text.trim()) {
      _showError("Passwords do not match");
      return false;
    }
    // Check privacy agreement
    if (!isPrivacyChecked) {
      _showError("You must agree to the Privacy Policy");
      return false;
    }
    return true;
  }

  void _showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<SignUp>>(signUpStateProvider, (previous, next) {
      next.when(
        data: (signup) {
          setState(() {
            isLoading = false; // Stop loading on success
          });
          Navigator.of(context).pop(); // Dismiss loading dialog
          BaseDialogView(
            titleDialog: "Signup Successful!",
            imageDialog: AssetsPathUtil.dialog("checkmark.png"),
            onPressed: () {
              Navigator.pushNamed(context, LoginView.routeName);
            },
          ).showBaseDialog(context);
        },
        loading: () {
          setState(() {
            isLoading = true;
          });
        },
        error: (error, stackTrace) {
          setState(() {
            isLoading = false;
          });
          String errorMessage =
          error.toString().replaceFirst('Exception: ', '');
          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        },
      );
    });

    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
        child: isLoading
            ? Center(child: CircularProgressIndicator()) // Show loader
            : ListView(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
              child: Text(
                "Create an\naccount",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 32),
              ),
            ),
            InputFieldPrimary(
              labelText: 'Username',
              controller: usernameController,
              icon: const Icon(Iconsax.user),
            ),
            const SizedBox(height: AppSizes.md),
            InputFieldPrimary(
              labelText: 'Email',
              controller: emailController,
              icon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(height: AppSizes.md),
            InputFieldPrimary(
              labelText: 'First Name',
              controller: firstNameController,
              icon: const Icon(Iconsax.personalcard),
            ),
            const SizedBox(height: AppSizes.md),
            InputFieldPrimary(
              labelText: 'Last Name',
              controller: lastNameController,
              icon: const Icon(Icons.person_rounded),
            ),
            const SizedBox(height: AppSizes.md),
            InputFieldPrimary(
              labelText: 'Phone',
              controller: phoneNumberController,
              icon: const Icon(Iconsax.mobile),
            ),
            const SizedBox(height: AppSizes.md),
            InputFieldPrimary(
              labelText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: const Icon(Icons.lock),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppSizes.md),
            InputFieldPrimary(
              labelText: 'Confirm Password',
              isPassword: true,
              controller: repeatPasswordController,
              icon: const Icon(Icons.lock),
              textInputAction: TextInputAction.done,
            ),

            /// privacy
            Row(
              children: [
                Checkbox(
                  value: isPrivacyChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isPrivacyChecked = newValue ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "I agree to the ",
                      style: const TextStyle(color: Color(0xFF676767)),
                      children: [
                        TextSpan(
                          text: "Privacy Policy",
                          style:
                          const TextStyle(color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            /// button
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: ButtonPrimary(
                text: "Create Account",
                onPressed: () {
                  if (_validateInputs()) {
                    ref.read(signUpStateProvider.notifier).signUp(
                      usernameController.text.trim(),
                      passwordController.text.trim(),
                      emailController.text.trim(),
                      firstNameController.text.trim(),
                      lastNameController.text.trim(),
                      phoneNumberController.text.trim(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

