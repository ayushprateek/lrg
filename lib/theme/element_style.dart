import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_font.dart';
import 'package:miesp/theme/custom_theme.dart';
import 'package:flutter/material.dart';


TextStyle textLabelStyle() {
  return AppTheme.textTheme.titleSmall ?? const TextStyle();
}

TextStyle? textCaptionStyle() {
  return AppTheme.textTheme.bodyLarge
      ?.merge(const TextStyle(color: Colors.white));
}

TextStyle? textLabelStyleForPurpleColor(Color color) {
  return AppTheme.textTheme.bodyLarge?.merge(TextStyle(
    color: color,
  ));
}

TextStyle? textLabelBoldStyle(double size, Color color,
    {double letterSpacing = 0.3}) {
  return AppTheme.textTheme.titleSmall?.merge(TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: size,
      letterSpacing: letterSpacing,
      color: color));
}

TextStyle? textLabelStyleForEditText({double size = 16}) {
  return AppTheme.textTheme.headlineSmall?.merge(TextStyle(
    color: black,
    fontSize: size,
    fontWeight: FontWeight.w400,
  ));
}

TextStyle? textLabelBoldStyleWithCustomSize(
    double size,
    Color color, {
      double letterSpacing = 0,
      double height = 1.0,
      String fontFamily = CustomFont.customFont,
      FontWeight fontWeight = FontWeightSize.medium,
      TextDecoration? decoration,
    }) {
  return AppTheme.textTheme.titleSmall?.merge(
    // AppTheme.textTheme.bodyMedium
      TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing == 0 ? null : letterSpacing,
          fontSize: size,
          color: AppTheme.textTheme.bodyMedium?.color));
}

TextStyle? textLabelRegularStyle(double size, Color color,
    {double letterSpacing = 0.3,
      String fontFamily = CustomFont.customFont,
      FontWeight fontWeight = FontWeightSize.regular,
      TextDecoration? decoration}) {
  return AppTheme.textTheme.titleSmall?.merge(TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: size,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color));
}

TextStyle? textLabelStyleWithCustomSize(
    double size,
    Color color, {
      double letterSpacing = 0.0,
      double height = 1.0,
      String fontFamily = CustomFont.customFont,
      FontWeight fontWeight = FontWeightSize.medium,
    }) {
  return AppTheme.textTheme.titleSmall?.merge(TextStyle(
    fontSize: size,
    letterSpacing: letterSpacing,
    color: color,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
  ));
}

TextStyle? textLabelRegularStyleWithUnderLine(
    double size,
    Color color, {
      double letterSpacing = 0.0,
      double height = 1.0,
      String fontFamily = CustomFont.customFont,
      FontWeight fontWeight = FontWeightSize.medium,
    }) {
  return AppTheme.textTheme.titleSmall?.merge(TextStyle(
    fontSize: size,
    letterSpacing: letterSpacing,
    color: color,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: TextDecoration.underline,
  ));
}