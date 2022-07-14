import 'package:eticket_app/screens/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:eticket_app/models/evento_model.dart';

class EventoScreen extends StatelessWidget {
  final Evento evento;
  const EventoScreen({Key? key, required this.evento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            title(evento.titulo),
            listaPropiedades(
                evento.titulo,
                evento.estado),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QrScannerScreen()),
                  );
                },
                child: Text('QR Scanner'))
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
                        fontWeight: FontWeight.bold)
                    ),
                Expanded(child: Container()),
              ],
            )));
  }

  Widget propiedades(String name, String dato) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
                name == 'Estado: ' && dato == 'pendiente'
                    ? 'Sin Eventos'
                    : '$name $dato',
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold))));
  }

  Widget listaPropiedades(String titulo, String estado) {
    return Row(
      children: [
        propiedades("Titulo: ", titulo),
        Container(width: 10),
        propiedades("Estado: ", estado)
      ],
    );
  }
}