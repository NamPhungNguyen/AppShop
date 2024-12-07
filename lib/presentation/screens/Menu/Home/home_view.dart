import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/commom/widgets/Search/search_and_filter.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../../domain/domain_modules.dart';
import '../../../../domain/models/category.dart';
import '../../../../main.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../commom/widgets/banner.dart';
import '../../../commom/widgets/custom_shapes/containers/search_container.dart';
import '../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../commom/widgets/products/product_card_vertical.dart';
import '../../../commom/widgets/texts/section_heading.dart';
import '../../CategoryProductsView/category_products_view.dart';
import '../../Notification/notification_view.dart';

class HomeView extends ConsumerStatefulWidget {
  static const String routeName = '/home_view';

  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();

  int currentPage = 0;
  int totalPages = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll && !isLoading && currentPage < totalPages - 1) {
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        ref.read(productPageStateProvider.notifier).loadMoreProducts(4).then((_) {
          setState(() {
            isLoading = false;
            currentPage++;
          });
        });
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProvider);
    final productPageState = ref.watch(productPageStateProvider);

    if (productPageState is AsyncLoading) {
      Future.delayed(Duration.zero, () {
        ref.read(productPageStateProvider.notifier).fetchInitialProducts(4);
      });
    }

    return Scaffold(
      backgroundColor: AppColors.textWhite,
      appBar: AppBar(
        backgroundColor: AppColors.textWhite,
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome Back!",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, NotificationView.routeName),
            icon: const Icon(Icons.notifications_outlined, size: 28),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            currentPage = 0;
            totalPages = 0;
            isLoading = false;
          });
          await ref.read(productPageStateProvider.notifier).fetchInitialProducts(4);
          await ref.read(userStateProvider.notifier).getMyInfo();
        },
        child: homeState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (data) {
            final categories = data['categories'] as Categories;
            final products = productPageState.maybeWhen(
              data: (productPage) {
                totalPages = productPage.totalPages;
                return productPage.content;
              },
              orElse: () => [],
            );

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Search Box
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceBtwItems / 2),
                    child: TSearchContainer(
                      text: 'Search your product',
                      onTap: () => Navigator.pushNamed(
                        context,
                        SearchAndFilterScreen.routeName,
                      ),
                    ),
                  ),
                ),
                // Categories Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TSectionHeading(
                          title: "Categories",
                          showActionButton: false,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: categories.result.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              final category = categories.result[index];
                              return TVerticalImageText(
                                image:category.image,
                                title: category.name,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CategoryProductsView(
                                          category: category),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Banner Section
                const SliverToBoxAdapter(child: BannerItem()),


                /// Products Grid
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final product = products[index];
                      return ProductCardVertical(product: product);
                    },
                    childCount: products.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSizes.gridViewSpacing,
                    mainAxisSpacing: AppSizes.gridViewSpacing,
                    childAspectRatio: 0.65,
                  ),
                ),

                /// Loading More Indicator
                if (isLoading)
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
