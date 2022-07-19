import 'dart:convert';

import 'package:eticket_app/services/scanner_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:eticket_app/global/environment.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class QrScannerScreen extends StatefulWidget {
  @override
  QrScannerScreenState createState() {
    return new QrScannerScreenState();
  }
}

class QrScannerScreenState extends State<QrScannerScreen> {
  String result = "Ticket!";

  Future _scanQR() async {
    final scanService = Provider.of<ScannerService>(context, listen: false);
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF', 'Cancelar', false, ScanMode.QR);
    try {
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
      print('se supe que escaneo---------------');
      scanService.getDatoQr(qrResult);
      print('se supe que salio---------------');
      // print(scanService.data.message);
      setState(() {
        result = qrResult;
      });
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
          style: new TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.qr_code_scanner),
        label: Text("Scanear Ticket!"),
        onPressed: _scanQR,
      ),
    );
  }
}
