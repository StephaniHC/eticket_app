import 'package:eticket_app/provider/ui_provider.dart';
import 'package:eticket_app/routes/app_routes.dart';
import 'package:eticket_app/screens/eventos_screen.dart';
import 'package:eticket_app/screens/login_screen.dart';
import 'package:eticket_app/screens/qr_scanner.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider() ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Etickes', 
        initialRoute: 'login',
        routes: {
          'login': ( BuildContext context ) => LoginScreen(),
          'eventos': ( BuildContext context  ) => EventosScreen(),
          'qr': ( BuildContext context  ) => QrScannerScreen(),
        }, 
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blueAccent
          ),
          primaryColor: Colors.blueAccent
        ),
      ),
    );
  }
}