// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    this.status,
    this.date,
  });

  String status;
  List<Date> date;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    status: json["status"],
    date: List<Date>.from(json["date"].map((x) => Date.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
  };
}

class Date {
  Date({
    this.id,
    this.name,
    this.countryId,
    this.stateId,
    this.companyId,
    this.longitude,
    this.latitude,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int countryId;
  int stateId;
  String companyId;
  String longitude;
  String latitude;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    companyId: json["company_id"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "state_id": stateId,
    "company_id": companyId,
    "longitude": longitude,
    "latitude": latitude,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
