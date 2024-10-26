import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Login/log_in_view.dart';
import 'package:front_shop/presentation/screens/Menu/Account/widgets/profile_menu.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../main.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/Appbar/appbar.dart';
import '../../../commom/widgets/custom_shapes/containers/section_heading.dart';
import '../../../commom/widgets/custom_shapes/containers/t_circular_image.dart';

class ProfileView extends ConsumerWidget {
  static const String routeName = "/profile";

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const TAppbar(showBackArrow: true, title: Text("Profile")),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                        image: AssetsPathUtil.user("profile.png"),
                        width: 80,
                        height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              /// details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// heading profile info
              const SectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              ProfileMenu(
                  title: 'Name', value: 'Nguyen Phung Nam', onPressed: () {}),
              ProfileMenu(
                  title: 'Username', value: 'Nam Hien', onPressed: () {}),

              const SizedBox(height: AppSizes.spaceBtwItems),
              const Divider(),

              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Heading Personal Info
              const SectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              ProfileMenu(
                  title: 'User ID',
                  value: '45689',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              ProfileMenu(
                  title: 'E-mail',
                  value: 'namhien12082003@gmail.com',
                  onPressed: () {}),
              ProfileMenu(
                  title: 'Phone Number',
                  value: '+981 342 922',
                  onPressed: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(
                  title: 'Date of Birth',
                  value: '10 Oct, 1994',
                  onPressed: () {}),

              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () async {
                    await ref.read(loginStateProvider.notifier).logout();
                    Navigator.pushNamed(context, LoginView.routeName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logged out successfully!')),
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
      ),
    );
  }
}
