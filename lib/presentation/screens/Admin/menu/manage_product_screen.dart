import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Admin/menu/product_category_screen.dart';
import 'package:front_shop/presentation/screens/Admin/menu/product_detail_admin_screen.dart';

import '../../../../domain/models/product_page.dart';
import '../../../../main.dart';
import '../../../commom/widgets/custom_shapes/containers/search_container.dart';
import '../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import 'admin_search_producct.dart';

class ProductManagementPage extends ConsumerStatefulWidget {
  static const String routeName = '/manage-product';

  const ProductManagementPage({super.key});

  @override
  _ProductManagementPageState createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends ConsumerState<ProductManagementPage> {
  final int pageSize = 5;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref
          .read(productPageStateProvider.notifier)
          .fetchInitialProducts(pageSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productPageState = ref.watch(productPageStateProvider);
    final categoriesState = ref.watch(categoryStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Management"),
      ),
      body: productPageState.when(
        data: (productPage) {
          return Column(
            children: [
              /// Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TSearchContainer(
                  text: 'Search your product',
                  onTap: () => Navigator.pushNamed(
                    context,
                    AdminSearchAndFilterScreen.routeName,
                  ),
                ),
              ),

              /// Category List (Horizontal ListView)
              categoriesState.when(
                data: (categories) {
                  return Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.result.length,
                      itemBuilder: (context, index) {
                        final category = categories.result[index];
                        return GestureDetector(
                          child: Column(
                            children: [
                              TVerticalImageText(
                                image: category.image,
                                title: category.name,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProductCategoryView(
                                        categoryId:
                                            category.categoryId.toString(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),

              /// Product List
              Expanded(
                child: productPage.content.isEmpty
                    ? const Center(child: Text("No products found."))
                    : ListView.builder(
                        itemCount: productPage.content.length,
                        itemBuilder: (context, index) {
                          final product = productPage.content[index];
                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(product.imgProduct[0]),
                              ),
                              title: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(product.brand),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Price: ${product.price} đ"),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailAdminPage(
                                      product: product,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),

              /// Pagination Controls
              _buildPagination(productPage.totalPages, productPage),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
    );
  }

  Widget _buildPagination(int totalPages, ProductPage productPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: productPage.pageable.pageNumber > 0
              ? () {
                  ref.read(productPageStateProvider.notifier).loadProducts(
                      productPage.pageable.pageNumber - 1, pageSize);

                  ref.read(categoryStateProvider.notifier).fetchAllCategories();
                }
              : null,
        ),
        Text('${productPage.pageable.pageNumber + 1} of $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: productPage.pageable.pageNumber < totalPages - 1
              ? () {
                  ref.read(productPageStateProvider.notifier).loadProducts(
                      productPage.pageable.pageNumber + 1, pageSize);
                  ref.read(categoryStateProvider.notifier).fetchAllCategories();
                }
              : null,
        ),
      ],
    );
  }
}
