import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../styles/shadows.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/circular_icon.dart';
import '../images/round_image.dart';
import '../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailView.routeName);
      },
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(AppSizes.sm),
              backgroundColor: AppColors.light,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TRoundedImage(
                      imageUrl: AssetsPathUtil.categories("jacket.png"),
                      applyImageRadius: true,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: TRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.textSecondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),
      
                  /// favorite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems/2),
            /// details
            Padding(
              padding: EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Green Nike Air Shoes', smallLines: true),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(Iconsax.verify5, color: Colors.blue,size: AppSizes.iconXs)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "\$35.5", maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
