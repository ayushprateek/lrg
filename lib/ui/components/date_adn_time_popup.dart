import 'package:flutter/material.dart';

import 'package:miesp/theme/custom_colors.dart';

Future<DateTime?> getDateAndTimePopup(
    {required BuildContext context, String? heading}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    helpText: heading,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          primarySwatch: Colors.grey,
          splashColor: Colors.black,
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.black),
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
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      helpText: heading,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: appPrimary,
              onSecondary: Colors.black,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const Text(""),
        );
      },
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      return DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }
  return null;
}
