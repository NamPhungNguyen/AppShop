import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:front_shop/presentation/screens/Menu/Account/update_email.dart';
import 'package:front_shop/presentation/screens/Menu/Account/update_phone_number.dart';
import 'package:front_shop/presentation/screens/Menu/Account/update_profile.dart';
import 'package:front_shop/presentation/screens/Menu/Account/widgets/profile_menu.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/preference_util.dart';
import '../../../commom/widgets/Appbar/appbar.dart';
import '../../../commom/widgets/custom_shapes/containers/section_heading.dart';

class ProfileView extends ConsumerStatefulWidget {
  static const String routeName = "/profile";

  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  bool isLoading = false;

  Future<void> _uploadProfileImage(BuildContext context, WidgetRef ref) async {
    setState(() {
      isLoading = true;
    });

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    File imageFile = File(pickedFile.path);

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');

      // Upload the file
      await storageRef.putFile(imageFile);

      // Get the download URL
      String downloadUrl = await storageRef.getDownloadURL();
      ref.refresh(userStateProvider);

      print("Upload complete! Image URL: $downloadUrl");

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Profile image updated!");
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Failed to upload image: $e");
    }
  }

  void resetAllProviders(WidgetRef ref) {
    ref.invalidate(userStateProvider);
    ref.invalidate(cartStateProvider);
    ref.invalidate(favoriteStateProvider);
  }


  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider);
    return Scaffold(
      appBar: const TAppbar(showBackArrow: true, title: Text("Profile")),

      /// body
      body: Stack(
        children: [
          userState.when(
            data: (user) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  user.result.profileImg ??
                                      AssetsPathUtil.user("profile.png"),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      AssetsPathUtil.user("profile.png"),
                                      width: 80,
                                      height: 80,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _uploadProfileImage(context, ref);
                            },
                            child: const Text("Change Profile Picture"),
                          )
                        ],
                      ),

                      /// details
                      const SizedBox(height: AppSizes.spaceBtwItems / 2),
                      const Divider(),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// heading profile info
                      const SectionHeading(
                          title: 'Profile Information',
                          showActionButton: false),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      ProfileMenu(
                          title: 'Name',
                          value: user.result.fullName as String,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UpdateProfileNameView.routeName);
                          }),
                      ProfileMenu(
                          title: 'Username',
                          value: user.result.username as String,
                          onPressed: () {}),

                      const SizedBox(height: AppSizes.spaceBtwItems),
                      const Divider(),

                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Heading Personal Info
                      const SectionHeading(
                          title: 'Personal Information',
                          showActionButton: false),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      ProfileMenu(
                          title: 'E-mail',
                          value: user.result.email as String,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UpdateProfileEmailView.routeName);
                          }),
                      ProfileMenu(
                          title: 'Phone Number',
                          value: user.result.phoneNumber as String,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UpdatePhoneNumberView.routeName);
                          }),
                      const SizedBox(height: AppSizes.appBarHeight),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            await ref
                                .read(loginStateProvider.notifier)
                                .logout();
                            await PreferenceUtil.clearUserData();
                            resetAllProviders(ref);
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginView.routeName, (route) => false);
                            Fluttertoast.showToast(
                              msg: 'Logged out successfully!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          },
                          child: Text(
                            "Logout",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, stack) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error: $error"),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.refresh(userStateProvider);
                      },
                      child: const Text("Reload"),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
