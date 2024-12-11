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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(productStateProvider.notifier)
          .fetchAllProductByCategory(widget.category.categoryId.toString());
    });
  }

  Future<void> _refreshProducts() async {
    await ref
        .read(productStateProvider.notifier)
        .fetchAllProductByCategory(widget.category.categoryId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${widget.category.name}'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: productsState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
            data: (products) {
              if (products.result.isEmpty) {
                return const Center(
                  child: Text('No products available in this category.'),
                );
              }
              return CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products.result[index];
                        return ProductCardVertical(product: product);
                      },
                      childCount: products.result.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 24,
                      childAspectRatio: 0.65,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
