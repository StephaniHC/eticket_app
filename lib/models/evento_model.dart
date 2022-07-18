// To parse this JSON data, do
//
//     final evento = eventoFromJson(jsonString);

import 'dart:convert';

Evento eventoFromJson(String str) => Evento.fromJson(json.decode(str));

String eventoToJson(Evento data) => json.encode(data.toJson());

class Evento {
    Evento({
        required this.id,
        required this.titulo,
        required this.descripcion,
        required this.estado,
    });

    int id;
    String titulo;
    String descripcion;
    String estado;

    factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "estado": estado,
    };
}
