// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'dart:convert';

DepartmentModel departmentModelFromJson(String str) => DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
  DepartmentModel({
    this.status,
    this.date,
  });

  String status;
  List<Date> date;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
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
    this.buildingId,
    this.locationId,
    this.companyId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  int buildingId;
  int locationId;
  String companyId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["id"],
    name: json["name"],
    buildingId: json["building_id"],
    locationId: json["location_id"],
    companyId: json["company_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: DateTime.parse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "building_id": buildingId,
    "location_id": locationId,
    "company_id": companyId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt.toIso8601String(),
  };
}
