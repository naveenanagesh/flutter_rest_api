class LoginRequestAction {
  final String username;
  final String password;

  LoginRequestAction({required this.username, required this.password});
}

class LoginSuccessAction {
  final String token;

  LoginSuccessAction({required this.token});
}

class LoginFailureAction {
  final String error;
  final String message;

  LoginFailureAction({required this.error, required this.message});
}

enum AuthAction { login, logout }
