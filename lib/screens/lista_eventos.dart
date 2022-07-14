import 'dart:math';
/*import 'package:eticket_app/screens/evento_screen.dart';
import 'package:flutter/material.dart'; 

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eticket_app/services/evento_service.dart';
import 'package:eticket_app/models/evento_model.dart';
import 'package:eticket_app/screens/evento_screen.dart';

class ListaEventos extends StatefulWidget {
  const ListaEventos({Key? key}) : super(key: key);

  @override
  State<ListaEventos> createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  final eventoService = EventoService();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Evento> listaEvento = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            title: const Text('Lista de Eventos Disponibles'),
            elevation: 1),
        body: FutureBuilder(
          future: _getEventos(),
          builder: (context, AsyncSnapshot<List<Evento>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _listViewEventos();
            }
          },
        ));
  }

  Widget _listViewEventos() {
    return SmartRefresher(
      
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _cargarEventos,
      header: WaterDropHeader(
        complete: Icon(Icons.check, color: Colors.indigoAccent.shade100),
        waterDropColor: Colors.indigoAccent.shade100,
      ),
      
      child: listaEvento.isEmpty
          ? Center(child: titulo("Sin Eventos!"))
          : ListView.separated(
              itemBuilder: (_, i) => EventoScreen(
                evento: listaEvento[i], 
              ),
              
              separatorBuilder: (_, i) => const Divider(),
              itemCount: listaEvento.length,
            ),
            
    );
  }

  int randon(int a, int b) {
    Random rnd = Random();
    int r = a + rnd.nextInt(b - a);
    return r;
  }

  Widget titulo(String nombre) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text(nombre,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 30.0, color: Colors.black54)));
  }

  void _cargarEventos() async {
    listaEvento = await eventoService.getEventos();
    setState(() {}); 
    _refreshController.refreshCompleted();
  }

  Future<List<Evento>> _getEventos() async {
    listaEvento = await eventoService.getEventos();
    return listaEvento;
  }
}*/
