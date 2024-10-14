import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Notification/notification_view.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:front_shop/utils/typography.dart';
import '../../../commom/custom_shapes/containers/search_container.dart';
import '../../../commom/widgets/banner.dart';
import '../../../commom/widgets/hot_deals.dart';
import '../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../commom/widgets/popular_product.dart';
import '../../../commom/widgets/texts/section_heading.dart';

class HomeView extends StatelessWidget {
  static const String home_view = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.textWhite,
        appBar: AppBar(
          backgroundColor: AppColors.textWhite,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LOCATION",
                style: TypographyClass.Regular.copyWith(
                    fontSize: 18, color: AppColors.tertiaryText),
              ),
              const SizedBox(height: 6),
              const Text(
                "Dhaka,Bangladesh",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationView.notification);
              },
              icon: const Icon(Icons.notifications_outlined, size: 28),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                /// search bar
                SizedBox(height: AppSizes.spaceBtwSections),
                TSearchContainer(text: 'Search your product'),
                SizedBox(height: AppSizes.spaceBtwSections),

                /// categories
                Column(
                  children: [
                    TSectionHeading(
                        title: "Popular Categories", showActionButton: false),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return TVerticalImageText(image: AssetsPathUtil.user("profile.png"), title: "Shoes", onTap: (){});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const BannerItem(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: HotDeals(),
                ),
                const PopularProductItem()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

