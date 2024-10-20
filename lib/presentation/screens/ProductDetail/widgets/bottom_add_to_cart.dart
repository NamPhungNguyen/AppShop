import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/icons/circular_icon.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: Colors.grey,
                width: 40,
                height: 40,
                color: Colors.black,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AppSizes.spaceBtwItems),
              const TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
                color: Colors.black,
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Add to Cart"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColors.primaryColor,
              side: const BorderSide(color: AppColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
