import 'package:e_book/Models/Colors.dart';
import 'package:flutter/material.dart';

var lightteme = ThemeData(
  useMaterial3: true,

  brightness: Brightness.light,

  //Color themes
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primarycolor,
      onPrimary: backgroundcolor,
      secondary: secondarycolor,
      onSecondary: backgroundcolor,
      error: Colors.red,
      onError: backgroundcolor,
      background: backgroundcolor,
      onBackground: fontcolor,
      surface: backgroundcolor,
      onSurface: fontcolor),

  // text themes
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'Poppins', fontSize: 30, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(
        fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(
        fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
);
