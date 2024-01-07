import 'dart:developer';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scanner {
  Future<String> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      
    } on Error catch (e) {
      barcodeScanRes = 'Failed to get platform version.';
      log(e.toString());
    }
    return barcodeScanRes;
  }
}
