class Logout {
  String? token;
  String? user;

  Logout({
    required this.token,
    required this.user,
  });

  factory Logout.fromJson(Map<String, dynamic> json) =>
      Logout(token: json['token'], user: json["user"]);

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user,
      };
}
