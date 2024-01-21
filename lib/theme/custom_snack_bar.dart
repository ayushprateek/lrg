import 'package:miesp/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void snackBar(
    String text, {
    Color? backgroundColor,
    Color? textColor,
    int? duration,
  }) {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        text,
        style: TextStyle(color: textColor ?? appPrimary),
      ),
      backgroundColor: backgroundColor ?? appAccent,
      duration: Duration(milliseconds: duration ?? 1500),
    ));
  }

  static void errorSnackBar(String text) {
    snackBar(text, backgroundColor: Colors.red, textColor: Colors.white);
  }

  static void successSnackBar(String text) {
    snackBar(text, backgroundColor: Colors.green, textColor: Colors.white);
  }
}
