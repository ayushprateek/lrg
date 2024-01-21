import 'package:flutter/material.dart';
import 'package:get/get.dart';

getErrorSnackBar(
  String text,
) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.red,
    message: text,
    duration: Duration(seconds: 2),
  ));
}

getSuccessSnackBar(
  String text,
) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.green,
    message: text,
    duration: Duration(seconds: 2),
  ));
}
