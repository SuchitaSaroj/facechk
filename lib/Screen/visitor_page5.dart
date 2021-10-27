import 'dart:convert';

import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:facechk_app/ApiService/Loading.dart';
import 'package:facechk_app/Models/NewRegistrationModel.dart';
import 'package:facechk_app/RequestManager/RequestManager.dart';
import 'package:facechk_app/Screen/DetailWithQrCode.dart';
import 'package:facechk_app/Screen/visitor_page4.dart';
import 'package:facechk_app/Screen/visitor_page6.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Screen/visitor_page3.dart';
import 'package:facechk_app/Screen/visitor_page5.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class VisitorPage5 extends StatefulWidget {
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<VisitorPage5> {
  List sympttomsDrop = [];
  bool loading = false;
  String takenVaccineType = 'Have you taken the vaccine?';
  final List<String> accountType = ['Have you taken the vaccine?', 'Yes', 'No'];
  String currentSymptomsType;
  var dayTravelledType =
      'Have you travelled in past 14 days to any of the state?';
  final List<String> accountType2 = [
    'Have you travelled in past 14 days to any of the state?',
    'Yes',
    'No'
  ];
  var touchCovidPatientType = 'Visit';
  final List<String> accountType3 = [
    'Did you get in touch with any Covid positive patient ?',
    'Yes',
    'No',
  ];
  _getSymptomsList() async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetSymptomsUrl), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    print('${resBody['myDate']}');
    setState(() {
      sympttomsDrop = resBody['date'];
    });
  }


  @override
  void initState() {
    super.initState();
    _getSymptomsList();
  }

  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    NewRegistrationModel newRegistrationModel=NewRegistrationModel();
    TextEditingController covidBodyTempCtrl = TextEditingController();
    final routeData=ModalRoute.of(context).settings.arguments as Map<String,String>;
    print("Navigator data5 "+routeData['fileNameProfile']);

    return  loading
        ?Loading()
        :Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                (Color(0XFF4FC3F7)),
                Color(0XFF81D4FA),
                Color(0XFFB3E5FC)
              ])),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                  margin: EdgeInsets.only(top: 35, left: 50, right: 50),
                  child: Image.asset("images/facechk_logo.png"),
                  height: 30,
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                    child: Text(
                  "Visitor Management System",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                )),
              ]))),
      SizedBox(
        height: 10,
      ),
      Container(
          child: Text(
        "Covid Declaration Form",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.blue[900]),
      )),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.only(
              left: 7,
              right: 7,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonFormField(
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              value: accountType[0],
              items: accountType.map((accountType) {
                return DropdownMenuItem(
                  value: accountType,
                  child: Text(
                    accountType,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String val) {
                setState(() {
                  takenVaccineType = val ?? "";
                });
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.only(
              left: 7,
              right: 7,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonFormField(
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              value: currentSymptomsType,
              hint: Text('Are you currently experiencing any following symptoms?'),
              items: sympttomsDrop?.map((e) {
                return DropdownMenuItem(
                  value: e['id'].toString(),
                  child: Text(e['name'],
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              })?.toList(),
              onChanged: (String val) {
                setState(() {
                  currentSymptomsType = val ?? "";
                });
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.only(
              left: 7,
              right: 7,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonFormField(
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              value: accountType2[0],
              items: accountType2.map((accountType) {
                return DropdownMenuItem(
                  value: accountType,
                  child: Text(
                    accountType,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String val) {
                setState(() {
                  dayTravelledType = val ?? "";
                });
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.only(
              left: 7,
              right: 7,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonFormField(
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              value: accountType3[0],
              items: accountType3.map((accountType) {
                return DropdownMenuItem(
                  value: accountType,
                  child: Text(
                    accountType,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String val) {
                setState(() {
                  touchCovidPatientType = val ?? "";
                });
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: covidBodyTempCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Current Body Temperature"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
            RaisedButton(
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              textColor: Colors.white,
              child: Text("Back"),
            ),
            SizedBox(
              width: 15,
            ),
            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                print('hlllo');
                String visName=routeData['visitorName'];
                String visEmail=routeData['visitorEmail'];
                String visPhone=routeData['visitorPhone'];
                String visdocumentType=routeData['documentType'];
                String visitorAdhdhar=routeData['visitorAdhdhar'];
                String purposeVisitType=routeData['purposeVisitType'];
                String genderType=routeData['genderType'];
                String myDate=routeData['myDate'];
                String fileName=routeData['fileName'];
                 String officerType=routeData['officerType'];

                 String country_id=routeData['country_id'];
                String state_id=routeData['state_id'];
                String city_id=routeData['city_id'];
               String pincode=routeData['visitorPinNo'];
              String address_1=routeData['visitorAddress'];
                String address_2=routeData['visitorAddress2'];
               String organizationNameCtrl=routeData['organizationNameCtrl'];
                String orga_country_id=routeData['org_country_id'];
                String orga_state_id=routeData['org_state_id'];
                String orga_city_id=routeData['org_city_id'];
               String organizationpinCtrl=routeData['organizationpinCtrl'];
              String department_id=routeData['department_id'];
                String location_id=routeData['location_id'];
                String building_id=routeData['buildingType'];
                String visite_duration=routeData['visitDurationType'];
                String vehical_type=routeData['vehicleType'];
               String vehical_reg_num=routeData['visitorVehicle'];
                  String  pan_drive=routeData['visitAssetInfoPanDriverCtrl'];
               String hard_disk=routeData['visitAssetInfoHardDiskCtrl'];
              String assets_name=routeData['visitAssetInfoNameCtrl'];
                String assets_number=routeData['visitAssetInfoHardDiskCtrl'];
                String assets_brand=routeData['visitAssetInfoNameCtrl'];
                String fileNameProfile=routeData['fileNameProfile'];

              setState(() {
               loading=true;
                   });

                var manager = RequestManager();
                var data = manager.newRegistrationApi(ApiConstants.Base_Url+RoutePaths.NewVisitUrl,visName,visEmail,visPhone,visdocumentType,visitorAdhdhar,
                    purposeVisitType,genderType,myDate,fileName,officerType,takenVaccineType,currentSymptomsType,dayTravelledType,
                    touchCovidPatientType,covidBodyTempCtrl.text.toString(),country_id,state_id,city_id,pincode,address_1,address_2,
                    organizationNameCtrl,orga_country_id,orga_state_id,orga_city_id,organizationpinCtrl,department_id,
                    location_id,building_id,visite_duration,vehical_type,vehical_reg_num,pan_drive,hard_disk,assets_name,
                    assets_number,assets_brand,fileNameProfile)
                    .then((value) {
                  print('response:$value');
                  newRegistrationModel = value;
                  print('response:${newRegistrationModel.message}');
                  if (newRegistrationModel.status == 'success') {
                    var visitor_id=newRegistrationModel.visitorId.toString();
                    setState(() {
                      loading=false;
                    });
                    BaseMethod().VMSToastMassage('${newRegistrationModel.message}');

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailWithQrCode(visit_id: visitor_id.toString())));


                  }else if(newRegistrationModel.status == 'failed'){
                    setState(() {
                      loading=false;
                    });
                    print('msg : ${newRegistrationModel.message}');
                    BaseMethod().VMSToastMassage('${newRegistrationModel.message}');
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              textColor: Colors.white,
              child: Text("Submit"),
            ),
          ]))
    ])));
  }
}
