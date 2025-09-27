import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static OutlineInputBorder borderInput({Color color = AppColors.borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color),
    );
  }

  static ThemeData getTheme() => ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: Typography.blackRedmond.apply(
      bodyColor: AppColors.fontColor,
      fontFamily: 'Newsreader',
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppColors.fontSecondaryColor),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.all(9),
      fillColor: AppColors.fillTextInputColor,
      filled: true,
      enabledBorder: borderInput(),
      focusedErrorBorder: borderInput(),
      focusedBorder: borderInput(),
      errorBorder: borderInput(color: AppColors.errorColor),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(9),
        fillColor: AppColors.fillTextInputColor,
        filled: true,
        enabledBorder: borderInput(),
        focusedErrorBorder: borderInput(),
        focusedBorder: borderInput(),
        errorBorder: borderInput(color: AppColors.errorColor),
      ),
    ),
    fontFamily: 'Newsreader',
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.fontColor,
      titleTextStyle: TextStyle(
        color: AppColors.fontColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),

    primarySwatch: Colors.blue,
    primaryColor: AppColors.primaryColor,
  );
}
