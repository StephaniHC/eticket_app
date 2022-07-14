import 'dart:convert';

import 'package:eticket_app/global/environment.dart';
import 'package:eticket_app/models/login_response.dart';
import 'package:eticket_app/models/users_model.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier {
  late Users users;
  final _storage = new FlutterSecureStorage();
  bool _autenticando = false;
  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }


Future<bool> login(String email, String password) async {
  print("nos fuimoooos");
    this.autenticando = true;
    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Environment.apiUrl}/login-api'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print('aquuuui');
    print(resp.body);
    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      users = loginResponse.users;
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }
  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }
 

  Future logout() async {
    await _storage.delete(key: 'token');
  }

 Future<String> readToken() async {

    return await _storage.read(key: 'token') ?? '';

  }

}