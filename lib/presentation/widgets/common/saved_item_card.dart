import 'package:flutter/material.dart';
import 'package:front_shop/utils/app_colors.dart';

class SavedItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const SavedItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(item['imageUrl'], fit: BoxFit.cover), // Corrected key from 'image' to 'imageUrl'
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${item['price']}', // Dollar sign is added here, not in the data
                  style: TextStyle(
                    color: AppColors.primaryTextAndButton,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}