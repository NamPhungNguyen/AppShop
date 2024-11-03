import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../main.dart';
import '../../styles/shadows.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/circular_icon.dart';
import '../images/round_image.dart';
import '../texts/product_title_text.dart';

class ProductCardVertical extends ConsumerWidget {
  final Product product;

  const ProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProductsAsync = ref.watch(favoriteStateProvider);

    final isFavorite = favoriteProductsAsync.when(
      data: (favoriteProducts) =>
          favoriteProducts.contains(product),
      loading: () => false,
      error: (error, stack) => false,
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailView.routeName,
          arguments: product,
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: AppColors.light,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TRoundedImage(
                      imageUrl: product.imgProduct.isNotEmpty
                          ? product.imgProduct[0]
                          : AssetsPathUtil.categories("placeholder.png"),
                      fit: BoxFit.cover,
                      applyImageRadius: true,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: TRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.textSecondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '-${product.discount}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),

                  // Favorite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: isFavorite
                          ? Iconsax.heart5
                          : Iconsax.heart, // Update based on favorite status
                      color: isFavorite ? Colors.red : Colors.grey,
                      onPressed: () {
                        if (isFavorite) {
                          ref
                              .read(favoriteStateProvider.notifier)
                              .removeProductFromFavorites(
                              product.productId.toString());
                        } else {
                          ref
                              .read(favoriteStateProvider.notifier)
                              .addProductToFavorites(product);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.name, smallLines: true),
                  Row(
                    children: [
                      Text(
                        product.brand,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: Colors.blue,
                        size: AppSizes.iconXs,
                      ),
                    ],
                  ),

                  // Single star with rating number
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.amber, size: AppSizes.iconSm),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "${product.discount != null ? (product.price - (product.price * (product.discount! / 100))).toStringAsFixed(2) : product.price.toStringAsFixed(2)}đ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Text(
                        "${product.price.toStringAsFixed(2)}đ",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
