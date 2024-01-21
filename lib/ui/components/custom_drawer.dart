import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miesp/common/app_assets.dart';
import 'package:miesp/common/keys.dart';
import 'package:miesp/custom_scanner.dart';
import 'package:miesp/local_storage/local_storage.dart';
import 'package:miesp/models/customer_model.dart';
import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/ui/account/login_screen.dart';
import 'package:miesp/ui/components/elements_button.dart';
import 'package:miesp/ui/stock_counting/stock_counting.dart';
import 'package:miesp/ui/report/download_report.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appPrimary,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              CustomerModel.getLoginCustomer().userCode ?? '',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            accountEmail: Text(CustomerModel.getLoginCustomer().email ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            currentAccountPicture: ClipRRect(
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
            decoration: BoxDecoration(
              color: appPrimary,
              // border: Border.all()
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Get.to(() => SelectWarehouse(
          //           isComingFromLogin: false,
          //         ));
          //   },
          //   child: ListTile(
          //     title: getHeadingText(
          //       text: 'Set Warehouse',
          //       color: Colors.white,
          //     ),
          //     leading: const Icon(Icons.calendar_month, color: Colors.white),
          //     trailing:
          //         const Icon(Icons.keyboard_arrow_right, color: Colors.white),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Get.to(() => CustomScanner());
            },
            child: ListTile(
              title: getHeadingText(
                text: 'Scan',
                color: Colors.white,
              ),
              leading: const Icon(Icons.qr_code_scanner, color: Colors.white),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => StockCounting());
            },
            child: ListTile(
              title: getHeadingText(
                text: 'Stock Counting',
                color: Colors.white,
              ),
              leading: const Icon(Icons.calendar_month, color: Colors.white),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => ReportPage());
            },
            child: ListTile(
              title: getHeadingText(
                text: 'Report',
                color: Colors.white,
              ),
              leading: const Icon(Icons.edit_document, color: Colors.white),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Get.to(() => SalesQuotationUI(
          //           index: 0,
          //         ));
          //   },
          //   child: ListTile(
          //     title: getHeadingText(
          //       text: 'Product Form',
          //       color: Colors.white,
          //     ),
          //     leading: const Icon(Icons.calendar_month, color: Colors.white),
          //     trailing:
          //         const Icon(Icons.keyboard_arrow_right, color: Colors.white),
          //   ),
          // ),
          // ExpansionTile(
          //   // initiallyExpanded: true,
          //   collapsedBackgroundColor: appPrimary,
          //   backgroundColor: appPrimary,
          //   leading:
          //       const Icon(Icons.supervised_user_circle, color: Colors.white),
          //   iconColor: Colors.white,
          //   collapsedIconColor: Colors.white,
          //   title: getHeadingText(
          //     text: "User Management",
          //     color: Colors.white,
          //   ),
          //   children: [
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "View User",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(Icons.person_2, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Create User",
          //           color: Colors.white,
          //         ),
          //         leading:
          //             const Icon(MdiIcons.accountPlus, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     // InkWell(
          //     //   onTap: () {},
          //     //   child: ListTile(
          //     //     title: getHeadingText(
          //     //       text: "Roles",
          //     //       color: Colors.white,
          //     //     ),
          //     //     leading: const Icon(Icons.rotate_left, color: Colors.white),
          //     //     trailing: const Icon(Icons.keyboard_arrow_right,
          //     //         color: Colors.white),
          //     //   ),
          //     // ),
          //   ],
          // ),
          // ExpansionTile(
          //   // initiallyExpanded: true,
          //   collapsedBackgroundColor: appPrimary,
          //   backgroundColor: appPrimary,
          //   leading:
          //       const Icon(Icons.supervised_user_circle, color: Colors.white),
          //   iconColor: Colors.white,
          //   collapsedIconColor: Colors.white,
          //   title: getHeadingText(
          //     text: "Masters",
          //     color: Colors.white,
          //   ),
          //   children: [
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Product Categories",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(Icons.category, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Product",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(Icons.category, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Group",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(Icons.groups, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Transport",
          //           color: Colors.white,
          //         ),
          //         leading:
          //             const Icon(Icons.local_shipping, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Mill",
          //           color: Colors.white,
          //         ),
          //         leading:
          //             const Icon(MdiIcons.factoryIcon, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Party",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(MdiIcons.handshake, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Mill Bank",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(MdiIcons.bank, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //     InkWell(
          //
          //       child: ListTile(
          //         title: getHeadingText(
          //           text: "Party Bank",
          //           color: Colors.white,
          //         ),
          //         leading: const Icon(MdiIcons.bank, color: Colors.white),
          //         trailing: const Icon(Icons.keyboard_arrow_right,
          //             color: Colors.white),
          //       ),
          //     ),
          //   ],
          // ),

          InkWell(
            onTap: () async {
              List<Widget> titleRowWidgets = [getHeadingText(text: 'Logout')];
              List<Widget> actions = [
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // if (!isShowNegative)
                        const Spacer(),

                        TextButton(
                          onPressed: () {
                            // setLogInTime(dateTime: null);
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) =>
                            //             LoginPage())),
                            //         (route) => false);
                            _logout();
                          },
                          child: getHeadingText(text: 'Logout', color: red),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: getHeadingText(text: 'No'),
                        ),
                      ],
                    )),
              ];
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  if (Platform.isIOS) {
                    return CupertinoAlertDialog(
                      title: Row(
                        children: titleRowWidgets,
                      ),
                      content: getHeadingText(
                          text: 'Are you sure you want to logout?',
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w100),
                      actions: actions,
                    );
                  } else {
                    return AlertDialog(
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: getHeadingText(
                            text: 'Are you sure you want to logout?',
                            fontSize: 15,
                            textAlign: TextAlign.center),
                      ),
                      icon: getIcon(Icons.logout, iconColor: red),
                      actions: [
                        MaterialButton(
                          // OPTIONAL BUTTON
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: appPrimary,
                          child: getHeadingText(text: 'Cancel', color: white),
                          onPressed: () {
                            Navigator.pop(context);
                            // createInvoice(context, false);
                          },
                        ),
                        MaterialButton(
                          // OPTIONAL BUTTON
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Colors.red,
                          child: getHeadingText(text: 'Logout', color: white),
                          onPressed: () async {
                            _logout();
                          },
                        ),
                      ],
                    );
                  }
                },
              );
            },
            child: ListTile(
              title: getHeadingText(text: 'Logout', color: white),
              leading: const Icon(Icons.logout, color: Colors.white),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _logout() {
    LocalStorage.setString(key: keySelectedWarehouse, value: '');
    LocalStorage.setString(key: keyObjUser, value: '');
    Get.offAll(() => LoginPage());
  }
}
