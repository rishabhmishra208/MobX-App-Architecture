import 'package:flutter/material.dart';

import 'app_theme_export.dart';

class MyThemes {
  // --------- Dark Theme ---------

  static final darkTheme = ThemeData(
    useMaterial3: false,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ThemeConstants.appNavBarColor,
      selectedItemColor: ThemeConstants.whiteColor,
      unselectedItemColor: ThemeConstants.textSecondryColor,
      selectedIconTheme: IconThemeData(
        color: ThemeConstants.whiteColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: ThemeConstants.textSecondryColor,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 25,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w700,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w800,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      headlineSmall: TextStyle(
        fontSize: 21,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w600,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w700,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w600,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w500,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w800,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        letterSpacing: 0.02,
        decorationThickness: 1,
        fontWeight: FontWeight.w500,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        letterSpacing: 0.02,
        decorationThickness: 1,
        fontWeight: FontWeight.w400,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
    ),
  );

  // --------- Light Theme ---------

  static final lightTheme = ThemeData(
    useMaterial3: false,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ThemeConstants.appNavBarColor,
      selectedItemColor: ThemeConstants.whiteColor,
      unselectedItemColor: ThemeConstants.textSecondryColor,
      selectedIconTheme: IconThemeData(
        color: ThemeConstants.whiteColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: ThemeConstants.textSecondryColor,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 25,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w700,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w800,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      headlineSmall: TextStyle(
        fontSize: 21,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w600,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w700,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w600,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w500,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        letterSpacing: 0.02,
        fontWeight: FontWeight.w800,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        letterSpacing: 0.02,
        decorationThickness: 1,
        fontWeight: FontWeight.w500,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        letterSpacing: 0.02,
        decorationThickness: 1,
        fontWeight: FontWeight.w400,
        color: ThemeConstants.whiteColor,
        fontFamily: ThemeConstants.plusJakartaFont,
      ),
    ),
  );
}
