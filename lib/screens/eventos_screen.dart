import 'package:flutter/material.dart';

class EventosScreen extends StatelessWidget {
   final options = const['a', 'b', 'c']; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Eventos'),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.separated( 
        itemCount: options.length,
        itemBuilder: (context, i)=> ListTile(
          title: Text(options [i]),
          trailing: const Icon (Icons.arrow_forward_ios_outlined),
          onTap: (){
             Navigator.pushReplacementNamed(context, 'qr');
          },
        ),
          separatorBuilder: (_ , __) => const Divider(),
      
      ),
    );
  }
}