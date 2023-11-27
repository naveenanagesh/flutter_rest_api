// auth_reducer.dart

import 'package:flutter_rest_api/actions/auth_actions.dart';
import 'package:flutter_rest_api/models/app_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';

AppState authReducer(AppState state, dynamic action) {
  if (action is LoginSuccessAction) {
    return AppState(true); // Set isAuthenticated to true on successful login
  } else if (action is LoginFailureAction) {
    // Handle login failure, you might want to show an error message or do other state changes
    return AppState(false);
    // Return current state without modifying it for a login failure in this example
  }
  return state; // Return current state for other actions
}

// Future<AppState> authReducer(AppState state, dynamic action) async {
//   if (action is SaveAuthStateAction) {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isAuthenticated', action.isAuthenticated);
//     return AppState(action.isAuthenticated);
//   }
//   return state;
// }
