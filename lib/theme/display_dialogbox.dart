import 'dart:io';

import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_font.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDialogOkay(BuildContext context, bool isSuccess,
    {String? title,
    String? message,
    List<String>? messages,
    Function? onDismiss,
    Function? onOkayPress}) {
  if (Platform.isIOS) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title ?? ""),
            content: Text(message ?? ""),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok')),
            ],
          );
        });
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(message ?? ""),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}

void showDialogConfirmationCustomButton(
    {BuildContext? context,
    bool? isSuccess = true,
    String? title,
    String? positiveButtonText,
    String negativeButtonText = "",
    bool isShowNegative = true,
    String? message,
    List<String>? messages,
    Function? onDismiss,
    Function? onOkayPress}) {
  List<Widget> titleRowWidgets = [
    if (title != "") _dialogTitle(context!, title, isSuccess!)
  ];
  Widget content = _dialogContent(context!, message, messages);
  List<Widget> actions = [
    Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _dialogButtonPositive(context, positiveButtonText, onOkayPress),
            if (isShowNegative) ...[
              const SizedBox(width: 15),
              _dialogButtonNegative(context, negativeButtonText,
                  () => Navigator.of(context).pop(false)),
            ]
          ],
        )),
  ];
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          title: Row(
            children: titleRowWidgets,
          ),
          content: content,
          actions: actions,
        ),
      );
    },
  );
}

// void _showDialogWithComponents(
//     BuildContext context,
//     bool isSuccess,
//     String? title,
//     String? message,
//     List<String?>? messages,
//     Function? onDismiss,
//     Function onOkayPress) {
//   List<Widget> titleRowWidgets = [
//     if (title != null && title != "") _dialogTitle(context, title, isSuccess)
//   ];
//   Widget content = _dialogContent(context, message, messages);
//   List<Widget> actions = [_dialogOkayButton(context, onOkayPress)];
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Expanded(
//         child: AlertDialog(
//           title: Row(
//             children: titleRowWidgets,
//           ),
//           content: content,
//           actions: actions,
//         ),
//       );
//     },
//   );
// }

Text _dialogTitle(BuildContext context, String? title, bool isSuccess) {
  TextStyle? titleTextStyle = isSuccess
      ? AppTheme.textTheme.headline6
          ?.merge(TextStyle(color: Theme.of(context).colorScheme.secondary))
      : AppTheme.textTheme.headline6
          ?.merge(TextStyle(color: Theme.of(context).errorColor));
  if (title != null) {
    return Text("  " + title, style: titleTextStyle);
  } else {
    return isSuccess
        ? Text(" Success", style: titleTextStyle)
        : Text("  Failed", style: titleTextStyle);
  }
}

Widget _dialogContent(
    BuildContext context, String? message, List<String?>? messages) {
  if (message != null) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: CustomFont.customFont,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.3,
            color: Colors.black),
      ),
    );
  }
  if (messages != null && messages.isNotEmpty) {
    String _content = "";
    for (String? msg in messages) {
      _content += msg ?? "";
      if (messages.indexOf(msg) != messages.length - 1) _content += "\n";
    }

    return Text(_content);
  }
  return const Text("");
}

Widget _dialogButtonPositive(
    BuildContext? context, String? text, Function? onPressed) {
  return TextButton(
    onPressed: onPressed as Function(),
    child: Text(
      text ?? "",
      style: const TextStyle(color: Colors.black),
    ),
  );
}

Widget _dialogButtonNegative(
    BuildContext? context, String? text, Function onPressed) {
  return ElevatedButton(
    onPressed: onPressed as Function(),
    child: Text(text ?? ""),
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      textStyle: const TextStyle(
          fontFamily: CustomFont.customFont,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          letterSpacing: 0.3,
          color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}

AlertDialog showLoaderDialog(BuildContext context,
    {String text = "downloading file..."}) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              color: appPrimary,
            )),
        Container(
            padding: const EdgeInsets.only(left: 30),
            child: getHeadingText(text: text)),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  return alert;
}
