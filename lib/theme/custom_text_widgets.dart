import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text getPoppinsText(
    {required text,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.center,
    int? maxLines,
    TextDecoration? decoration,
    Color color = Colors.black}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

TextSpan getPoppinsTextSpanHeading(
    {required text,
    double fontSize = 13.0,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.center,
    int? maxLines,
    Color color = Colors.black}) {
  text += '   :  ';
  return TextSpan(
    text: text,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    //style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  );
  // return Text(
  //   text,
  //   textAlign: textAlign,
  //   maxLines: maxLines,
  //   style: GoogleFonts.poppins(
  //     fontSize: fontSize,
  //     fontWeight: fontWeight,
  //     color: color,
  //   ),
  // );
}

TextSpan getPoppinsTextSpanDetails(
    {required text,
    double? fontSize = 12.0,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.center,
    int? maxLines,
    Color color = Colors.black}) {
  return TextSpan(
    text: text,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
    //style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  );
  // return Text(
  //   text,
  //   textAlign: textAlign,
  //   maxLines: maxLines,
  //   style: GoogleFonts.poppins(
  //     fontSize: fontSize,
  //     fontWeight: fontWeight,
  //     color: color,
  //   ),
  // );
}

Text getCustomTextRich({
  required String heading,
  required String value,
}) {
  return Text.rich(
    TextSpan(
      children: [
        getPoppinsTextSpanHeading(text: heading),
        getPoppinsTextSpanDetails(text: value),
      ],
    ),
  );
}

Text getHeadingText({
  required text,
  TextAlign textAlign = TextAlign.start,
  double fontSize = 13.0,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.bold,
  int? maxLines,
  TextDecoration? decoration,
}) {
  return getPoppinsText(
      text: text,
      fontWeight: fontWeight,
      fontSize: fontSize,
      textAlign: textAlign,
      color: color,
      decoration: decoration,
      maxLines: maxLines);
}

Text getSubHeadingText({
  required text,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
  double fontSize = 12,
  Color color = Colors.black,
}) {
  return getPoppinsText(
      text: text,
      fontSize: fontSize,
      textAlign: textAlign,
      color: color,
      maxLines: maxLines);
}
