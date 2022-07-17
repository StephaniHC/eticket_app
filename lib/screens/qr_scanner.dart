import 'package:eticket_app/widgets/scan_button.dart';
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
              Navigator.pushReplacementNamed(context, 'home');
            }
          )
        ],
        title: Text('Lectura de QR'), 
      ),
      floatingActionButton: ScanButton(),
    );
  }
}
