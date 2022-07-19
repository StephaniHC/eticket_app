import 'dart:async';
import 'dart:convert';

import 'package:eticket_app/global/environment.dart';
import 'package:eticket_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ScannerService extends ChangeNotifier {
  late Ubicacion ubicacion;
  late Ticket ticket;
  late User user;
  late DataTicket data;
  late bool isLoading;

  Future<Ticket> getDatoQr(String qr) async {
    Ticket datos;
    final req = await http
        .get(Uri.parse('${Environment.apiUrl}/ubicaciones-corresponde//${qr}'));
    final resp = convert.jsonDecode(req.body);
    data = DataTicket.fromMap(resp);
    if (data.ticket == null) {
      datos = data.message as Ticket; //verificar
      return datos;
    } else {
      datos = data.ticket!;
      print(datos);
    }
    return datos;
  }

  Future<String> verificarTicket() async {
    final Map<String, dynamic> data = {
      'user_id': this.user.id,
      'ticket_id': this.ticket.id,
    };
    final resp = await http.post(
        Uri.parse('${Environment.apiUrl}/tickets-api-validar'),
        body: data);
    final Map<String, dynamic> respuesta = json.decode(resp.body);
    return respuesta['message'];
  }

  void getDatoQr1(String qr, int IdUbicacion) async {
    isLoading = true;
    notifyListeners();
    final req = await http.get(Uri.parse(
        '${Environment.apiUrl}/ubicaciones-corresponde/$IdUbicacion/$qr'));
    
    print('getDatoQr1------------------------------------');
    print('qr: $qr');
    print('ubicacion: $IdUbicacion');
    print(req.body);
    print('endgetDatoQr1------------------------------------');
    final resp = convert.jsonDecode(req.body);
    data = DataTicket.fromMap(resp);
    ticket = data.ticket!;
    print(data);
    print('todo nise--------------------');
    isLoading = false;
    notifyListeners();
  }

  Future<String?> registrarTicket(int idUser, int idUbicacion) async {
    final Map<String, String> data = {
      'user_id': '$idUser',
      'ticket_id': '$idUbicacion',
    };
    final resp = await http.post(
        Uri.parse('${Environment.apiUrl}/tickets-api-validar'),
        body: data);
    print(resp.body);
    final respuesta = json.decode(resp.body);
    print(respuesta);
    return respuesta['message'];
  }
}
