import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Address/address_view.dart';
import 'package:front_shop/presentation/screens/Order/order_view.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../commom/widgets/Appbar/appbar.dart';
import '../../../commom/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../commom/widgets/custom_shapes/containers/section_heading.dart';
import '../../../commom/widgets/list_tiles/settings_menu_tile.dart';
import '../../../commom/widgets/list_tiles/user_profile_tile.dart';

class AccountView extends StatelessWidget {
  static const String routeName = "/account";

  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //app bar
                  TAppbar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: AppColors.textWhite)),
                  ),

                  // user profile card
                  const UserProfileTile(),
                  const SizedBox(height: AppSizes.spaceBtwSections)
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  SettingsMenuTile(icon: Iconsax.safe_home, title: "My address", subTitle: 'Set shopping delivery address', opTap: (){
                    Navigator.pushNamed(context, AddressView.routeName);
                  }),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: "My cart", subTitle: 'Add, remove products and move to checkout', opTap: (){}),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: "My orders", subTitle: 'In process and Completed Orders', opTap: (){Navigator.pushNamed(context, OrderView.routeName);}),
                  SettingsMenuTile(icon: Iconsax.notification, title: "Notifications", subTitle: 'Set any kind of notification message', opTap: (){}),
                  SettingsMenuTile(icon: Iconsax.security_card, title: "Account Privacy", subTitle: 'Manage data usage and connected accounts', opTap: (){}),

                  // app settings
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const SectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SettingsMenuTile(icon: Iconsax.location, title: "Geolocation", subTitle: 'Set recommendation based on location', trailing: Switch(value: true, activeColor: AppColors.primaryColor, onChanged: (value){})),
                  SettingsMenuTile(icon: Iconsax.security_user, title: "Safe Mode", subTitle: 'Search result is safe for all ages', trailing: Switch(value: false, activeColor: AppColors.primaryColor, onChanged: (value){})),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
