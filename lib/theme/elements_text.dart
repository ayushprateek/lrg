import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_theme.dart';
import 'package:miesp/theme/element_style.dart';
import 'package:flutter/material.dart';

Text textTitle({
  required String text,
  double size = 16,
  Color color = Colors.black,
  double letterSpacing = 0,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(text,
      style: textLabelBoldStyleWithCustomSize(
        size,
        color,
        letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
        fontWeight: fontWeight,
      ));
}

Text textLabelBoldWithCustomSize(
    {required String text,
    double size = 16,
    Color color = Colors.black,
    double letterSpacing = 0,
    FontWeight fontWeight = FontWeight.bold,
    TextDecoration? decoration}) {
  return Text(text,
      style: textLabelBoldStyleWithCustomSize(size, color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
          decoration: decoration,
          fontWeight: fontWeight));
}

Text textLabelSemiBoldWithCustomSize({
  required String text,
  double size = 16,
  Color color = Colors.black,
  double letterSpacing = 0,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(text,
      style: textLabelBoldStyleWithCustomSize(size, color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
          fontWeight: fontWeight));
}

Text textLabelMediumWithCustomSize({
  required String text,
  double size = 16,
  Color color = Colors.black,
  double letterSpacing = 0,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(text,
      style: textLabelBoldStyleWithCustomSize(size, color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
          fontWeight: fontWeight));
}

Text textLabelRegularWithCustomSize({
  required String text,
  String suffix = "",
  double size = 16,
  Color color = Colors.black,
  double letterSpacing = 0,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text.rich(TextSpan(children: [
    TextSpan(
        text: text,
        style: textLabelBoldStyleWithCustomSize(size, color,
            letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
            fontWeight: fontWeight)),
    TextSpan(text: suffix, style: const TextStyle(color: Colors.red)),
  ]));
  // return Text(text,
  //     style: textLabelBoldStyleWithCustomSize(size, color,
  //         letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
  //         fontWeight: fontWeight,
  //         fontFamily: fontFamily));
}

Text textLabelDotted({
  required String text,
  double size = 16,
  Color color = Colors.white,
  int maxLine = 1,
  double letterSpacing = 0,
  decoration,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      softWrap: false,
      style: textLabelRegularStyle(size, color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
          decoration: decoration));
}

Text textLabelLightWithCustomSize({
  required String text,
  double size = 16,
  Color color = Colors.black,
  double letterSpacing = 0,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(text,
      textAlign: textAlign,
      style: textLabelBoldStyleWithCustomSize(
        size,
        color,
        letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
      ));
}

textLabelWithUnderLine(
    {required String text,
    double size = 16,
    double letterSpacing = 0,
    Color color = Colors.black}) {
  return Text(text,
      style: textLabelRegularStyleWithUnderLine(
        size,
        color,
        letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
      ));
}

Text textLabelCenterAligned(
    {required String text,
    double size = 16,
    double letterSpacing = 0,
    Color color = black}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: textLabelRegularStyle(
        size,
        color,
        letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
      ));
}

InputDecoration textFieldDecoration({IconData? icon, String? text}) {
  return InputDecoration(
    labelStyle:
        AppTheme.textTheme.headline5?.merge(const TextStyle(color: appPrimary)),
    labelText: text,
    prefixIcon: Icon(icon, color: Colors.black),
    enabledBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppTheme.createLightTheme().dividerColor)),
    focusedBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppTheme.createLightTheme().dividerColor)),
    errorBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppTheme.createLightTheme().dividerColor)),
  );
}
