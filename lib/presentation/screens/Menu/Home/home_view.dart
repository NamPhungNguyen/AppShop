import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Notification/notification_view.dart';
import 'package:front_shop/presentation/widgets/Search/input_search_primary.dart';
import 'package:front_shop/presentation/widgets/common/banner.dart';
import 'package:front_shop/presentation/widgets/common/hot_deals.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/typography.dart';
import '../../../widgets/common/categories_item.dart';
import '../../../widgets/common/popular_product.dart';

class HomeView extends StatelessWidget {
  static const String home_view = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
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
                SearchInputPrimary(
                  controller: searchController,
                  hintText: "FIND YOUR FAVORITE ITEMS",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CATEGORIES",
                      style: TypographyClass.Regular.copyWith(
                        color: AppColors.tertiaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TypographyClass.Regular.copyWith(
                          color: AppColors.tertiaryText,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CategoriesItemList(),
                ),
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
