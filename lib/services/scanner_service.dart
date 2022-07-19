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

  Future<List<Ticket>>  getDatoQr(String qr) async {
    List<Ticket> datos = [];
    int idUbicacion=this.ubicacion.id;
    print(idUbicacion);
    final req = await http.get(Uri.parse('${Environment.apiUrl}/ubicaciones-corresponde/${idUbicacion}/${qr}'));
    print("ya scaneooooo");
    print(req.body);
    final resp = convert.jsonDecode(req.body);
    data = DataTicket.fromMap(resp);
    print(data.message);
    print(data.ticket);
      return [];
  }
      
      
  Future<String> verificarTicket() async {
    final Map<String, dynamic> data = {
      'user_id': this.user.id,
      'ticket_id': this.ticket.id,
    };
    final resp = await http.post(Uri.parse('${Environment.apiUrl}/tickets-api-validar'),
        body: data);
    final Map<String, dynamic> respuesta = json.decode(resp.body);
      return respuesta['message'];
  } 

}