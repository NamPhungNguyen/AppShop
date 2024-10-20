import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/app_colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: 4.5,
      itemSize: 20,
      unratedColor: Colors.grey,
      itemBuilder: (_, __) =>
          Icon(Iconsax.star1, color: AppColors.primaryColor),
    );
  }
}