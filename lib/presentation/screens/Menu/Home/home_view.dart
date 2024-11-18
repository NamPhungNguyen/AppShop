import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/commom/widgets/Search/search_and_filter.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

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

  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false; // Trạng thái để kiểm tra đang tải thêm sản phẩm

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productPageStateProvider.notifier).loadInitialProducts(6);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        setState(() {
          _isLoadingMore = true;
        });
        ref
            .read(productPageStateProvider.notifier)
            .loadMoreProducts(6)
            .then((_) {
          setState(() {
            _isLoadingMore = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProvider); // Access the HomeState
    final productPageState = ref.watch(productPageStateProvider);

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
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.routeName);
            },
            icon: const Icon(Icons.notifications_outlined, size: 28),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(productPageStateProvider.notifier).loadInitialProducts(6),
        child: homeState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (data) {
            final categories = data['categories'] as Categories;
            final products = productPageState.when(
              loading: () => [],
              error: (error, stack) => [],
              data: (productPage) => productPage.content,
            );

            return CustomScrollView(
              controller: _scrollController, // Đảm bảo dùng ScrollController
              slivers: [
                /// Search Container
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceBtwItems / 2),
                    child: TSearchContainer(
                      text: 'Search your product',
                      onTap: () {
                        Navigator.pushNamed(
                            context, SearchAndFilterScreen.routeName);
                      },
                    ),
                  ),
                ),

                /// Categories from homeState
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
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
                                image: AssetsPathUtil.categories("jacket.png"),
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

                // Banner
                const SliverToBoxAdapter(child: BannerItem()),

                // Popular products (GridView)
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < products.length) {
                        final product = products[index];
                        return ProductCardVertical(product: product);
                      }
                      // Hiển thị loading khi trạng thái là AsyncLoading
                      else if (productPageState is AsyncLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // Không hiển thị gì nếu không tải thêm
                      else {
                        return const SizedBox.shrink();
                      }
                    },
                    childCount: products.length +
                        (productPageState is AsyncLoading
                            ? 1
                            : 0), // Thêm loading nếu cần
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSizes.gridViewSpacing,
                    mainAxisSpacing: AppSizes.gridViewSpacing,
                    childAspectRatio: 0.65,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
