import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? AppColors.primaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor:
          selectedAddress ? Colors.transparent : AppColors.borderPrimary,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? Colors.black : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nguyen Phung Nam",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm / 2),
              const Text('+123 456 789',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: AppSizes.sm / 2),
              const Text(
                  "91 P.Luong Dinh Cua, số nhà 4(nhà may quần áo), nghách 30, ngõ 91 phố lương định của, phương mai, đống đa, hà nội",
                  softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
