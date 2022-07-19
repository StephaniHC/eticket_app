// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

class DataTicket {
    DataTicket({
        this.message,
        this.success,
        this.ticket,
    });

    String? message;
    String? success;
    List<Ticket>? ticket;

    factory DataTicket.fromJson(String str) => DataTicket.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataTicket.fromMap(Map<String, dynamic> json) => DataTicket(
        message: json["message"],
        success: json["success"],
        ticket: List<Ticket>.from(json["ticket"].map((x) => Ticket.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "ticket": List<dynamic>.from(ticket!.map((x) => x.toMap())),
    };
}

class Ticket {
    Ticket({
        required this.id,
        required this.fechaCompra,
        this.fechaLectura,
        required this.precio,
        required this.cliente,
        required this.evento,
        required this.ubicacion,
        required this.espacio,
        this.tipo,
 });
    
    int id;
    DateTime fechaCompra;
    dynamic fechaLectura;
    String precio;
    String cliente;
    String evento;
    String ubicacion;
    String espacio;
    dynamic tipo;


Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());
        factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        fechaCompra: DateTime.parse(json["fecha_compra"]),
        fechaLectura: json["fecha_lectura"],
        precio: json["precio"],
        cliente: json["cliente"],
        evento: json["evento"],
        ubicacion: json["ubicacion"],
        espacio: json["espacio"],
        tipo: json["tipo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fecha_compra": fechaCompra.toIso8601String(),
        "fecha_lectura": fechaLectura,
        "precio": precio,
        "cliente": cliente,
        "evento": evento,
        "ubicacion": ubicacion,
        "espacio": espacio,
        "tipo": tipo,
    };

    factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        fechaCompra: DateTime.parse(json["fecha_compra"]),
        fechaLectura: json["fecha_lectura"],
        precio: json["precio"],
        cliente: json["cliente"],
        evento: json["evento"],
        ubicacion: json["ubicacion"],
        espacio: json["espacio"],
        tipo: json["tipo"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fechaCompra": fechaCompra,
        "fechaLectura": fechaLectura,
        "precio": precio,
        "cliente": cliente,
        "evento": evento,
        "ubicacion": ubicacion,
        "espacio": espacio,
        "tipo": tipo,
    };
}

