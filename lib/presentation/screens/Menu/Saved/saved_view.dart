import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/commom/widgets/icons/circular_icon.dart';
import 'package:front_shop/presentation/commom/widgets/layouts/grid_layout.dart';
import 'package:front_shop/presentation/commom/widgets/products/product_card_vertical.dart';
import 'package:front_shop/presentation/screens/Notification/notification_view.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SavedView extends ConsumerWidget {
  static const String routeName = '/saved_view';

  SavedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProductsAsync = ref.watch(favoriteStateProvider);

    return Scaffold(
      appBar: TAppbar(
        title: Text("Saved items",
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.notification,
            onPressed: () =>
                Navigator.pushNamed(context, NotificationView.routeName),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Set the state to loading before fetching new data
          ref.read(favoriteStateProvider.notifier).fetchFavoriteProducts();
        },
        child: favoriteProductsAsync.when(
          data: (products) {
            return Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: products.isEmpty
                  ? const Center(child: Text("No saved items"))
                  : TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          ProductCardVertical(product: products[index]),
                    ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
