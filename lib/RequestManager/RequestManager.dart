import 'dart:convert';
import 'package:facechk_app/Models/CityModel.dart';
import 'package:facechk_app/Models/CountryModel.dart';
import 'package:facechk_app/Models/DetailQRModel.dart';
import 'package:facechk_app/Models/GaurdLoginModel.dart';
import 'package:facechk_app/Models/LocationModel.dart';
import 'package:facechk_app/Models/NewRegistrationModel.dart';
import 'package:facechk_app/Models/OtpVerifyModel.dart';
import 'package:facechk_app/Models/StateModel.dart';
import 'package:facechk_app/Models/sendOtpModel.dart';
import 'package:http/http.dart' as http;

class RequestManager {
  Future<SendOtpModel> sendOtp(stringUrl, mobile,purpose) async {
    SendOtpModel updatorderStatusModel = SendOtpModel();
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'mobile': mobile,
      'purpose':purpose,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      // jsonDecode('Update Status:$data');
      updatorderStatusModel = SendOtpModel.fromJson(jsonDecode(data));
      print('otp:${updatorderStatusModel.msg}');

      return updatorderStatusModel;
    } else {
      return updatorderStatusModel;
    }
  }

  Future<OtpVerifyModel> verifyOtp(stringUrl, mobile, otp,purpose) async {
    OtpVerifyModel otpverifymodel = OtpVerifyModel();
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'mobile': mobile,
      'otp': otp,
      'purpose':purpose,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      otpverifymodel = OtpVerifyModel.fromJson(jsonDecode(data));
      print('otp:${otpverifymodel.msg}');
      return otpverifymodel;
    } else {
      return otpverifymodel;
    }
  }
  Future<NewRegistrationModel> newRegistrationApi(stringUrl, visnName, visEmail,visPhone,visdocumentType,visitorAdhdhar,purposeVisitType,
      genderType,myDate,fileName,officerType,takenVaccineType,currentSymptomsType,dayTravelledType,touchCovidPatientType,
      covidBodyTempCtrl,country_id,state_id,city_id,visitorPinNo,address_1,address_2,organizationNameCtrl,
      orga_country_id,orga_state_id,orga_city_id,organizationpinCtrl,department_id,location_id,building_id,visite_duration,
      vehical_type,vehical_reg_num,pan_drive,hard_disk,assets_name,assets_number,assets_brand,fileNameProfile,) async {
    NewRegistrationModel newRegistrationModel = NewRegistrationModel();
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
print('$stringUrl, $visnName, $visEmail,$visPhone,$visdocumentType,$visitorAdhdhar,$purposeVisitType,$genderType,$myDate,$fileName,$officerType,$takenVaccineType,$currentSymptomsType,$dayTravelledType,$touchCovidPatientType,$covidBodyTempCtrl,$country_id,$state_id,$city_id,$visitorPinNo,$address_1,$address_2,$organizationNameCtrl,$orga_country_id,$orga_state_id,$orga_city_id,$organizationpinCtrl,$department_id,$location_id,$building_id,$visite_duration,$vehical_type,$vehical_reg_num,$pan_drive,$hard_disk,$assets_name,$assets_number,$assets_brand');

    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'name': visnName,'email': visEmail,'mobile':visPhone,
      'document_type':visdocumentType,'adhar_no':visitorAdhdhar,'services': purposeVisitType,
      'gender': genderType,'visite_time':myDate,'attachmant':fileName,
      'officer':officerType,'vaccine':takenVaccineType,'symptoms':currentSymptomsType,
      'states':dayTravelledType,'patient':touchCovidPatientType,'temprature':covidBodyTempCtrl,
      'country_id':country_id,'state_id':state_id,'city_id':city_id,
      'pincode':visitorPinNo,'address_1':address_1,'address_2':address_2,
      'organization_name':organizationNameCtrl,'orga_country_id':orga_country_id,'orga_state_id':orga_state_id,
      'orga_city_id':orga_city_id,'orga_pincode':organizationpinCtrl,
      'department_id':department_id,'location_id':location_id,'building_id':building_id,
      'visite_duration':visite_duration,'vehical_type':vehical_type,'vehical_reg_num':vehical_reg_num,
      'carrying_device':'2','pan_drive':pan_drive,'hard_disk':hard_disk,'assets_name':assets_name,
      'assets_number':assets_number,'assets_brand':assets_brand,'visit_type':'single',
      'group_name':'','group_mobile':'','group_id_proof':'','group_gender':'',
      'file_names':'','attachments':'','file_name':fileNameProfile,

    });


    request.headers.addAll(headers);
    print("dsds "+request.toString());
    http.StreamedResponse response = await request.send();
    print("dsdscc "+response.toString());
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      // jsonDecode('Update Status:$data');
      newRegistrationModel = NewRegistrationModel.fromJson(jsonDecode(data));
      print('otp:${newRegistrationModel.message}');
      return newRegistrationModel;
    } else {
      return newRegistrationModel;
    }
  }





  Future<CountryModel> getCountryApi(stringUrl) async {
    CountryModel updatorderStatusModel = CountryModel(date: []);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      // 'mobile': mobile,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      updatorderStatusModel = CountryModel.fromJson(jsonDecode(data));
       print('otp:${updatorderStatusModel.status}');
      return updatorderStatusModel;
    } else {
      return updatorderStatusModel;
    }
  }
  Future<StateModel> getStateApi(stringUrl,country_id) async {
    StateModel stateModel = StateModel(date: []);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'country_id': country_id,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      // jsonDecode('Update Status:$data');
      stateModel = StateModel.fromJson(jsonDecode(data));
      print('otp:${stateModel.status}');
      return stateModel;
    } else {
      return stateModel;
    }
  }
  Future<CityModel> getCityApi(stringUrl,state_id) async {
    CityModel cityModel = CityModel(date: []);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'state_id': state_id,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      // jsonDecode('Update Status:$data');
      cityModel = CityModel.fromJson(jsonDecode(data));
      print('otp:${cityModel.status}');
      return cityModel;
    } else {
      return cityModel;
    }
  }

  Future<LocationModel> getLocationApi(stringUrl) async {
    LocationModel locationModel = LocationModel(date: []);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      // 'mobile': mobile,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      locationModel = LocationModel.fromJson(jsonDecode(data));
      print('otp:${locationModel.status}');
      return locationModel;
    } else {
      return locationModel;
    }
  }

  Future<DetailQrModel> GenerateSlipApi(stringUrl,visit_id ) async {
    DetailQrModel generatemodel = DetailQrModel();
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'visit_id': visit_id,

    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      generatemodel = DetailQrModel.fromJson(jsonDecode(data));
      print('QR :${generatemodel.status}');
      return generatemodel;
    } else {
      return generatemodel;
    }
  }
  Future<GaurdLoginModel> GetGaurdLoginApi(stringUrl,email ) async {
    GaurdLoginModel gaurdLoginMode = GaurdLoginModel();
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(stringUrl));
    request.fields.addAll({
      'email': email,

    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      gaurdLoginMode = GaurdLoginModel.fromJson(jsonDecode(data));
      print('GaurdLogin :${gaurdLoginMode.gaurdLoginModelClass}');
      return gaurdLoginMode;
    } else {
      return gaurdLoginMode;
    }
  }





}

//   Future<http.Response> _apiRequestWithGet(String url) async {
//   var response = await http.get(Uri.parse(url));
//   print(response.body);
//   return response;
// }
