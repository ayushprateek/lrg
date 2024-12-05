import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miesp/common/app_assets.dart';
import 'package:miesp/common/app_constants.dart';
import 'package:miesp/models/customer_model.dart';
import 'package:miesp/services/service_manager.dart';
import 'package:miesp/theme/custom_font.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/theme/get_text_field.dart';
import 'package:miesp/ui/components/back_pressed_warning.dart';
import 'package:miesp/ui/components/check_keyboard_visibility.dart';
import 'package:miesp/ui/components/elements_button.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:miesp/ui/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  double div = 1.35;

  final key = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool obscurePassword = true;
  bool isLoading = false;


  TextEditingController userEmail =
      TextEditingController(text: 'rahul@punditz.in');
  TextEditingController password = TextEditingController(text: 'punditz@123');

  //
  // TextEditingController userEmail = TextEditingController();
  // TextEditingController password = TextEditingController();

  _onBackButtonPressed() {
    showBackPressedWarning(
        onBackPressed: () {
          exit(0);
        },
        text: 'Are you sure you want to terminate the app?');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool bb) async {
        await _onBackButtonPressed();
      },
      canPop: false,
      child: screenWithAppBar(
        title: 'Login',
        isBackVisible: false,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black),
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            logoPath,
                            fit: BoxFit.contain,
                          )),
                      // child: Container(
                      //   color: appPrimary,
                      //   child: Image.asset(
                      //     logoPath,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                // const Divider(
                //   color: Colors.grey,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      child: const Text(
                        "Welcome!",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFont.customFont),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    child: const Text(
                      "Please enter username and password!",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: CustomFont.customFont),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: getTextFieldWithoutLookup(
                    controller: userEmail,
                    labelText: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: getTextFieldWithoutLookup(
                      labelText: 'Password',
                      controller: password,
                      maxLines: 1,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      obscureText: obscurePassword),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     getHeadingText(text: 'Click here to ', fontSize: 15),
                //     TextButton(
                //       child: getHeadingText(
                //           text: 'Reset password',
                //           fontSize: 15,
                //           decoration: TextDecoration.underline,
                //           color: textFieldBorderColor),
                //       onPressed: () {
                //         Get.to(() => PasswordResetScreen(
                //               isComingFromLogin: true,
                //             ));
                //       },
                //     ),
                //   ],
                // ),
                if (keyboardIsVisible(
                    context: context, scrollController: _scrollController)) ...[
                  const SizedBox(
                    height: 30,
                  ),
                  _buttonContainer(),
                ],
              ],
            ),
          ),
        ),
        bottomNavigationBar: !keyboardIsVisible(
                context: context, scrollController: _scrollController)
            ? _buttonContainer()
            : null,
      ),
    );
  }

  bool isValidated() {
    bool success = true;
    if (userEmail.text.isEmpty) {
      success = false;
      getErrorSnackBar('Email can not be empty');
    } else if (!RegExp(patternEmail).hasMatch(userEmail.text)) {
      success = false;
      getErrorSnackBar('Please enter a valid email');
    } else if (password.text.isEmpty) {
      success = false;
      getErrorSnackBar('Password can not be empty');
    }
    return success;
  }

  Widget _buttonContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loadingButton(
          isLoading: isLoading,
          btnText: 'Log In',
          onPress: () {
            if (isValidated()) {
              _onLogin();
            }
          },
        ),
      ),
    );
  }

  void onSuccess(CustomerModel customerModel) {
    getSuccessSnackBar('Login successful');
    CustomerModel.setLoginCustomer(customerModel: customerModel);
    Get.to(() => Dashboard());
  }

  void onError() {
    getErrorSnackBar('Invalid credentials');
  }

  _onLogin() async {
    if (await ServiceManager.isInternetAvailable()) {
      ServiceManager.login(
          UserEmail: userEmail.text,
          Password: password.text,
          onSuccess: onSuccess,
          onError: onError);
    }
  }
}
