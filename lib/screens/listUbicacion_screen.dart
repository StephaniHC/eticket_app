import 'package:eticket_app/models/ubicacion_model.dart';
import 'package:eticket_app/screens/screens.dart';
import 'package:eticket_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ListUbicacionScreen extends StatelessWidget {
  final Ubicacion ubicacion;
  const ListUbicacionScreen({Key? key, required this.ubicacion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ubicacionService =
        Provider.of<UbicacionService>(context, listen: false);
    final scanService = Provider.of<ScannerService>(context, listen: false);
    ubicacionService.ubicacionSelect = ubicacion;
    print(ubicacionService.ubicacionSelect);
    print('dentro de ubicacion');
    return Card(
      elevation: 10,
      color: Color.fromARGB(255, 143, 219, 238),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            title(ubicacion.nombre),
            listaDatos(
                ubicacion.nombre, ubicacion.direccion, ubicacion.telefono),
            ElevatedButton(
              // onPressed: () {
              //   Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => QrScannerScreen()),
              //   );

              // },
              onPressed: () async {
                ubicacionService.ubicacionSelect = ubicacion;
                print('${ubicacionService.ubicacionSelect.nombre}');
                String qrResult = await FlutterBarcodeScanner.scanBarcode(
                    '#3D8BEF', 'Cancelar', false, ScanMode.QR);

                if (!qrResult.contains('-1') ) {
                  scanService.getDatoQr1(qrResult, ubicacion.id);
                await Future.delayed(const Duration(seconds: 3));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DataScreen()));                  
                } 
                print('-----------------------------------');
                print(qrResult);
                print('Fuera de leer-----------------------------------');                
              },
              child: Text('QR Scanner'),
            )
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

  Widget listaDatos(String nombre, String direccion, String telefono) {
    return Row(
      children: [
        propiedades("Nombre: ", nombre),
        Container(width: 10),
        propiedades("Direccion: ", direccion),
        Container(width: 10),
        propiedades("Telefono: ", telefono),
      ],
    );
  }

  Future _scanQR() async {
    String qrResult = await FlutterBarcodeScanner.scanBarcode(
        '#3D8BEF', 'Cancelar', false, ScanMode.QR);
    // try {} catch (ex) {
    //   setState(() {
    //     result = "Unknown Error $ex";
    //   });
    // }
    // scanService.getDatoQr(qrResult);
    return qrResult;
  }
}
