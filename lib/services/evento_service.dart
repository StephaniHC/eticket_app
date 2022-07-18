import 'package:eticket_app/global/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:eticket_app/models/evento_model.dart';
import 'package:eticket_app/models/user_model.dart';

class EventoService {
  //late Users users;
  Future<List<Evento>> getEventos(int idP) async {
    List<Evento> listaEvento = [];
    final req = await http.get(Uri.parse('${Environment.apiUrl}/login-evento-disponible/3'));
    final resp = convert.jsonDecode(req.body);
    listaEvento = resp
        .map<Evento>((e) => Evento(
            id: e["id"],
            titulo: e["titulo"],
            descripcion: e["descripcion"],
            estado: e["estado"],
            ))
        .toList();
    debugPrint(resp.toString()); 
    return listaEvento;
  }
}
