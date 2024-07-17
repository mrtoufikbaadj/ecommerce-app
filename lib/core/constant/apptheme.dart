import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Cairo",
      fontSize: 25,
    ),
    backgroundColor: Colors.grey[50],
    centerTitle: true,
    elevation: 0,
  ),
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.black, fontSize: 20),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.black, fontSize: 27),
    bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
    bodySmall: TextStyle(height: 2, color: AppColor.grey, fontSize: 12),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.black, fontSize: 20),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.black, fontSize: 27),
    bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
    bodySmall: TextStyle(height: 2, color: AppColor.grey, fontSize: 12),
  ),
  primarySwatch: Colors.blue,
);
