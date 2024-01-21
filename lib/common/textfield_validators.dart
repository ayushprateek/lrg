import 'package:miesp/common/app_constants.dart';

String? validateEmail(String? text) {
  if (text?.trim().toString() == null ||
      text?.trim().toString().isEmpty == true) {
    return 'Email can not be empty';
  } else if (!RegExp(patternEmail).hasMatch(text?.trim().toString() ?? "")) {
    return 'Please enter a valid email address';
  } else {
    return null;
  }
}

String? validateMobile(String? text) {
  if (text?.trim().toString() == null ||
      text?.trim().toString().isEmpty == true) {
    return 'Mobile No can not be empty';
  } else if (!RegExp(patternMobile).hasMatch(text?.trim().toString() ?? "")) {
    return 'Please enter a valid mobile number';
  } else {
    return null;
  }
}

String? validateEmpty(String? text, String label) {
  if (text?.trim().toString() == null ||
      text?.trim().toString().isEmpty == true) {
    return '$label can not be empty';
  } else {
    return null;
  }
}
