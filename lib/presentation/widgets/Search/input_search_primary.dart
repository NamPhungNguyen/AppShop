import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/typography.dart';

class SearchInputPrimary extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchInputPrimary({
    Key? key,
    required this.controller,
    this.hintText = "FIND YOUR LOCATION",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFBFBFC),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Shadow color
            spreadRadius: 1, // How much the shadow spreads
            blurRadius: 10, // How soft the shadow is
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TypographyClass.Regular.copyWith(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none,
            fillColor: Color(0xFFFBFBFC),
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFBFBFC), width: 2.0),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primaryTextAndButton, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
