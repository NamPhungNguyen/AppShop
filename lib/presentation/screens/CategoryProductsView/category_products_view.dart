import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/commom/widgets/products/product_card_vertical.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import '../../../domain/models/category.dart';

import '../../../main.dart';

class CategoryProductsView extends ConsumerStatefulWidget {
  final Category category;

  const CategoryProductsView({super.key, required this.category});

  @override
  _CategoryProductsViewState createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends ConsumerState<CategoryProductsView> {
  @override
  void initState() {
    super.initState();
    // Delay the API call until after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productStateProvider.notifier).fetchAllProductByCategory(widget.category.categoryId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the product state to rebuild the UI when the data is available or loading
    final productsState = ref.watch(productStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Products in ${widget.category.name}'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: productsState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (products) {
            // Check if the product list is empty
            if (products.result.isEmpty) {
              return const Center(child: Text('No products available in this category.'));
            }

            // If there are products, display them in a two-column grid layout
            return GridView.builder(
              // Allow the GridView to expand and scroll
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(), // Enable scroll
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: AppSizes.gridViewSpacing,
                mainAxisSpacing: AppSizes.gridViewSpacing,
                childAspectRatio: 0.65, // Adjust to fit the card size
              ),
              itemCount: products.result.length,
              itemBuilder: (context, index) {
                final product = products.result[index];
                return ProductCardVertical(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}
