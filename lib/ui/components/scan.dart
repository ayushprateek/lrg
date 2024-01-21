import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<void> scanQRCode({
  required Function(String) onSuccess,
}) async {
  String scanResult = '';
  try {
    scanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Color for the background of the scan page
      'Cancel', // Text for the button that cancels the scan
      true, // Whether to show the flash icon
      ScanMode.QR, // The type of code to scan (QR Code or Barcode)
    );
  } catch (e) {
    print('Error during scan: $e');
    getErrorSnackBar('Error during scan: $e');
    return;
  }

  if (scanResult != '-1') {
    onSuccess(scanResult);
  }
}
