import 'package:eticket_app/global/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:eticket_app/models/models.dart';

class EventoService {
  //late Users users;
  List<Evento> listaEventos = [];

  Future<List<Evento>> getEventos(int idP) async {
    listaEventos = [];
    final req = await http
        .get(Uri.parse('${Environment.apiUrl}/login-evento-disponible/$idP'));
    final resp = convert.jsonDecode(req.body);
    final dataEvento = DataEvento.fromMap(resp);
    listaEventos = dataEvento.eventos!;
    return listaEventos;
    /*
  Future<List<Evento>> getEventos(int idP) async {
    List<Evento> listaEvento = [];
    final req = await http.get(Uri.parse('${Environment.apiUrl}/login-evento-disponible/3'));
    final resp = convert.jsonDecode(req.body);
    final DataEvento = 
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
    */
  }
}
