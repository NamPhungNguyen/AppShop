import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Menu/Account/widgets/profile_menu.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/Appbar/appbar.dart';
import '../../../commom/custom_shapes/containers/section_heading.dart';
import '../../../commom/custom_shapes/containers/t_circular_image.dart';

class ProfileView extends StatelessWidget {
  static const String profile_user = "/profile";

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    TCircularImage(image: AssetsPathUtil.user("profile.png"), width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text("Change Profile Picture"))
                  ],
                ),
              ),
              /// details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// heading profile info
              const SectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),


              ProfileMenu(title: 'Name', value: 'Nguyen Phung Nam', onPressed: () {}),
              ProfileMenu(title: 'Username', value: 'Nam Hien', onPressed: () {}),

              const SizedBox(height: AppSizes.spaceBtwItems),
              const Divider(),

              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Heading Personal Info
              const SectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              ProfileMenu(title: 'User ID', value: '45689', icon: Iconsax.copy, onPressed: () {}),
              ProfileMenu(title: 'E-mail', value: 'namhien12082003@gmail.com', onPressed: () {}),
              ProfileMenu(title: 'Phone Number', value: '+981 342 922', onPressed: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
