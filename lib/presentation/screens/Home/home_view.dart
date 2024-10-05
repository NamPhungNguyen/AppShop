import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/Search/input_search_primary.dart';
import 'package:front_shop/utils/app_colors.dart';
import 'package:front_shop/utils/typography.dart';

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
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LOCATION",
                style: TypographyClass.Regular.copyWith(
                  fontSize: 18,
                  color: AppColors.tertiaryText,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Dhaka,Bangladesh",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                size: 34,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
