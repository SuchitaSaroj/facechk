class GaurdLoginModel {
  GaurdLoginModel({
    this.message,
    this.status,
    this.data,
  });

  String message;
  String status;
  List<Datum> data;
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.referCode,
    this.email,
    this.mobile,
    this.appStatus,
    this.officerId,
    this.documentType,
    this.adharNo,
    this.gender,
    this.visiteTime,
    this.visiteDuration,
    this.services,
    this.officerDetail,
  });

  int id;
  String name;
  String referCode;
  String email;
  String mobile;
  AppStatus appStatus;
  int officerId;
  DocumentType documentType;
  String adharNo;
  Gender gender;
  String visiteTime;
  String visiteDuration;
  Services services;
  OfficerDetail officerDetail;
}

enum AppStatus { APPROVE, PENDING }

enum DocumentType { DL, ADHAR_CARD, GOVT_ID_PF }

enum Gender { MALE, GENDER_MALE }

class OfficerDetail {
  OfficerDetail({
    this.id,
    this.name,
  });

  int id;
  Name name;
}

enum Name { HIMANSHU_VERMA }

enum Services { OFFICIAL, ADHAR_SERVICES_COMPLAINT }
