import 'dart:convert';

import 'package:flutter_rest_api/models/login.dart';
import 'package:flutter_rest_api/models/logout.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<Login> login(String email, String password) async {
    var client = http.Client();
    try {
      var uri = Uri.parse('https://api2.squeezemassage.com/api/v2/login');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'source': 'customer',
        }),
      );
      var rest = loginFromJson(response.body);
      return rest;
    } catch (e) {
      print(e);
      throw ('something went wrong');
    }
  }
}

class LogoutService {
  static Future<Logout> logout() async {
    var client = http.Client();
    try {
      var uri = Uri.parse('https://api2.squeezemassage.com/api/v2/logout');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{}),
      );

      var rest = Logout.fromJson(
        json.decode(response.body),
      );
      return rest;
    } catch (e) {
      throw ('testing');
    }
  }
}
