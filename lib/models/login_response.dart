import 'dart:convert';

import 'package:eticket_app/models/users_model.dart';
 

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.ok,
    required this.users,
    required this.token,
  });

  bool ok;
  Users users;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        users: Users.fromJson(json["users"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "users": users.toJson(),
        "token": token,
      };
}
