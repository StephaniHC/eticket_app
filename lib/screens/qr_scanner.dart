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
  String result = "Tickets!";
  var service = ScannerService();
  late Ticket datos;

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
      result = qrResult;
      scanService.getDatoQr(qrResult);
      // print(scanService.data.message);
      setState(() {  
        result = qrResult;
      });
  }

  @override
  Widget build(BuildContext context) {
    //service.ubicacion = ScannerService.ubicacion;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Lectura de QR'),
      ),
      body: FutureBuilder(
          future: _getDatoQr(),
          builder: (context, AsyncSnapshot<Ticket> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _data();
            }
          },
        ),
      /*body: Center(
        child: Text(
          result,
          style: new TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),*/
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.qr_code_scanner),
        label: Text("Scanear Ticket!"),
        onPressed: _scanQR,
      ),
    );
  }

   Widget _data() {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headline4!.fontSize!,
      ), 
      child: Text('Datos del QR',
        style: Theme.of(context).textTheme.headline4!
            .copyWith(color: Color.fromARGB(255, 151, 146, 146))),
    );
  } 

  Future<Ticket> _getDatoQr() async {
    datos = await service.getDatoQr(result);
    return datos;
  }
}