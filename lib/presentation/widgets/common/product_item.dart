import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String discount;
  final bool isSaved;
  final int index;
  final VoidCallback onPress;

  const ProductItem(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.discount,
      required this.isSaved,
      required this.index,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      color: AppColors.primaryTextAndButton,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    discount,
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onPress,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isSaved ? Icons.favorite : Icons.favorite_border_outlined,
                color: isSaved ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
