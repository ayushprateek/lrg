import 'package:miesp/models/item_details_model.dart';
import 'package:miesp/services/service_manager.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/ui/components/elements_button.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:miesp/ui/components/scan.dart';
import 'package:miesp/ui/dashboard.dart';
import 'package:miesp/ui/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScanner extends StatefulWidget {
  @override
  _CustomScannerState createState() => _CustomScannerState();
}

class _CustomScannerState extends State<CustomScanner> {
  String barCode = 'Scan a QR Code or Barcode';

  _onBackButtonPressed() {
    Get.offAll(() => Dashboard());
  }

  // Future<void> scanQRCode() async {
  //   String scanResult = '';
  //   try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666', // Color for the background of the scan page
  //       'Cancel', // Text for the button that cancels the scan
  //       true, // Whether to show the flash icon
  //       ScanMode.QR, // The type of code to scan (QR Code or Barcode)
  //     );
  //   } catch (e) {
  //     print('Error during scan: $e');
  //     getErrorSnackBar('Error during scan: $e');
  //     return;
  //   }
  //
  //   if (!mounted) return;
  //   barCode = scanResult;
  //   if (barCode != '-1') {
  //     if (await ServiceManager.isInternetAvailable()) {
  //       ServiceManager.getItemDetails(
  //           barCode: barCode, onSuccess: onSuccess, onError: onError);
  //     }
  //   }
  // }

  // scanQRCode() async {
  //   if (await ServiceManager.isInternetAvailable()) {
  //     barCode = '47001';
  //     ServiceManager.getItemDetails(
  //         barCode: barCode, onSuccess: onSuccess, onError: onError);
  //   }
  // }

  onSuccess(ItemDetailModel itemDetailModel) {
    print(itemDetailModel.toJson());
    ProductDetails.itemDetailModel = itemDetailModel;
    Get.to(() => ProductDetails(index: 0));
  }

  onError() {
    getErrorSnackBar('Item does not exist');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool bb) async {
        await _onBackButtonPressed();
      },
      canPop: false,
      child: screenWithAppBar(
          title: 'Scan Bar/QR Code',
          leading: IconButton(
              onPressed: () async {
                await _onBackButtonPressed();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (barCode != 'Scan a QR Code or Barcode')
                  getHeadingText(text: 'Scanned text--> $barCode'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: Get.width / 4,
                    height: Get.height / 18,
                    child: loadingButton(
                        isLoading: false,
                        btnText: 'Scan',
                        elevation: 4,
                        onPress: () {
                          scanQRCode(onSuccess: (String scanResult) async {
                            if (!mounted) return;
                            barCode = scanResult;
                            if (barCode != '-1') {
                              if (await ServiceManager.isInternetAvailable()) {
                                ServiceManager.getItemDetails(
                                    barCode: barCode,
                                    onSuccess: onSuccess,
                                    onError: onError);
                              }
                            }
                          });
                        })),
              ],
            ),
          )),
    );
  }
}
