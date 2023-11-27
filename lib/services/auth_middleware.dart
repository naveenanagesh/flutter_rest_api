import 'package:flutter_rest_api/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_rest_api/actions/auth_actions.dart';

Middleware<AppState> createAuthMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is LoginRequestAction) {
      var client = http.Client();

      try {
        var uri = Uri.parse('https://api2.squeezemassage.com/api/v2/login');

        final response = await client.post(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': action.username,
            'password': action.password,
            'source': 'customer',
          }),
        );
        if (response.statusCode == 200) {
          // Successful login
          store.dispatch(LoginSuccessAction());
        } else {
          // Handle login failure
          store.dispatch(LoginFailureAction(
              'Login failed, please check your credentials.'));
        }
      } catch (error) {
        store.dispatch(
            LoginFailureAction('An error occurred while logging in.'));
      }
    }

    // Continue with the next action
    next(action);
  };
}
