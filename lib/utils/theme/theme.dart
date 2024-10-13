import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/theme/custom_themes/appbar_theme.dart';
import 'package:front_shop/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:front_shop/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:front_shop/utils/theme/custom_themes/chip_theme.dart';
import 'package:front_shop/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:front_shop/utils/theme/custom_themes/text_theme.dart';
import 'custom_themes/text_field_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3:true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme

  );
}