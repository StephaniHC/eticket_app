import 'dart:io';

import 'package:flutter/material.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo,
    {Function? onPressed}) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(titulo),
              content: Text(subtitulo),
              actions: <Widget>[
                MaterialButton(
                    child: Text('OK'),
                    elevation: 8,
                    textColor: Color.fromARGB(255, 38, 35, 206),
                    onPressed: () {
                      Navigator.pop(context);
                    } 
                    )
              ],
            ));
  }
}
