import 'package:eticket_app/models/ticket_model.dart';
import 'package:eticket_app/services/services.dart';
import 'package:eticket_app/widgets/auth_background.dart';
import 'package:eticket_app/widgets/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanService = Provider.of<ScannerService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    final ubicacionService =
        Provider.of<UbicacionService>(context, listen: false);
    if (scanService.isLoading)
      return Scaffold(
          appBar: AppBar(
            title: Text("${ubicacionService.ubicacionSelect.nombre}"),
            backgroundColor: Colors.blue,
          ),
          body: const Center(child: CircularProgressIndicator()));

    if (scanService.data.ticket!.id == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text("${ubicacionService.ubicacionSelect.nombre}"),
            backgroundColor: Colors.blue,
          ),
          body:  Center(child: Center(child: Text(scanService.data.message!))));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("${ubicacionService.ubicacionSelect.nombre}"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Transform.translate(
              offset: const Offset(0, -90),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 120),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: cargar(scanService.data.ticket!),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          // onPressed: () {},
          onPressed: () => confirmarTicket(scanService, authService, context),
          tooltip: "Agregar Productos",
          child: const Icon(Icons.add),
        ),
      );
    }
  }

  List<Widget> cargar(Ticket ticket) {
    List<Widget> lista = [];

    Widget nise = TextFormField(
      decoration: const InputDecoration(
        labelText: "Cliente:",
      ),
      controller: TextEditingController(text: '${ticket.cliente}'),
      readOnly: true,
      enabled: false,
    );
    lista.add(nise);

    nise = TextFormField(
      decoration: const InputDecoration(
        labelText: "Precio:",
      ),
      controller: TextEditingController(text: ticket.precio),
      readOnly: true,
      enabled: false,
    );
    lista.add(nise);

    nise = TextFormField(
      decoration: const InputDecoration(
        labelText: "Evento:",
      ),
      controller: TextEditingController(text: ticket.evento),
      readOnly: true,
      enabled: false,
    );
    lista.add(nise);

    nise = TextFormField(
      decoration: const InputDecoration(
        labelText: "Ubicacion:",
      ),
      controller: TextEditingController(text: ticket.ubicacion),
      readOnly: true,
      enabled: false,
    );
    lista.add(nise);

    // nise = TextFormField(
    //   decoration: const InputDecoration(
    //     labelText: "Ubicacion:",
    //   ),
    //   controller: TextEditingController(text: ticket),
    //   readOnly: true,
    //   enabled: false,
    // );
    // lista.add(nise);

    nise = TextFormField(
      decoration: const InputDecoration(
        labelText: "Espacio:",
      ),
      controller: TextEditingController(text: ticket.espacio),
      readOnly: true,
      enabled: false,
    );
    lista.add(nise);

    return lista;
  }

  void confirmarTicket(ScannerService scanService, AuthService authService,
      BuildContext context) async {
    final idUser = authService.user.id;
    final idticket = scanService.data.ticket!.id;
    String? message = await scanService.registrarTicket(idUser, idticket!);
    await Future.delayed(const Duration(seconds: 3));
    if (message == null) {
      print('error');
    } else {
      if (message.contains('Error')) {
        mostrarAlerta(context, 'Error', message);
      } else {
        mostrarAlerta(context, 'Exito', message);
      }
      // Navigator.pushReplacementNamed(context, 'ubicacion');
    }
  }
}
