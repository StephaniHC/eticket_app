import 'package:eticket_app/global/environment.dart';
import 'package:eticket_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UbicacionService extends ChangeNotifier {
  late Evento evento;
  late DataUbicacion data;
  late Ubicacion ubicacionSelect;


  Future<List<Ubicacion>> getUbicacion() async {
    List<Ubicacion> listaUbicacion = [];
    final req = await http.get(Uri.parse(
        '${Environment.apiUrl}/eventos-api-disponibles/${this.evento.id}'));
    final resp = convert.jsonDecode(req.body);
    data = DataUbicacion.fromMap(resp);
    if (data.ubicaciones == null) {
      return [];
    } else {
      listaUbicacion = data.ubicaciones!;
    }
    return listaUbicacion;
  }
}
