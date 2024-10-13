import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/typography.dart';

class SearchInputPrimary extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchInputPrimary({super.key, 
    required this.controller,
    this.hintText = "FIND YOUR LOCATION",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0x0ffbfbfc),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Shadow color
            spreadRadius: 1, // How much the shadow spreads
            blurRadius: 10, // How soft the shadow is
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TypographyClass.Regular.copyWith(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none,
            fillColor: const Color(0xFFFBFBFC),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFFBFBFC), width: 2.0),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primaryColor, width: 2.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
