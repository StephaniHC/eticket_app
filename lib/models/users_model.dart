// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        required this.id,
        required this.rol,
        required this.name,
        required this.email,
        required this.password,
    });

    int id;
    int rol;
    String name;
    String email;
    String password;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        rol: json["rol"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rol": rol,
        "name": name,
        "email": email,
        "password": password,
    };
}
