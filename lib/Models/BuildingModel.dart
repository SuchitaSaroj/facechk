// To parse this JSON data, do
//
//     final buildingModel = buildingModelFromJson(jsonString);

import 'dart:convert';

BuildingModel buildingModelFromJson(String str) => BuildingModel.fromJson(json.decode(str));

String buildingModelToJson(BuildingModel data) => json.encode(data.toJson());

class BuildingModel {
  BuildingModel({
    this.status,
    this.date,
  });

  String status;
  List<Date> date;

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
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
    this.locationId,
    this.companyId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int locationId;
  String companyId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["id"],
    name: json["name"],
    locationId: json["location_id"],
    companyId: json["company_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location_id": locationId,
    "company_id": companyId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
