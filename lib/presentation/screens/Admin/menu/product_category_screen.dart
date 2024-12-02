import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/product.dart';
import '../../../../main.dart';

class ProductCategoryView extends ConsumerWidget {
  final String categoryId;

  const ProductCategoryView({Key? key, required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);

    ref
        .read(productStateProvider.notifier)
        .fetchAllProductByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products by Category"),
      ),
      body: productState.when(
        data: (products) => _buildProductList(products.result),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    // Check if the product list is empty
    if (products.isEmpty) {
      return const Center(
        child: Text("No products available in this category."),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product.imgProduct[0]),
            ),
            title: Text(product.name),
            subtitle: Text(product.brand),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price: \$${product.price}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
