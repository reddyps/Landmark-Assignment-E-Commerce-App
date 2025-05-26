import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/theme/button_theme.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/theme/input_decoration_theme.dart';
import 'checkbox_themedata.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: primaryMaterialColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
}
