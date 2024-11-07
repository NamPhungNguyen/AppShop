import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../images/round_image.dart';
import '../../texts/product_title_text.dart';

class TCartItem extends ConsumerWidget {
  const TCartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.color,
    required this.size,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String imageUrl;
  final String title;
  final String color;
  final String size;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: imageUrl,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: ProductTitleText(title: title, maxLines: 1)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: color,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: size,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Quantity Control
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: onDecrement,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                '$quantity',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
