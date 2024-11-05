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
  });

  final String imageUrl;
  final String title;
  final String color;
  final String size;

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
              Flexible(
                child: ProductTitleText(
                    title: title, maxLines: 1), // Use the passed title
              ),
              Text.rich(TextSpan(children: [
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
              ])),
            ],
          ),
        ),
      ],
    );
  }
}
