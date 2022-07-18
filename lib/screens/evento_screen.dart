import 'package:eticket_app/screens/screens.dart';
import 'package:eticket_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:eticket_app/models/evento_model.dart';
import 'package:provider/provider.dart';

class EventoScreen extends StatelessWidget {
  final Evento evento;

  const EventoScreen({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ubicacionService =
        Provider.of<UbicacionService>(context, listen: false);

    return Card(
      elevation: 10,
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            listaDatos(evento.titulo, evento.descripcion, evento.estado),
            title(evento.titulo),
            ElevatedButton(
              onPressed: () {
                ubicacionService.evento = this.evento;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UbicacionScreen()),
                );
              },
              child: Text('Ver Ubicaciones'),
            )
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => QrScannerScreen()),
            //       );
            //     },
            //     child: Text('QR Scanner'))
          ],
        ),
      ),
    );
  }

  Widget title(String nombre) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(nombre,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold)),
                Expanded(child: Container()),
              ],
            )));
  }

  Widget propiedades(String name, String dato) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Align(alignment: Alignment.topLeft));
  }

  Widget listaDatos(String titulo, String descripcion, String estado) {
    return Row(
      children: [
        propiedades("Titulo: ", titulo),
        Container(width: 10),
        propiedades("Descripcion: ", descripcion),
        Container(width: 10),
        propiedades("Estado: ", estado),
      ],
    );
  }
}
