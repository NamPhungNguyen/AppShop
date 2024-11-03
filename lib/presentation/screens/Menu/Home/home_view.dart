import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../../domain/models/category.dart';
import '../../../../domain/models/product.dart';
import '../../../../main.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../commom/widgets/banner.dart';
import '../../../commom/widgets/custom_shapes/containers/search_container.dart';
import '../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../commom/widgets/layouts/grid_layout.dart';
import '../../../commom/widgets/products/product_card_vertical.dart';
import '../../../commom/widgets/texts/section_heading.dart';
import '../../Notification/notification_view.dart';

class HomeView extends ConsumerWidget {
  static const String routeName = '/home_view';

  const HomeView({super.key});

  Future<void> _refreshData(WidgetRef ref) async {
    await ref.read(homeStateProvider.notifier).loadData();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.textWhite,
        appBar: AppBar(
          backgroundColor: AppColors.textWhite,
          automaticallyImplyLeading: false,
          title: Text("Welcome Back!",
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationView.routeName);
              },
              icon: const Icon(Icons.notifications_outlined, size: 28),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => _refreshData(ref),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceBtwItems / 2),
            child: homeState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
              data: (data) {
                final categories = data['categories'] as Categories;
                final products = data['products'] as Products;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: AppSizes.spaceBtwSections),
                      TSearchContainer(
                          text: 'Search your product', onTap: () {}),
                      const SizedBox(height: AppSizes.spaceBtwSections),

                      // Categories
                      Column(
                        children: [
                          const TSectionHeading(
                              title: "Popular Categories",
                              showActionButton: false),
                          const SizedBox(height: AppSizes.spaceBtwItems),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemCount: categories.result.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                final category = categories.result[index];
                                return TVerticalImageText(
                                  image:
                                      AssetsPathUtil.categories("jacket.png"),
                                  title: category.name,
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      // Banner
                      const BannerItem(),

                      // Popular products
                      const SizedBox(height: AppSizes.spaceBtwSections),
                      TGridLayout(
                        itemCount: products.result.length,
                        itemBuilder: (_, index) {
                          final product = products.result[index];
                          return ProductCardVertical(product: product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
