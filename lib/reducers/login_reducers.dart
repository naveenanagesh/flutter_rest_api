import 'package:flutter_rest_api/models/app_state.dart';
import 'package:flutter_rest_api/actions/login_actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoginRequestAction) {
    return state.copyWith(isLoading: true, error: "", message: "");
  }
  if (action is LoginSuccessAction) {
    return state.copyWith(
      isLoading: false,
      isLoggedIn: true,
      token: action.token,
      error: "",
      message: "",
    );
  }
  if (action is LoginFailureAction) {
    return state.copyWith(
      isLoading: false,
      isLoggedIn: false,
      token: "",
      error: action.error,
      message: action.message,
    );
  }
  return state;
}

extension AppStateCopyWith on AppState {
  AppState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? token,
    String? error,
    String? message,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      token: token ?? this.token,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
