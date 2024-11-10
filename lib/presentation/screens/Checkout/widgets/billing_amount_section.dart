import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/texts/product_price_text.dart';
import 'package:front_shop/utils/constants/sizes.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order summary", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            const ProductPriceText(price: '25.000'),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),

        /// Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shop discount',
                style: Theme.of(context).textTheme.bodyMedium),
            const ProductPriceText(price: '6.000'),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),

        /// Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping', style: Theme.of(context).textTheme.bodyMedium),
            const ProductPriceText(price: '6.000'),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping discount',
                style: Theme.of(context).textTheme.bodyMedium),
            const ProductPriceText(price: '6.000'),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),

        /// order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: Theme.of(context).textTheme.bodyMedium),
            const ProductPriceText(price: '6.0'),
          ],
        ),
      ],
    );
  }
}
