import 'package:eticket_app/screens/eventos_screen.dart';
import 'package:eticket_app/screens/tickets_screen.dart';
import 'package:eticket_app/widgets/custom_navigatorbar.dart';
import 'package:eticket_app/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/ui_provider.dart';

class QrScannerScreen extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Lectura de QR'),
      ),
      body: TicketScreen(),
      bottomNavigationBar: CustomNavigatonBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _QrScannerBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
 

    switch( currentIndex ) {
      case 0:
        return TicketScreen();

      case 1:  
        return EventosScreen();

      default:
        return TicketScreen();
    }
  }
}