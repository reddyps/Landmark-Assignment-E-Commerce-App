
import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/styles/app_typography.dart';
import 'package:landmark_assignment/core/util/value/colors.dart';

ThemeData get appThemeData {
  ThemeData themeData = ThemeData.light();
  themeData = themeData.copyWith(
    colorScheme:
    themeData.colorScheme.copyWith(primary: AppColors.primaryBlue),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryBlue,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.clearBlue,
      selectionHandleColor: AppColors.clearBlue,
      selectionColor: AppColors.whiteFour,
    ),
    // appBarTheme: themeData.appBarTheme.copyWith(
    //   elevation: 1,
    //   centerTitle: false,
    //   color: Colors.white,
    // ),
    tabBarTheme: themeData.tabBarTheme.copyWith(
      // labelStyle: const TextStyle(
      //   fontSize: 14,
      //   color: AppColors.cyprus,
      //   fontFamily: "PoppinsRegular",
      //   fontWeight: FontWeight.w600,
      // ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: EdgeInsets.zero,
      // unselectedLabelColor: AppColors.blackTwo,
      // labelColor: AppColors.cyprus,
      // unselectedLabelStyle: const TextStyle(
      //     fontSize: 14,
      //     color: AppColors.blackTwo,
      //     fontFamily: "PoppinsRegular",
      //     fontWeight: FontWeight.w400),
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   hintStyle: TextStyle(
    //     fontFamily: "PoppinsRegular",
    //     color: AppColors.gray,
    //     fontSize: 14,
    //     fontWeight: FontWeight.w400,
    //     fontStyle: FontStyle.normal,
    //   ),
    // enabledBorder: OutlineInputBorder(
    //     borderSide:
    //         const BorderSide(color: AppColors.veryLightGray, width: 1),
    //     borderRadius: BorderRadius.circular(8)),
    // focusedBorder: OutlineInputBorder(
    //     borderSide:
    //         const BorderSide(color: AppColors.veryLightGray, width: 1),
    //     borderRadius: BorderRadius.circular(8)),
    // errorBorder: OutlineInputBorder(
    //     borderSide:
    //         const BorderSide(color: AppColors.veryLightGray, width: 1),
    //     borderRadius: BorderRadius.circular(8)),
    // focusedErrorBorder: OutlineInputBorder(
    //     borderSide:
    //         const BorderSide(color: AppColors.veryLightGray, width: 1),
    //     borderRadius: BorderRadius.circular(8)),
    //   errorStyle: TextStyle(
    //     color: AppColors.black,
    //   ),
    //   labelStyle: TextStyle(
    //     color: AppColors.warmGrey,
    //     fontFamily: "PoppinsRegular",
    //     fontSize: 14,
    //     fontWeight: FontWeight.w400,
    //   ),
    // ),
    // primaryTextTheme: themeData.primaryTextTheme.apply(
    //     fontFamily: "PoppinsRegular",
    //     bodyColor: AppColors.blackTwo,
    //     displayColor: AppColors.blackTwo),
    iconTheme: const IconThemeData(
      color: AppColors.clearBlue,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textTheme: ButtonTextTheme.normal,
    ),
    // typography: appMaterialTypography,
    textTheme: appMaterialWhiteTheme,
  );
  return themeData;
}
