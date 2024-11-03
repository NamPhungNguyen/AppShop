import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class TProductQuantityWithAddRemoveButton extends StatefulWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  _TProductQuantityWithAddRemoveButtonState createState() =>
      _TProductQuantityWithAddRemoveButtonState();
}

class _TProductQuantityWithAddRemoveButtonState
    extends State<TProductQuantityWithAddRemoveButton> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          },
          child: const TCircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: Colors.black,
            backgroundColor: AppColors.light,
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),

        // Quantity display with border
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.tertiaryText),
            // Change this to your desired border color
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(width: AppSizes.spaceBtwItems),

        GestureDetector(
          onTap: () {
            setState(() {
              quantity++; // Increase quantity
            });
          },
          child: const TCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: Colors.white,
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
