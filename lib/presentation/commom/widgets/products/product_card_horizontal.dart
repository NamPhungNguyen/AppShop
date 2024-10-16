import 'package:flutter/material.dart';

import '../../styles/shadows.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.horizontalProductShadow]
      ),
    );
  }
}
