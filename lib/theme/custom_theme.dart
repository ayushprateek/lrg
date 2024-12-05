import 'package:miesp/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static load({bool flagDarkTheme = false}) {}

  static ThemeData createDarkTheme() {
    return ThemeData(
        textTheme: textTheme.apply(
          fontFamily: 'OpensansHebrew',
          bodyColor: white,
          displayColor: white,
        ),
        shadowColor: Colors.black,
        brightness: Brightness.dark,
        canvasColor: Colors.black,
        // backgroundColor: Colors.black,
        dialogBackgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
        primaryColorLight: ThemeColors.primary[300],
        primaryColorDark: ThemeColors.primary[700],
        secondaryHeaderColor: ThemeColors.darkGrey[700],
        indicatorColor: appPrimary,
        // toggleableActiveColor: appPrimary,
        // errorColor: red,
        hintColor: appPrimary,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerColor: ThemeColors.grey[400],
        disabledColor: ThemeColors.darkGrey[300],
        // bottomAppBarColor: ThemeColors.darkGrey[800],
        cardColor: ThemeColors.darkGrey[800],
        focusColor: Colors.white.withOpacity(0.12),
        hoverColor: Colors.white.withOpacity(0.04),
        // selectedRowColor: ThemeColors.darkGrey[100],
        unselectedWidgetColor: Colors.white70,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(appPrimary),
              shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: ThemeColors.primary)
            .copyWith(secondary: appPrimary));
  }

  static ThemeData createLightTheme() {
    return ThemeData(
        textTheme: textTheme.apply(
          fontFamily: 'OpensansHebrew',
          bodyColor: black,
          displayColor: black,
        ),
        shadowColor: Colors.white,
        brightness: Brightness.light,
        canvasColor: Colors.white,
        appBarTheme:const  AppBarTheme(
            backgroundColor: appPrimary,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600
            )
        ),
        // backgroundColor: ThemeColors.primary,
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: ThemeColors.primary,
        primaryColorLight: ThemeColors.primary[300],
        primaryColorDark: ThemeColors.primary[700],
        secondaryHeaderColor: ThemeColors.primary[50],
        indicatorColor: appPrimary,
        // toggleableActiveColor: black,
        // errorColor: ThemeColors.hint,
        hintColor: ThemeColors.hint,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerColor: ThemeColors.lightGrey[200],
        disabledColor: ThemeColors.lightGrey[500],
        // bottomAppBarColor: Colors.white,
        cardColor: Colors.white,
        focusColor: Colors.black.withOpacity(0.12),
        hoverColor: Colors.black.withOpacity(0.04),
        // selectedRowColor: ThemeColors.grey[100],
        unselectedWidgetColor: black,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(black),
              shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: ThemeColors.primary)
            .copyWith(secondary: appPrimary));
  }

  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 96.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    displayMedium: TextStyle(
        fontSize: 60.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    displaySmall: TextStyle(
        fontSize: 48.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headlineLarge: TextStyle(
        fontSize: 34.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    headlineMedium: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headlineSmall: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    titleSmall: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodyLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    bodyMedium: TextStyle(
        fontSize: 18.0,
        fontFamily: 'OpensansHebrew',
        fontWeight: FontWeight.w400,
        letterSpacing: 1.0),
    bodySmall: TextStyle(
        fontSize: 12.0,
        fontFamily: 'OpensansHebrew',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    labelLarge: TextStyle(
        fontSize: 10.0,
        fontFamily: 'OpensansHebrew',
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );
}

class ThemeColors {
  ThemeColors._();

  static const MaterialColor primary = MaterialColor(
    0xFF1864AD,
    <int, Color>{
      50: Color(0xFFE3ECF5),
      100: Color(0xFFBAD1E6),
      200: Color(0xFF8CB2D6),
      300: Color(0xFF5D93C6),
      400: Color(0xFF3B7BB9),
      500: Color(0xFF1864AD),
      600: Color(0xFF155CA6),
      700: Color(0xFF11529C),
      800: Color(0xFF0E4893),
      900: Color(0xFF083683),
    },
  );

  static const MaterialColor accent = MaterialColor(
    0xFF7CC242,
    <int, Color>{
      50: Color(0xFFEFF8E8),
      100: Color(0xFFD8EDC6),
      200: Color(0xFFBEE1A1),
      300: Color(0xFFA3D47B),
      400: Color(0xFF90CB5E),
      500: Color(0xFF7CC242),
      600: Color(0xFF74BC3C),
      700: Color(0xFF69B433),
      800: Color(0xFF5FAC2B),
      900: Color(0xFF4C9F1D),
    },
  );

  static const MaterialColor hint = MaterialColor(
    0xFFFF9E12,
    <int, Color>{
      50: Color(0xFFFFF3E3),
      100: Color(0xFFFFE2B8),
      200: Color(0xFFFFCF89),
      300: Color(0xFFFFBB59),
      400: Color(0xFFFFAD36),
      500: Color(0xFFFF9E12),
      600: Color(0xFFFF9610),
      700: Color(0xFFFF8C0D),
      800: Color(0xFFFF820A),
      900: Color(0xFFFF7005),
    },
  );

  static const MaterialColor darkGrey = MaterialColor(
    0xFF323232,
    <int, Color>{
      50: Color(0xFFE6E6E6),
      100: Color(0xFFC2C2C2),
      200: Color(0xFF999999),
      300: Color(0xFF707070),
      400: Color(0xFF515151),
      500: Color(0xFF323232),
      600: Color(0xFF2D2D2D),
      700: Color(0xFF262626),
      800: Color(0xFF1F1F1F),
      900: Color(0xFF131313),
    },
  );

  static const MaterialColor grey = MaterialColor(
    0xFF646464,
    <int, Color>{
      50: Color(0xFFECECEC),
      100: Color(0xFFD1D1D1),
      200: Color(0xFFB2B2B2),
      300: Color(0xFF939393),
      400: Color(0xFF7B7B7B),
      500: Color(0xFF646464),
      600: Color(0xFF5C5C5C),
      700: Color(0xFF525252),
      800: Color(0xFF484848),
      900: Color(0xFF363636),
    },
  );

  static const MaterialColor lightGrey = MaterialColor(
    0xFF969696,
    <int, Color>{
      50: Color(0xFFF2F2F2),
      100: Color(0xFFE0E0E0),
      200: Color(0xFFCBCBCB),
      300: Color(0xFFB6B6B6),
      400: Color(0xFFA6A6A6),
      500: Color(0xFF969696),
      600: Color(0xFF8E8E8E),
      700: Color(0xFF838383),
      800: Color(0xFF797979),
      900: Color(0xFF686868),
    },
  );
}

