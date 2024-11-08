import 'package:flutter/material.dart';

class GradientLine extends StatelessWidget {
  const GradientLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4, // Độ dày của đường
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.cyan,
          ],
          stops: [0.3, 0.7],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
