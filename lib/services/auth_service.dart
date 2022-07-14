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

Future<String?> login( String email, String password ) async {
  print("llegamo");
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    print(authData);

    final resp = await http.post(Uri.parse('${Environment.apiUrl}/login-api'), body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );
    print("paso?");
    if ( decodedResp.containsKey('idToken') ) {
        // Token hay que guardarlo en un lugar seguro
        // decodedResp['idToken'];
        await _storage.write(key: 'token', value: decodedResp['idToken']);
        return null;
    } else {
      return decodedResp['error']['message'];
    }

  }
/*Future<bool> login(String email, String password) async {
    this.autenticando = true;
    final data = {'email': email, 'password': password};
    print(data);
    final resp = await http.post(Uri.parse('${Environment.apiUrl}/login-api'),
        body: json.encode(data));
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
  }*/


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