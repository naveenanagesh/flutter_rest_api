import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

class Login {
  String? token;
  // Data? user;

  Login({
    required this.token,
    // required this.user,
  });

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(token: json['token']);
  // Login(token: json['token'], user: Data.fromJson(json["user"]));
  get length => null;

  Map<String, dynamic> toJson() => {
        "token": token,
        // "user": user,
      };
}

class Data {
  String? first_name;
  String? email;
  String? dob;
  String? service_ref_id;

  Data({
    this.first_name,
    this.email,
    this.dob,
    this.service_ref_id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        first_name: json['first_name'],
        email: json["email"],
        dob: json["dob"],
        service_ref_id: json['service_ref_id'],
      );

  Map<String, dynamic> toJson() => {
        "first_name": first_name,
        "email": email,
        "dob": dob,
        "service_ref_id": service_ref_id,
      };
}
