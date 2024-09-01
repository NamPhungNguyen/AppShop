import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColors;
  final double borderRadius;

  const ButtonPrimary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // mau mac dinh cua button
    this.textColors = Colors.white,
    this.borderRadius = 8.0,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColors,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
    );
  }
}
