import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commom/widgets/Appbar/appbar.dart';
import '../../../commom/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../commom/widgets/icons/circular_icon.dart';
import '../../../commom/widgets/images/round_image.dart';
import 'full_image_view.dart';

class TProductImageSlider extends StatefulWidget {
  final Product product;

  const TProductImageSlider({Key? key, required this.product})
      : super(key: key);

  @override
  _TProductImageSliderState createState() => _TProductImageSliderState();
}

class _TProductImageSliderState extends State<TProductImageSlider> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: AppColors.light,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullImageView(
                      imageUrls: widget.product.imgProduct,
                      initialIndex: _selectedImageIndex,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 400,
                child: Center(
                  child: Image.network(
                    widget.product.imgProduct.isNotEmpty
                        ? widget.product.imgProduct[_selectedImageIndex]
                        : 'placeholder_image_url',
                    fit: BoxFit.cover,
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
                  itemCount: widget.product.imgProduct.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSizes.spaceBtwItems),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = index; // Update selected index
                      });
                    },
                    child: TRoundedImage(
                      imageUrl: widget.product.imgProduct[index],
                      width: 80,
                      height: 80,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(AppSizes.xs),
                      border: Border.all(
                        color: _selectedImageIndex == index
                            ? AppColors.primaryColor
                            : Colors.grey, // Highlight selected image
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Appbar Icon
            const TAppbar(
              showBackArrow: true,
              actions: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
