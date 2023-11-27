class AppState {
  final bool isAuthenticated;

  AppState(this.isAuthenticated);

  factory AppState.initial() {
    return AppState(false);
  }
}
