import 'dart:convert';

TherapistsList therapistslistFromJson(String str) =>
    TherapistsList.fromJson(json.decode(str));

String therapistslistToJson(TherapistsList data) => json.encode(data.toJson());

class TherapistsList {
  TherapistsList({
    required this.items,
  });

  List<Therapists> items;

  factory TherapistsList.fromJson(Map<String, dynamic> json) => TherapistsList(
        items: json["items"]
            .map<Therapists>((x) => Therapists.fromJson(x))
            .toList(),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()),
      };
}

class Therapists {
  Therapists({
    required this.id,
    required this.first_name,
    required this.bio,
  });

  int id;
  String first_name;
  String bio;

  factory Therapists.fromJson(Map<String, dynamic> json) => Therapists(
        id: json["id"],
        first_name: json["first_name"],
        bio: json["bio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": first_name,
        "bio": bio,
      };
}
