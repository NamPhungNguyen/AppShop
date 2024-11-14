import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/comment.dart';
import 'package:front_shop/presentation/commom/widgets/products/rating_indicator.dart';
import 'package:front_shop/utils/assets_path_util.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    String formattedDate(String createdAt) {
      try {
        DateTime dateTime = DateTime.parse(createdAt);
        return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
      } catch (e) {
        return createdAt;
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage:  comment.imageUrls.isNotEmpty
                    ? NetworkImage(comment.profileImgUrl)  // Use the first image from the list
                    : const AssetImage('assets/profile.png') as ImageProvider),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Text(comment.fullName, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'edit') {
                  print("Edit clicked");
                } else if (value == 'delete') {
                  print("Delete clicked");
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8),
                        Text("Edit"),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 8),
                        Text("Delete"),
                      ],
                    ),
                  ),
                ];
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        /// Review
        Row(
          children: [
            TRatingBarIndicator(rating: comment.rating.toDouble()),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              formattedDate(comment.createdAt),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.spaceBtwItems / 2),
          child: Container(
            alignment: Alignment.centerLeft,
            // Ensures the text is aligned to the left
            child: ReadMoreText(
              comment.content,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: ' show less',
              trimCollapsedText: ' show more',
              moreStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              lessStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black, // Set your text color
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
      ],
    );
  }
}
