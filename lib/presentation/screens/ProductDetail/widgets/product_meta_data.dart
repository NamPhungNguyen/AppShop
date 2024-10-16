import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/texts/product_title_text.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import '../../../commom/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../commom/widgets/texts/product_price_text.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: AppSizes.sm,
              backgroundColor: Colors.yellow.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: AppSizes.spaceBtwItems),
            ProductPriceText(price: '175', isLarge: true),
            // Price
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
        /// Title
        const ProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(children: [
          const ProductTitleText(title: 'Status'),
          const SizedBox(width: AppSizes.spaceBtwItems),
          Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
        ],),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

      ],
    );
  }
}