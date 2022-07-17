import 'package:eticket_app/global/environment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:eticket_app/models/evento_model.dart';
import 'package:eticket_app/models/users_model.dart';

class EventoService {
  late Users users;
  Future<List<Evento>> getEventos() async {
    List<Evento> listaEvento = [];
    final req = await http.get(Uri.parse('${Environment.apiUrl}/login-evento-disponible/${this.users.id}'));
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
