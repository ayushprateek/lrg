// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

Future<void> scanQRCode({
  required Function(String) onSuccess,
}) async {
  String scanResult = '';
  try {
    // scanResult = await FlutterBarcodeScanner.scanBarcode(
    //   '#ff6666', // Color for the background of the scan page
    //   'Cancel', // Text for the button that cancels the scan
    //   true, // Whether to show the flash icon
    //   ScanMode.QR, // The type of code to scan (QR Code or Barcode)
    // );
    Get.to(() => BarcodeScannerSimple(
          barCodeScanResult: (String? res) {
            Get.back();
            onSuccess(res ?? '');
          },
        ));
  } catch (e) {
    print('Error during scan: $e');
    getErrorSnackBar('Error during scan: $e');
    return;
  }

  // if (scanResult != '') {
  //   onSuccess(scanResult);
  // }
}

class BarcodeScannerSimple extends StatefulWidget {
  final Function(String?) barCodeScanResult;

  const BarcodeScannerSimple({super.key, required this.barCodeScanResult});

  @override
  State<BarcodeScannerSimple> createState() => _BarcodeScannerSimpleState();
}

class _BarcodeScannerSimpleState extends State<BarcodeScannerSimple> {
  // Barcode? _barcode;
  bool _scanned=false;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted &&!_scanned) {
      _scanned=true;
      widget.barCodeScanResult(barcodes.barcodes.firstOrNull?.displayValue);


      // setState(() {
      //   _barcode = barcodes.barcodes.firstOrNull;
      // });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     alignment: Alignment.bottomCenter,
          //     height: 100,
          //     color: Colors.black.withOpacity(0.4),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Expanded(child: Center(child: _buildBarcode(_barcode))),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
