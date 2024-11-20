import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../main.dart';

final minPriceProvider = StateProvider<String?>((ref) => null);
final maxPriceProvider = StateProvider<String?>((ref) => null);

final searchQueryProvider = StateProvider<String?>((ref) => null);

class SearchAndFilterScreen extends ConsumerWidget {
  static const String routeName = '/search_and_filter_screen';

  const SearchAndFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productSearchStateProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final minPrice = ref.watch(minPriceProvider);
    final maxPrice = ref.watch(maxPriceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search & Filter')),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              onSearch: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),

          // Price Filter Inputs
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Min Price Input
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Min Price',
                      hintText: 'Enter min price',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ref.read(minPriceProvider.notifier).state = value;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // Only digits allowed
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Max Price Input
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Max Price',
                      hintText: 'Enter max price',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      ref.read(maxPriceProvider.notifier).state = value;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // Only digits allowed
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Button to trigger search and call the API
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final min = minPrice != null && minPrice.isNotEmpty
                    ? double.tryParse(minPrice.replaceAll(',', ''))
                    : null;
                final max = maxPrice != null && maxPrice.isNotEmpty
                    ? double.tryParse(maxPrice.replaceAll(',', ''))
                    : null;

                print('Search Query: $searchQuery, Min Price: $min, Max Price: $max');
                // If no search query, set it to null
                if (searchQuery == null || searchQuery.isEmpty) {
                  ref.read(searchQueryProvider.notifier).state = null;
                }

                // Call searchAndFilter with the provided query and price filters
                ref.read(productSearchStateProvider.notifier).searchAndFilter(
                      searchQuery, // Search query can be null
                      min, // Min price filter
                      max, // Max price filter
                    );
              },
              child: const Text('Search'),
            ),
          ),

          // Handle loading, data, and error states here
          Expanded(
            child: productState.when(
              data: (products) {
                // Display product list when data is available
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      leading: Image.network(product.imgProduct[0]),
                      title: Text(product.name),
                      subtitle: Text('${product.price.toStringAsFixed(0)} đ'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetailView.routeName,
                          arguments: product,
                        );
                      },
                    );
                  },
                );
              },
              loading: () {
                // Show a loading spinner if products are being fetched
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stack) {
                // Show an error message if there was an error fetching products
                return Center(child: Text('Error: $error'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends ConsumerWidget {
  final Function(String)
      onSearch; // Ensuring onSearch is a function that takes a string

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Iconsax.search_normal, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
              ),
              onChanged: onSearch, // Calls the onSearch callback
            ),
          ),
        ],
      ),
    );
  }
}
