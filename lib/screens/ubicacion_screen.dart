
import 'package:eticket_app/models/models.dart';
import 'package:eticket_app/models/ubicacion_model.dart';
import 'package:eticket_app/screens/listUbicacion_screen.dart';
import 'package:eticket_app/services/ubicacion_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UbicacionScreen extends StatefulWidget {
  const UbicacionScreen({Key? key}) : super(key: key);

  @override
  State<UbicacionScreen> createState() => _UbicacionScreenState();
}

class _UbicacionScreenState extends State<UbicacionScreen> {
  var service = UbicacionService();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Ubicacion> listaUbicacion = [];

  @override
  Widget build(BuildContext context) {
    final ubicacionService =
        Provider.of<UbicacionService>(context, listen: false);
    service.evento = ubicacionService.evento;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Ubicaciones Disponibles"),
        ),
        body: FutureBuilder(
          future: _getUbicacion(),
          builder: (context, AsyncSnapshot<List<Ubicacion>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _listViewUbicacion();
            }
          },
        ));
  }

  Widget _listViewUbicacion() {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _cargarUbicacion,
      header: WaterDropHeader(
        complete: Icon(Icons.check, color: Colors.indigoAccent.shade100),
        waterDropColor: Colors.indigoAccent.shade100,
      ),
      child: listaUbicacion.isEmpty
          ? Center(child: titulo("Sin Ubicacion!"))
          : ListView.separated(
              itemBuilder: (_, i) => ListUbicacionScreen(
                ubicacion: listaUbicacion[i],
              ),
              separatorBuilder: (_, i) => const Divider(),
              itemCount: listaUbicacion.length,
            ),
    );
  }

  Widget titulo(String nombre) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text(nombre,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 30.0, color: Colors.black54)));
  }

  void _cargarUbicacion() async {
    listaUbicacion = await service.getUbicacion();
    // setState(() {});
    _refreshController.refreshCompleted();
  }

  Future<List<Ubicacion>> _getUbicacion() async {
    listaUbicacion = await service.getUbicacion();
    return listaUbicacion;
  }
}
