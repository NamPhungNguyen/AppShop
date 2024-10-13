import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: AppSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Colors.black, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}