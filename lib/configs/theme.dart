import 'package:flutter/material.dart';

import 'colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    fillColor: containerColor,
    filled: true,
    hintStyle: const TextStyle(
      fontSize: 15,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      color: lableColor,
    ),
  ),

  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: bgColor,
    onSurface: fontColor,
    primaryContainer: containerColor,
    onPrimaryContainer: lableColor,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w600,
    ),

    bodyMedium: TextStyle(
      fontSize: 15,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500,
    ),

    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
    ),

    labelMedium: TextStyle(
      fontSize: 15,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      color: lableColor,
    ),
  ),
);
