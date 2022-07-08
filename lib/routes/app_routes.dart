
import 'package:eticket_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/eventos_screen.dart';
import '../screens/login_screen.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes ={
    'login': ( BuildContext context ) => LoginScreen(),
    'eventos': ( BuildContext context  ) => EventosScreen(),
  };

  static Route<dynamic> onGenerateRoute( RouteSettings settings){
    return MaterialPageRoute(
      builder: (context)=>  HomeScreen(),
    );
  }
}