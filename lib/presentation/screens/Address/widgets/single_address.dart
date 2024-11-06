import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.selectedAddress,
    required this.address,
    required this.onSetDefault,
    required this.onEdit,
  });

  final bool selectedAddress;
  final ShippingAddress address;
  final VoidCallback onSetDefault;
  final VoidCallback onEdit;

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
            right: 10,
            top: 0,
            child: GestureDetector(
              onTap: onEdit, // Trigger the edit callback when tapped
              child: Text(
                'Edit',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              Text(
                address.fullName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm / 2),

              // Phone Number
              Text(
                address.phoneNumber,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.sm / 2),

              // Address Detail
              Text(
                address.addressDetail,
                softWrap: true,
              ),
              const SizedBox(height: AppSizes.sm / 2),

              // Province, City, and Country
              Text(
                '${address.city}, ${address.province}, ${address.country}',
                softWrap: true,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
            ],
          ),
          // Add the toggle switch or icon for setting default
          Positioned(
            right: 10,
            bottom: 10,
            child: IconButton(
              icon: Icon(
                selectedAddress
                    ? Icons.radio_button_on
                    : Icons.radio_button_off,
                color: selectedAddress ? AppColors.primaryColor : Colors.grey,
              ),
              onPressed: onSetDefault,
            ),
          ),
        ],
      ),
    );
  }
}
