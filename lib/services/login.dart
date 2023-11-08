import 'dart:convert';

import 'package:flutter_rest_api/models/login.dart';
import 'package:flutter_rest_api/models/logout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rest_api/models/app_state.dart';
import 'package:flutter_rest_api/actions/login_actions.dart';
import 'package:redux/redux.dart';
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


void loginMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is LoginRequestAction) {
    // Perform the API request
    http.post(Uri.parse('https://api2.squeezemassage.com/api/v2/login'), body: {
      'email': action.username,
      'password': action.password,
      'source': 'customer',
    }).then((response) {
      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        store.dispatch(LoginSuccessAction(token: token));
      } else {
        final error = json.decode(response.body)['error'];
        final message = json.decode(response.body)['message'];
        store.dispatch(LoginFailureAction(error: error, message: message));
      }
    }).catchError((error) {
      store.dispatch(LoginFailureAction(
          error: 'An error occurred', message: 'Something went wrong'));
    });
  }

  // Continue to the next action in the pipeline
  next(action);
}
