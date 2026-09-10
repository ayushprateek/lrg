import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> appScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void getErrorSnackBar(String text) {
  _showSnackBar(text.replaceAll('"', ''), Colors.red);
}

void getSuccessSnackBar(String text) {
  _showSnackBar(text, Colors.green);
}

void _showSnackBar(String text, Color backgroundColor) {
  appScaffoldMessengerKey.currentState
    ?..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
}
