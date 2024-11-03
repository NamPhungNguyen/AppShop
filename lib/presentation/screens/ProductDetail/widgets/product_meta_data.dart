import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/presentation/commom/widgets/texts/product_title_text.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../commom/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../commom/widgets/texts/product_price_text.dart';

class TProductMetaData extends StatelessWidget {
  final Product product;

  const TProductMetaData({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double discountPercentage = product.discount ?? 0.0;
    final double originalPrice = product.price;
    final double discountedPrice =
        originalPrice * (1 - discountPercentage / 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProductPriceText(
              price: (discountPercentage > 0 ? discountedPrice : originalPrice)
                  .toStringAsFixed(2),
              isLarge: true,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              '${originalPrice.toStringAsFixed(2)}₫',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough, color: AppColors.tertiaryText),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            TRoundedContainer(
              radius: AppSizes.sm,
              backgroundColor: Colors.yellow.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text('-${discountPercentage.toStringAsFixed(0)}%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.black)),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        // Title
        ProductTitleText(title: product.name),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Stock:'),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              '${product.stock}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
