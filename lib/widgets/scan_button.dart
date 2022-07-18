import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget { 
  String barcodeScanRes = "";
  String result = "";
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: ()async{
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR );
        print("escaneoo");
        print(barcodeScanRes);
        result;
        if ( barcodeScanRes == '-1' ) {
          return;
        } else{
        }
      }
    );
  }
}