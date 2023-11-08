class LoginRequestAction {
  final String username;
  final String password;

  LoginRequestAction(this.username, this.password);
}

class LoginSuccessAction {}

class LoginFailureAction {
  final String error;

  LoginFailureAction(this.error);
}
