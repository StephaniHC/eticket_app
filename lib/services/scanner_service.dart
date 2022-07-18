import 'package:eticket_app/global/environment.dart';
import 'package:eticket_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ScannerService extends ChangeNotifier {
  late Ubicacion ubicacion;
  late Ticket ticket; 
  List<String> datos = [];

  Future<List<String>> getDatoQr(String qr) async {
    datos = [];
    final req = await http.get(Uri.parse('${Environment.apiUrl}/ubicaciones-corresponde/${this.ubicacion.id}/${qr}'));
    final resp = convert.jsonDecode(req.body);
    final resul = DataTicket.fromMap(resp);
    print("estamos aqui");
    print(resul.toJson());
    /*if (read.tickets == null) {
      return [];
    } else {
      datos = read.tickets!.cast<String>();
    }*/
    return datos;
  }
}
