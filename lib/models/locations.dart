// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

LocationsList locationslistFromJson(String str) =>
    LocationsList.fromJson(json.decode(str));

String locationslistToJson(LocationsList data) => json.encode(data.toJson());

class LocationsList {
  LocationsList({
    required this.items,
  });

  List<Locations> items;

  factory LocationsList.fromJson(Map<String, dynamic> json) => LocationsList(
        items:
            json["items"].map<Locations>((x) => Locations.fromJson(x)).toList(),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()),
      };
}

class Locations {
  Locations({
    required this.id,
    required this.name,
    required this.address,
  });

  int id;
  String name;
  String address;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
      };
}
