import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/icons/circular_icon.dart';
import 'package:front_shop/presentation/commom/widgets/layouts/grid_layout.dart';
import 'package:front_shop/presentation/commom/widgets/products/product_card_vertical.dart';
import 'package:front_shop/presentation/screens/Notification/notification_view.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SavedView extends StatelessWidget {
  static const String routeName = '/saved_view';

  SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text("Saved items",
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.notification,
            onPressed: () =>
                Navigator.pushNamed(context, NotificationView.routeName),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 14, itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
