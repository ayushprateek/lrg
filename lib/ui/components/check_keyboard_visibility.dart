import 'package:flutter/material.dart';

bool keyboardIsVisible(
    {required BuildContext context,
    ScrollController? scrollController,
    double animateTo = 180.0}) {
  bool isKeyboardVisible = !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  if (isKeyboardVisible) {
    scrollController?.animateTo(animateTo,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
  return isKeyboardVisible;
}
