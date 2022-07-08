import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget { 
  final Widget child;

  const AuthBackground({
    Key? key,
    required this.child
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BlueBox(),
          _HeaderIcon(),
          this.child



        ],
      ),
    );
  }
}


class _BlueBox extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Container( 
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _blueBackground(),
      child: Stack(  
      ),
    );
  }

  BoxDecoration _blueBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(46, 134, 193, 1),
        Color.fromRGBO(46, 134, 193, 1)
      ]
    )
  );
}
 

class _HeaderIcon extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only( top: 30),
        child: Icon( Icons.sensor_occupied_rounded , color: Colors.white, size: 150),
      ),
    );
  }
}