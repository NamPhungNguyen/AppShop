import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.selectedAddress,
    required this.address,
  });

  final bool selectedAddress;
  final ShippingAddress address;

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
                address.fullName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm / 2),
              Text(address.phoneNumber,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: AppSizes.sm / 2),
              Text(address.addressDetail, softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
