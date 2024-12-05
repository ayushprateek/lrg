import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:miesp/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


showBackPressedWarning({required Function? onBackPressed,
String? text}) {
  try
  {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 18,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              text??"Are you sure you want to go back?",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
              fontSize: 16),
            ),
          ),
          actions: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: appPrimary,
              child: getHeadingText(text: 'Cancel',color: Colors.white),
              onPressed: () {
                Get.back();
              },
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.red,
              child: getHeadingText(text: 'Yes',color: Colors.white),
              onPressed: () async {
                if (onBackPressed != null) {
                  onBackPressed();
                } else {

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                          (route) => false);
                }
              },
            ),
          ],
        );
      },
    );
  }
  catch(e)
  {

  }

}
