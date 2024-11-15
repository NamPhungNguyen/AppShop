import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/comment.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/products/rating_indicator.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends ConsumerWidget {
  const UserReviewCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String formattedDate(String createdAt) {
      try {
        DateTime dateTime = DateTime.parse(createdAt);
        return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
      } catch (e) {
        return createdAt;
      }
    }

    final commentState = ref.watch(commentStateProvider(comment.productId.toString()).notifier);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(comment.profileImgUrl)),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Text(comment.fullName,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            PopupMenuButton<String>(
              onSelected: (String value) async {
                if (value == 'edit') {
                  print("Edit clicked");
                } else if (value == 'delete') {
                  // Call deleteComment when 'Delete' is clicked
                  await commentState.deleteComment(comment.commentId.toString());
                }
              },
              itemBuilder: (BuildContext context) {
                return [
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

        /// Review Rating and Date
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

        /// Review Content
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.spaceBtwItems / 2),
          child: Container(
            alignment: Alignment.centerLeft,
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

        // Display images only if available, with shrink behavior
        if (comment.imageUrls != null && comment.imageUrls!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
            child: Column(
              children: [
                Row(
                  children: comment.imageUrls!.map((imageUrl) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        else
          const SizedBox.shrink(),
        const SizedBox(height: AppSizes.spaceBtwItems),
      ],
    );
  }
}
