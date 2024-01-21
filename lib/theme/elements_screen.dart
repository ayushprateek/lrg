import 'package:miesp/common/keys.dart';
import 'package:miesp/local_storage/local_storage.dart';
import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/theme/custom_theme.dart';
import 'package:miesp/theme/element_style.dart';
import 'package:miesp/theme/elements_text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCube;
// import 'package:intl/intl.dart';

Widget screenWithAppBar(
    {var title,
    BuildContext? context,
    Widget? body,
    bool isBackVisible = true,
    List<Widget>? actions,
    Widget? leading,
    Widget? bottom,
    Function? onBackPressed,
    Color backgroundColor = white,
    Color appBarBackgroundColor = appPrimary,
    double? leadingWidth,
    Widget? bottomNavigationBar,
    FloatingActionButton? floatingActionButton,
    Key? key,
    bool centerTitle = true,
    Widget? drawer}) {
  if (drawer == null) {
    leading ??= Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            if (onBackPressed != null) {
              onBackPressed();
            } else {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }
  return Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: backgroundColor,
    key: key,
    drawer: drawer,
    appBar: AppBar(
      backgroundColor: appBarBackgroundColor,
      elevation: 0.0,
      title: title != null && title is String?
          ? Column(
              children: [
                // if (financialYear != null && financialYear != '')
                  getHeadingText(
                      text:
                      title??'',
                      fontSize: 15,
                      color: Colors.white),
                // Text(
                //   title??'',
                //   style: textLabelBoldStyleWithCustomSize(16, buttonColor,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            )
          : title is Widget
              ? title
              : Text(
                  "",
                  style: textLabelBoldStyleWithCustomSize(16, buttonColor,
                      fontWeight: FontWeight.bold),
                ),
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      leading: isBackVisible ? leading : Container(),
      actions: actions,
      bottom: bottom as PreferredSizeWidget?,
      // shape: ContinuousRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomRight: Radius.circular(radius),
      //         bottomLeft: Radius.circular(radius))),
    ),
    body: body,
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingActionButton,
  );
}

// Widget displayVersion(PackageInfo? packageInfo) {
//   return packageInfo != null
//       ? textLabelRegularWithCustomSize(
//           size: 16,
//           color: appPrimary,
//           text: "${packageInfo.version} (${packageInfo.buildNumber})")
//       : Container();
// }

Widget displayFlavor(BuildContext? context, Widget? widget) {
  return widget ?? Container();
}

Scaffold screenWithoutAppBar({required Widget body, Color color = white}) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: color,
    body: body,
  );
}

Container backgroundColorContainer() {
  return Container(color: AppTheme.createLightTheme().scaffoldBackgroundColor);
}

Container whiteStatusBarContainer({required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).padding.top,
    color: white,
  );
}

InputDecoration inputDecorationCircledEditText(
    {String labelText = "",
    String? hintText,
    String suffixText = "",
    Widget? suffixIcon,
    bool displayBorder = true,
    Widget? prefixIcon,
    Color? fillColor}) {
  return InputDecoration(
    //fillColor: fillColor ?? Colors.white,
    filled: false,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
    suffixIconColor: Colors.black,

    prefixIcon: prefixIcon,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    labelStyle: textLabelRegularStyle(14, black),
    focusedBorder: displayBorder ? outlineInputBorderBorder() : null,
    border: displayBorder ? outlineInputBorderBorder() : null,
    enabledBorder: displayBorder ? outlineInputBorderBorder() : null,
    disabledBorder: displayBorder ? outlineInputBorderBorder() : null,
    focusedErrorBorder: displayBorder ? outlineInputBorderBorder() : null,
    label: labelText != "" && suffixText != ""
        ? Text.rich(TextSpan(children: [
            TextSpan(
              text: labelText,
            ),
            TextSpan(
                text: suffixText, style: const TextStyle(color: Colors.red)),
          ]))
        : labelText != ""
            ? Text(labelText)
            : null,
    contentPadding:
        const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 15),
  );
}

InputDecoration textFormFieldInputDecoration({
  bool showSuffix = false,
  bool showHelperText = false,
  Color borderColor = Colors.black,
  double borderWidth = 5.0,
  double verticalPadding = 10.0,
  double horizontalPadding = 10.0,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
        vertical: verticalPadding, horizontal: horizontalPadding),
    helperText: showHelperText ? "" : null,
    hoverColor: Colors.black,
    suffixIcon: showSuffix ? _iconForwardWidget() : null,
    counterText: "",
    focusedBorder: outlineInputBorderBorder(),
    enabledBorder: outlineInputBorderBorder(),
    disabledBorder: outlineInputBorderBorder(),
    focusedErrorBorder: outlineInputBorderBorder(),
    errorStyle: const TextStyle(
      color: red,
    ),
  );
}

InputDecoration inputDecorationEditText(
    {String labelText = "", Color? fillColor}) {
  return InputDecoration(
    labelText: labelText == "" ? null : labelText,
    labelStyle: textLabelRegularStyle(16, black),
    hintStyle: const TextStyle(color: black),
    focusedBorder: underLineBorderBlack(),
    enabledBorder: underLineBorderBlack(),
    disabledBorder: underLineBorderBlack(),
    focusedErrorBorder: underLineBorderBlack(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    border: underLineBorderBlack(),
    errorBorder: underLineBorderBlack(),
    errorStyle: textLabelBoldStyle(16, red),
  );
}

InputDecoration textFieldDecorationOutlined(
    {IconData? icon,
    Color textColor = Colors.grey,
    Color borderColor = Colors.black,
    Color focusedBorderColor = Colors.black,
    String? text,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto}) {
  return InputDecoration(
      fillColor: black,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      labelStyle: TextStyle(color: textColor),
      floatingLabelBehavior: floatingLabelBehavior,
      errorStyle: textLabelRegularStyle(16, red),
      labelText: text,
      counterText: '',
      //prefixIcon: Icon(icon, color: Colors.white),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: focusedBorderColor)),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)));
}

UnderlineInputBorder underLineBorderBlack() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: appPrimary,
      width: 1.0,
    ),
  );
}

OutlineInputBorder outlineInputBorderBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.grey),
  );
}
//
// Widget loadingIndicatorWidget() {
//   return const SpinKitFadingCube(
//     color: appAccent,
//     size: 50.0,
//   );
// }

String getSelectedDate(DateTime selectedDate) {
  String _month = selectedDate.month.toString().length == 1
      ? "0${selectedDate.month}"
      : selectedDate.month.toString();
  String _day = selectedDate.day.toString().length == 1
      ? "0${selectedDate.day}"
      : selectedDate.day.toString();
  return "$_month/$_day";
}

Widget _iconForwardWidget() {
  return Container(
    padding: const EdgeInsets.only(left: 0, right: 0, top: 18, bottom: 18),
    width: 6,
    height: 12,
    child: Image.asset(
      "assets/images/forward_arrow.png",
      fit: BoxFit.fitHeight,
      color: Colors.black,
    ),
  );
}

DropdownMenuItem<String> dropdownMenuItem(String status) {
  return DropdownMenuItem(
    value: status,
    child: textLabelDotted(text: status),
  );
}

// changed to "dd-MM-yyyy" example 20 Mar 2021
// String changeDateFormat2(String dateString) {
//   DateTime selectedDate = DateTime.parse(dateString);
//   var formatter = DateFormat('d LLL y');
//   String formattedDate = formatter.format(selectedDate);
//   return formattedDate;
// }
