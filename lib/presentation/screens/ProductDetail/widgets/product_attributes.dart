import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/presentation/commom/widgets/texts/product_price_text.dart';
import 'package:front_shop/presentation/commom/widgets/texts/product_title_text.dart';
import 'package:front_shop/presentation/commom/widgets/texts/section_heading.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../commom/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: AppColors.borderPrimary,
          child: Column(
            children: [
              Row(
                children: [
                  TSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Price', smallLines: true),
                          Text("\$25",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: AppSizes.spaceBtwItems),
                          const ProductPriceText(price: '20'),
                        ],
                      ),

                      ///stock
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Stock: ', smallLines: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const ProductTitleText(
                  title:
                      'This is the Description of the product and it can go up to max 4 lines')
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        /// attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
                title: 'Colors', ),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: 'Size',

            ),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'XL', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'L', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'M', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
