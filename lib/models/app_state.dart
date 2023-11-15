class AppState {
  final bool isLoading;
  final bool isLoggedIn;
  final String token;
  final String error;
  final String message;

  AppState({
    required this.isLoading,
    required this.isLoggedIn,
    required this.token,
    required this.error,
    required this.message,
  });

  factory AppState.initial() {
    return AppState(
        isLoggedIn: false, isLoading: false, error: '', token: '', message: '');
  }
}
