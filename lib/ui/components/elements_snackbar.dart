import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miesp/theme/custom_colors.dart';

getErrorSnackBar(
  String text,
) {
  print(text);
  text=text.replaceAll('\"', '');

  Get.showSnackbar(
    GetSnackBar(
      messageText: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ),
  );
}

getSuccessSnackBar(
  String text,
) {

  Get.showSnackbar(
    GetSnackBar(
      messageText: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ),
  );
}
