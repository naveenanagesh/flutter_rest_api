class AppStates {
  final bool isLoading;
  final bool isLoggedIn;
  final String token;
  final String error;
  final String message;

  AppStates({
    required this.isLoading,
    required this.isLoggedIn,
    required this.token,
    required this.error,
    required this.message,
  });

  factory AppStates.initial() {
    return AppStates(
        isLoggedIn: false, isLoading: false, error: '', token: '', message: '');
  }
}
