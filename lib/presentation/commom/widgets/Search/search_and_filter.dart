import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';

import '../../../../main.dart';

final selectedPriceRangeProvider = StateProvider<String?>((ref) => null);
final searchQueryProvider = StateProvider<String?>((ref) => null);
final priceMinProvider = StateProvider<String?>((ref) => null);
final priceMaxProvider = StateProvider<String?>((ref) => null);
final sortOrderProvider = StateProvider<String>((ref) => 'Low to High');
final hasSearchedProvider = StateProvider<bool>((ref) => false);

class SearchAndFilterScreen extends ConsumerWidget {
  static const String routeName = '/search_and_filter_screen';

  const SearchAndFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productSearchStateProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final priceMin = double.tryParse(ref.watch(priceMinProvider) ?? '');
    final priceMax = double.tryParse(ref.watch(priceMaxProvider) ?? '');
    final sortOrder = ref.watch(sortOrderProvider);
    final hasSearched = ref.watch(hasSearchedProvider);

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

          // Filter Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filter by Price Range',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                /// Price Range Inputs (Min and Max Price)
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Min Price',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          ref.read(priceMinProvider.notifier).state = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Max Price',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          ref.read(priceMaxProvider.notifier).state = value;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Text(
                  'Sort by Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: sortOrder,
                  style: const TextStyle(color: Colors.black),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: const SizedBox(),
                  itemHeight: null,
                  items: ['Low to High', 'High to Low']
                      .map((String sortOrderOption) {
                    return DropdownMenuItem<String>(
                      value: sortOrderOption,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          sortOrderOption,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),

                  onChanged: (newValue) {
                    if (newValue != null) {
                      ref.read(sortOrderProvider.notifier).state = newValue;
                    }
                  },
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                )
              ],
            ),
          ),

          /// Button to trigger search
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                ref.read(hasSearchedProvider.notifier).state = true;
                final sortByPriceAsc = sortOrder == 'Low to High';
                ref.read(productSearchStateProvider.notifier).searchAndFilter(
                      searchQuery,
                      priceMin,
                      priceMax,
                      sortByPriceAsc,
                    );
              },
              child: const Text('Search'),
            ),
          ),

          ///show item after search
          Expanded(
            child: productState.when(
              data: (products) {
                if (hasSearched && products.isEmpty) {
                  return const Center(child: Text("No products found"));
                }
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
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stack) {
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
  final Function(String) onSearch;

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search...',
            ),
            onChanged: onSearch,
          ),
        ),
      ],
    );
  }
}
