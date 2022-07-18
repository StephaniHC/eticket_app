import 'dart:convert';

import 'package:eticket_app/global/environment.dart';
import 'package:eticket_app/models/login_response.dart'; 
import 'package:eticket_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  late User user;
  final _storage = new FlutterSecureStorage();
  
  bool _autenticando = false;
  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

 Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    final resp = await http.post(Uri.parse('${Environment.apiUrl}/login-api'),
        body: authData);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('token')) {  
      print(resp.body);
     final loginResponse = loginResponseFromJson(resp.body);
     this.user= loginResponse.user;
      await _storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return 'error';
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
