import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  @override
  QrScannerScreenState createState() {
    return new QrScannerScreenState();
  }
}

class QrScannerScreenState extends State<QrScannerScreen> {
  String result = "Ticket!";

  Future _scanQR() async {
    try {
      String qrResult =  await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR );
        
      setState(() {
        result = qrResult;
      });
    
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
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
  }
}