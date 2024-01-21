import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';

bool isNumeric(String result) {
  try {
    double.parse(result);
    return true;
  } catch (e) {
    return false;
  }
}

String getNumberWithComma(double number) {
  // String replacedNumber = number.replaceAllMapped(
  //     RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  //
  // return replacedNumber;
  final indianNumberFormat = NumberFormat('#,##,###.##', 'en_IN');
  String formattedNumber = indianNumberFormat.format(number);
  return formattedNumber;
}

Future<String?> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
  return null;
}
