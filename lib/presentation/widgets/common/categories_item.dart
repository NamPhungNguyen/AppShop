import 'package:flutter/material.dart';
import 'package:front_shop/utils/typography.dart';

class CategoriesItemList extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"text": "FASHION", "icon": Icons.checkroom},
    {"text": "FITNESS", "icon": Icons.fitness_center},
    {"text": "LIVING", "icon": Icons.living},
    {"text": "GAMES", "icon": Icons.games},
    {"text": "STATIONARY", "icon": Icons.book},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: CategoryIcon(
              text: categories[index]["text"],
              icon: categories[index]["icon"],
            ),
          );
        },
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const CategoryIcon({
    Key? key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color(0xFFEDEDFF),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Icon(
              icon,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TypographyClass.Regular.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8
            ),
          ),
        ],
      ),
    );
  }
}
