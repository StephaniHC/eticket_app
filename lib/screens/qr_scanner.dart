
import 'package:eticket_app/widgets/scan_button.dart';
import 'package:eticket_app/widgets/scanner.dart';
import 'package:flutter/material.dart';

class QrScannerScreen extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon( Icons.arrow_back), 
            onPressed: (){ 
              Navigator.pushReplacementNamed(context, 'ubicacion');
            }
          )
        ],
        title: Text('Lectura de QR'), 
      ),
     // body: _ScanBody(),
      floatingActionButton: ScanButton(),
    );
    //return Scanner();
  }
}

/*class _ScanBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    //final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    //scanListProvider.cargarScans();
    return TicketScreen();

  }
}*/
