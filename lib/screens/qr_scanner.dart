
import 'package:eticket_app/services/scanner_service.dart';
import 'package:eticket_app/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScannerScreen extends StatelessWidget { 
  String result = "Ticket!";

  Future _scanQR() async {
      String qrResult = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR );
       // result = ScannerService.getDatoQr(qrResult) as String;
        result= qrResult; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Lectura de QR'), 
      ),
      body: Center(
        child: Text(
         result,
          style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.qr_code_scanner ),
        label: Text("Scanea tu Ticket!"),
        onPressed: _scanQR,
      ),
    );
    //return Scanner();
  }
}


