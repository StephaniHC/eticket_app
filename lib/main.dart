import 'package:eticket_app/provider/ui_provider.dart';
import 'package:eticket_app/screens/home_screen.dart'; 
import 'package:eticket_app/screens/lista_eventos.dart';
import 'package:eticket_app/screens/login_screen.dart';
import 'package:eticket_app/screens/qr_scanner.dart';
import 'package:eticket_app/services/auth_service.dart';
import 'package:eticket_app/services/notifications_service.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
      ],
      child: MyApp(),
    );
  }
}

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Etickes',
      initialRoute: 'login',
      routes: {
        'home'    : ( _ ) => HomeScreen(),
        'login'   : ( _ ) => LoginScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}