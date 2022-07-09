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
        required this.email,
        required this.password,
    });

    int id;
    int rol;
    String email;
    String password;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        rol: json["rol"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rol": rol,
        "email": email,
        "password": password,
    };
}
