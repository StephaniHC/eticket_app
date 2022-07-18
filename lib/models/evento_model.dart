// To parse this JSON data, do
//
//     final evento = eventoFromJson(jsonString);

import 'dart:convert';

class DataEvento {
    DataEvento({
        this.message,
        this.success,
        this.eventos,
    });

    String? message;
    String? success;
    List<Evento>? eventos;

    factory DataEvento.fromJson(String str) => DataEvento.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataEvento.fromMap(Map<String, dynamic> json) => DataEvento(
        message: json["message"],
        success: json["success"],
        eventos: List<Evento>.from(json["eventos"].map((x) => Evento.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "eventos": List<dynamic>.from(eventos!.map((x) => x.toMap())),
    };
}


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

Evento eventoFromJson(String str) => Evento.fromJson(json.decode(str));

String eventoToJson(Evento data) => json.encode(data.toJson());
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

    factory Evento.fromMap(Map<String, dynamic> json) => Evento(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "estado": estado,
    };
}

