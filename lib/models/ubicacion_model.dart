// To parse this JSON data, do
//
//     final ubicacion = ubicacionFromJson(jsonString);

import 'dart:convert';

class DataUbicacion {
    DataUbicacion({
        this.message,
        this.success,
        this.ubicaciones,
    });

    String? message;
    String? success;
    List<Ubicacion>? ubicaciones;

    factory DataUbicacion.fromJson(String str) => DataUbicacion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataUbicacion.fromMap(Map<String, dynamic> json) => DataUbicacion(
        message: json["message"],
        success: json["success"],
        ubicaciones: List<Ubicacion>.from(json["ubicaciones"].map((x) => Ubicacion.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "ubicaciones": List<dynamic>.from(ubicaciones!.map((x) => x.toMap())),
    };
}

class Ubicacion {
    Ubicacion({
        required this.id,
        required this.nombre,
        required this.direccion,
        required this.telefono,
    });

    int id;
    String nombre;
    String direccion;
    String telefono;

    Ubicacion ubicacionFromJson(String str) => Ubicacion.fromJson(json.decode(str));

    String ubicacionToJson(Ubicacion data) => json.encode(data.toJson());
    factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
    };

     factory Ubicacion.fromMap(Map<String, dynamic> json) => Ubicacion(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
    };
}


