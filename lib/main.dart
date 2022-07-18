
import 'package:eticket_app/screens/home_screen.dart'; 
import 'package:eticket_app/screens/login_screen.dart';
import 'package:eticket_app/screens/qr_scanner.dart';
import 'package:eticket_app/screens/ubicacion_screen.dart';
import 'package:eticket_app/services/auth_service.dart';
import 'package:eticket_app/services/ubicacion_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => new UiProvider() ),
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: (context) => UbicacionService() ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Etickes', 
        initialRoute: 'login',
        routes: {
          'login': ( BuildContext context ) => LoginScreen(),
          'home': ( BuildContext context  ) => HomeScreen(),
          'qr': ( BuildContext context  ) => QrScannerScreen(),
          //'evento': ( BuildContext context  ) => EventoScreen(),
          'ubicacion': ( BuildContext context  ) => UbicacionScreen(),
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