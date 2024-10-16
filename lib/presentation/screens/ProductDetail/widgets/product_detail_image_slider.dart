import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/assets_path_util.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/Appbar/appbar.dart';
import '../../../commom/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../commom/widgets/icons/circular_icon.dart';
import '../../../commom/widgets/images/round_image.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: AppColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding:
                const EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      AssetsPathUtil.categories("shoes.png"),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: AppSizes.defaultSpace,
              right: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => TRoundedImage(
                    imageUrl: AssetsPathUtil.categories("tank_top.png"),
                    width: 80,
                    height: 80,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(AppSizes.sm),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),

            /// Appbar Icon
            TAppbar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}