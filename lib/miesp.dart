import 'dart:async';

import 'package:miesp/common/app_assets.dart';
import 'package:miesp/common/keys.dart';
import 'package:miesp/local_storage/local_storage.dart';
import 'package:miesp/theme/custom_theme.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/ui/account/login_screen.dart';
import 'package:miesp/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MIESP extends StatefulWidget {
  static _MIESPState? _state;

  const MIESP({Key? key}) : super(key: key);

  static void buildTheme(BuildContext context, bool? flagDarkTheme) async {
    _state?.buildTheme(flagDarkTheme);
  }

  static void setLocale(Locale locale) async {
    _state?.setLocale(locale);
  }

  @override
  State<MIESP> createState() => _MIESPState();
}

class _MIESPState extends State<MIESP> {
  @override
  void initState() {
    super.initState();

    initLocalStorage();
  }

  buildTheme(bool? flagDarkTheme) {
    setState(() {
      AppTheme.load(flagDarkTheme: flagDarkTheme ?? false);
    });
  }

  setLocale(Locale locale) {
    Get.locale = locale;
  }

  Future<void> initLocalStorage() async {
    await LocalStorage.getInstance()?.initLocalStorage();
    navigate();
  }

  navigate() async {
    String? customer = LocalStorage.getString(key: keyObjUser);
    await Future.delayed(const Duration(seconds: 2));
    //todo:
    // FlutterNativeSplash.remove();
    if (!mounted) {
      return;
    }
    if (customer == null || customer == '') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Dashboard()));
      // CustomerModel customerModel =
      //     CustomerModel.fromJson(jsonDecode(customer));
      // if (customerModel.email.isNotEmpty) {
      //   ServiceManager.loginViaEmail(
      //       email: customerModel.email,
      //       onError: (String error) {
      //         errorSnackBar(error);
      //         Timer(const Duration(seconds: 1), () {
      //           logout();
      //         });
      //       },
      //       onSuccess: () {
      //         Navigator.of(context).push(
      //             MaterialPageRoute(builder: (context) => const Dashboard()));
      //       });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return screenWithoutAppBar(
        body: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                    height: Get.width / 3,
                    width: Get.width / 3,
                    // decoration: BoxDecoration(border: Border.all(), color: Colors.black),
                    child: Image.asset(logoPath),
                  ),
            )));
  }
}
