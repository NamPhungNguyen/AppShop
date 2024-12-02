import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Admin/menu/product_category_screen.dart';
import 'package:front_shop/presentation/screens/Admin/menu/product_detail_admin_screen.dart';

import '../../../../domain/models/product_page.dart';
import '../../../../main.dart';

class ProductManagementPage extends ConsumerStatefulWidget {
  static const String routeName = '/manage-product';

  const ProductManagementPage({Key? key}) : super(key: key);

  @override
  _ProductManagementPageState createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends ConsumerState<ProductManagementPage> {
  final int pageSize = 5;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    ref.read(productPageStateProvider.notifier).fetchInitialProducts(pageSize);
  }

  @override
  Widget build(BuildContext context) {
    final productPageState = ref.watch(productPageStateProvider);
    final categoriesState = ref.watch(categoryStateProvider);
    final searchState = ref.watch(productSearchStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Management"),
      ),
      body: productPageState.when(
        data: (productPage) {
          return Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
              // Category List (Horizontal ListView)
              categoriesState.when(
                data: (categories) {
                  return Container(
                    height: 120, // Set height for horizontal list
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.result.length,
                      // Only the actual categories
                      itemBuilder: (context, index) {
                        final category = categories.result[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductCategoryView(
                                  categoryId: category.categoryId.toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            // Space between categories
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(category.image),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category.name,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
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
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(product.imgProduct[0])),
                                title: Text(product.name),
                                subtitle: Text(product.brand),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Price: \$${product.price}"),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailAdminPage(
                                              product: product),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        )),

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
                }
              : null,
        ),
      ],
    );
  }
}
