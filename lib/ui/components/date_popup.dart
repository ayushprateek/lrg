import 'package:miesp/common/get_formatted_date.dart';
import 'package:miesp/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> getDatePopup({
  DateTime? initialDate,
  required Function(String pickedDate) onDatePicked,
}) async {
  // String? code =
  //     LocalStorage.getInstance()?.localStorage?.getString(keyAppLocaleCode);
  // Locale locale = CustomLocale.toLocale('en_US');

  DateTime? picked = await showDatePicker(
    context: Get.context!,
    // locale: Locale(locale.languageCode, locale.countryCode),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          primarySwatch: Colors.grey,
          splashColor: Colors.black,
          textTheme: const TextTheme(
            // subtitle1: TextStyle(color: Colors.black),
            // button: TextStyle(color: Colors.black),
          ),
          // accentColor: Colors.black,
          colorScheme: ColorScheme.light(
              primary: appPrimary,
              // primaryVariant: Colors.black,
              // secondaryVariant: Colors.black,
              onSecondary: Colors.black,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
              secondary: Colors.black),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(""),
      );
    },
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1960),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    onDatePicked(getFormattedDate(picked));
  } else {
    return;
  }
}
