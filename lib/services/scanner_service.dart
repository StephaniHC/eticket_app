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

  Future<Ticket> getDatoQr(String qr) async {
    Ticket datos; 
    final req = await http.get(
        Uri.parse('${Environment.apiUrl}/ubicaciones-corresponde/3/${qr}'));
    final resp = convert.jsonDecode(req.body);
    data = DataTicket.fromMap(resp);
    if (data.ticket == null){
      datos = data.message as Ticket; //verificar 
      return datos;
    }else{
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
}
