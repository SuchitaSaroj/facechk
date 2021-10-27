import 'dart:convert';

import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'dart:io' as Io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class VisitorPage3 extends StatefulWidget {
  final String location_id,buildingType,department_id,officerType,pusposeVisitCtrl,visitorName;
 final String visitorEmail,visitorPhone,visitDurationType,purposeVisitType,vehicleType;
 final String country_id,state_id,city_id,visitorVehicle,visitorPinNo,visitorAdhdhar;
  final String visitorAddress,visitorAddress2, documentType,genderType,fileName,myDate;


  VisitorPage3({this.location_id='', this.buildingType='', this.department_id='',
      this.officerType='', this.pusposeVisitCtrl='',this.visitorName='',
      this.visitorEmail='',this.visitorPhone='',this.visitDurationType='',this.purposeVisitType='',
      this.vehicleType='',this.country_id='',this.state_id='',this.city_id='',this.visitorVehicle='',
      this.visitorPinNo='',this.visitorAddress='',this.visitorAddress2='',this.documentType='',
      this.genderType='',this.fileName='',this.visitorAdhdhar='',this.myDate=''});


  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<VisitorPage3> {
  String org_country_id;
  String org_state_id;
  String org_city_id;
  List countryDrop = [];
  List stateDrop =[];
  List cityDrop =[];
  String fileNameProfile='';
  var currentAccountType = 'Country';
  final List<String> accountType = ['Select Organization Country', 'India'];
  var currentAccountType1 = 'State';
  final List<String> accountType1 = [
    'Select Organization State',
    'Uttar Pardesh'
  ];
  var currentAccountType2 = 'City';
  final List<String> accountType2 = [
    'Select Organization City',
    'Noida',
  ];
  var imageSelectProfile = 'cam';
  final List<String> accountType3 = [
    'Image Mode',
    'Camera',
    'Gallery',
  ];
  Widget build(BuildContext context) {

    return initWidget();
  }

 _getCountryList() async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetCountryUrl), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    print('${resBody['date']}');
    setState(() {
      countryDrop = resBody['date'];
    });
  }
   _getStateList(String country_id) async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetStateUrl), headers: {"Accept": "application/json"},
        body: {
          'country_id':country_id,
        });
    var resBody = json.decode(res.body);
    print('state ${resBody['date']}');
    setState(() {
      stateDrop = resBody['date'];
    });

  }
 _getCityList(String state_id) async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetCityUrl), headers: {"Accept": "application/json"},
        body: {
          'state_id':state_id,
        });
    var resBody = json.decode(res.body);
    print('city ${resBody['date']}');
    setState(() {
      cityDrop = resBody['date'];
    });
  }



  @override
  void initState() {
    super.initState();
    _getCountryList();

    print("Navigator data3 "+widget.myDate.toString()+" "+widget.buildingType.toString()+" "+widget.department_id.toString()+" "+widget.officerType.toString()+" "+widget.pusposeVisitCtrl.toString()+" "+widget.visitorName.toString());

  }

  Widget initWidget() {
    TextEditingController organizationNameCtrl = TextEditingController();
    TextEditingController organizationpinCtrl = TextEditingController();

    bool validateImage() {
      if (imageSelectProfile == 'cam') {
        print("image mode");
        BaseMethod().VMSToastMassage("Select Image Mode");

        return false;
      } else if (fileNameProfile == '') {
        BaseMethod().VMSToastMassage("Capture Image first");

        return false;
      } else if (fileNameProfile == '') {
        BaseMethod().VMSToastMassage("Select Image first");
        return false;
      } else if (fileNameProfile.isEmpty) {
        BaseMethod().VMSToastMassage("please select Image ");
        return false;
      }
      return true;
    }


    return Scaffold(
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
        "Visitor Organization Address",
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
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: organizationNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Organization Name:"),
                ),
              )
            ],
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
              value: org_country_id,
              hint: Text('Select Organization Country'),
              items: countryDrop?.map((e) {
                return DropdownMenuItem(
                  value: e['id'].toString(),
                  child: Text(e['name'].toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              })?.toList(),
              onChanged: (String val) {
                setState(() {
                 org_country_id=val?? "";
                 org_state_id=null;
                 org_city_id=null;
                 _getStateList(val);
                });
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 8,
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
              value: org_state_id,
              hint: Text('Select Organization State'),
              items: stateDrop?.map((ee) {
                return DropdownMenuItem(
                  value: ee['id'].toString(),
                  child: Text(ee['name'].toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              })?.toList(),
              onChanged: (String vals) {
                setState(() {
                  org_state_id = vals ?? "";
                  org_city_id=null;
                  _getCityList(vals);
                });
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 8,
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
              value: org_city_id,
              hint: Text('Select Organization City'),
              items: cityDrop?.map((e) {
                return DropdownMenuItem(
                  value: e['id'].toString(),
                  child: Text(e['name'].toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                );
              })?.toList(),
              onChanged: (String val) {
                setState(() {
                  org_city_id = val ?? "";
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
                          controller: organizationpinCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Organization Pin Code:"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      SizedBox(
        height: 10,
      ),
      Container(
          child: Text(
        "Upload Your Photo",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.blue[900]),
      )),
      SizedBox(
        height: 20,
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
                  imageSelectProfile = val ?? "";

              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Center(
        child: Form(
            child: Row(children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 60, //MediaQuery.of(context).size.width*.200,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: RaisedButton(
                  child: Text(
                    'Select Image',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () async {
                    if(imageSelectProfile=='Gallery'){
                      fileNameProfile='';
                      PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);
                      if (image != null) {
                        final bytes =Io.File(image.path).readAsBytesSync();
                        String img64 = base64Encode(bytes);
                        fileNameProfile=img64.toString();
                        print (fileNameProfile);
                      }

                    }else if(imageSelectProfile=='Camera'){
                      fileNameProfile='';
                      PickedFile image = await ImagePicker().getImage(source: ImageSource.camera);
                      if (image != null) {
                        final bytes =Io.File(image.path).readAsBytesSync();
                        String img64 = base64Encode(bytes);
                        fileNameProfile=img64.toString();
                        print (fileNameProfile);
                      }
                    }else{
                      BaseMethod().VMSToastMassage('Select Image Mode');
                    }
                  })),
        ])),
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
              onPressed: () async{
                if(validateImage()) {
                  Navigator.pushNamed(context, '/visitorPage4',
                      arguments: {
                        'location_id': widget.location_id,
                        'buildingType': widget.buildingType,
                        'department_id': widget.department_id,
                        'officerType': widget.officerType,
                        'pusposeVisitCtrl': widget.pusposeVisitCtrl,
                        'visitorName': widget.visitorName,
                        'visitorEmail': widget.visitorEmail,
                        'visitorPhone': widget.visitorPhone,
                        'visitDurationType': widget.visitDurationType,
                        'purposeVisitType': widget.purposeVisitType,
                        'vehicleType': widget.vehicleType,
                        'country_id': widget.country_id,
                        'state_id': widget.state_id,
                        'city_id': widget.city_id,
                        'visitorVehicle': widget.visitorVehicle,
                        'organizationpinCtrl': organizationpinCtrl.text
                            .toString(),
                        'visitorPinNo': widget.visitorPinNo,
                        'visitorAddress': widget.visitorAddress,
                        'visitorAddress2': widget.visitorAddress2,
                        'documentType': widget.documentType,
                        'genderType': widget.genderType,
                        'fileName': widget.fileName,
                        'organizationNameCtrl': organizationNameCtrl.text
                            .toString(),
                        'org_country_id': org_country_id.toString(),
                        'org_state_id': org_state_id.toString(),
                        'org_city_id': org_city_id.toString(),
                        'fileNameProfile': fileNameProfile.toString(),
                        'visitorAdhdhar': widget.visitorAdhdhar.toString(),
                        'myDate': widget.myDate.toString(),
                      }

                  );
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              textColor: Colors.white,
              child: Text("Next"),
            ),
          ]))
    ])));
  }
}
