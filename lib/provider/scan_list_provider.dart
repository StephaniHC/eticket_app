import 'package:flutter/material.dart';
import 'package:eticket_app/models/models.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = []; 

  Future<ScanModel> nuevoScan( String dato ) async {
    final nuevoScan = new ScanModel(dato: dato); 
    return nuevoScan;
  }
  

  cargarScans() async { 
    this.scans = [...scans];
    notifyListeners();
  } 


}

