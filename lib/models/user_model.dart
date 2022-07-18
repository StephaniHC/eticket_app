import 'dart:convert';

User usersFromJson(String str) => User.fromJson(json.decode(str));

String usersToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.id,
        required this.rol_id,
        required this.name,
        required this.email,
    });

    int id;
    int rol_id;
    String name;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        rol_id: json["rol_id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rol_id": rol_id,
        "name": name,
        "email": email,
    };
}
