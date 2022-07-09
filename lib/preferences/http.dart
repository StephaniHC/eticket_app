import 'package:http/http.dart' as http;
import 'dart:convert';

class Http {
  String ip = 'http://192.168.0.4:8000';

  Future<Map> get(String route) async {
    route = "$ip$route";
    http.Response response = await http.get(Uri.parse(route));
    print(response);
    Map data = await json.decode(response.body);
    return data;
  }

  Future<Map> post(String route, dynamic data) async {
    route = "$ip$route";
    http.Response response = await http.post(
      Uri.parse(route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    Map res = json.decode(response.body);
    print(res);
    return res;
  }
}
