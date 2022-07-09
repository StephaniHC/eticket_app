import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:eticket_app/models/evento_model.dart';

class EventoService {
  Future<List<Evento>> getEventos() async {
    List<Evento> listaEvento = [];
    final req = await http
        .get(Uri.parse('http://192.168.0.4:8000/eventos-api'));
    final resp = convert.jsonDecode(req.body);
    listaEvento = resp
        .map<Evento>((e) => Evento(
            id: e["id"],
            titulo: e["titulo"],
            estado: e["estado"],
            ))
        .toList();
    debugPrint(resp.toString());
    return listaEvento;
  }
}
