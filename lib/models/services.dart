import 'dart:convert';

ServicesList serviceslistFromJson(String str) =>
    ServicesList.fromJson(json.decode(str));

String serviceslistToJson(ServicesList data) => json.encode(data.toJson());

class ServicesList {
  ServicesList({
    required this.services,
  });

  List<Services> services;

  factory ServicesList.fromJson(Map<String, dynamic> json) => ServicesList(
        services: json["services"]
            .map<Services>((x) => Services.fromJson(x))
            .toList(),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "services": services.map((x) => x.toJson()),
      };
}

class Services {
  Services({
    required this.id,
    required this.label,
    required this.description,
  });

  int id;
  String label;
  String description;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        label: json["label"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "description": description,
      };
}
