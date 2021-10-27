import 'dart:convert';

import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Models/LocationModel.dart';
import 'package:facechk_app/Screen/visitor_forms.dart';
import 'package:facechk_app/Screen/visitor_page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class VisitorPage2 extends StatefulWidget {
final  String visitorName,documentType,genderType,fileName;
  String visitorEmail,visitorPhone,visitDurationType,purposeVisitType,vehicleType;
  String country_id,state_id,city_id,visitorVehicle,visitorPinNo;
  String visitorAddress,visitorAddress2,visitorAdhdhar;

  VisitorPage2({this.visitorName='',
    this.visitorEmail='',
    this.visitorPhone='',
    this.genderType='',
    this.documentType='',
    this.fileName='',
    this.visitDurationType='',
    this.purposeVisitType='',
    this.vehicleType='',
    this.visitorVehicle='',
    this.country_id='',
    this.state_id='',
    this.city_id='',
    this.visitorPinNo='',
    this.visitorAddress='',
    this.visitorAddress2='',
    this.visitorAdhdhar='',
  });

  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<VisitorPage2> {
  DateTime dateTime;
  final dateFormat=DateFormat('dd-MM-yyyy');
  String myDate='';
  List locatonDrop=[];
  List buildingDrop=[];
  List departmentDrop=[];
  List officerDrop=[];
  List purposeDrop=[];
  String location_id;

  var purposeVisitType = 'Visit';
  final List<String> accountType4 = [
    'Purpose of Visit',
    'Offical',
    'Personal',
    'Adhar Services Complaint',
    'Birth Certi'
  ];

  LocationModel locationModel = LocationModel();
  var currentAccountType = 'Location';
  final List<String> accountType = ['Select Location', 'Noida sector 63'];
  String buildingType;
  String department_id;
  String officerType;
  String purposeofVisit;
  _getLocationList() async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetLocationUrl), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    print('${resBody['date']}');
    setState(() {
      locatonDrop = resBody['date'];
    });
    print('dhfgd $locatonDrop');
  }
 _getBuildingList(String location_id) async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetBuildingUrl), headers: {"Accept": "application/json"},
        body: {
          'location_id':location_id,
        });
    var resBody = json.decode(res.body);
    setState(() {
      buildingDrop = resBody['date'];
    });
    print('Building $buildingDrop');
  }
 _getDepartmentList(String building_id) async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetDepartmentUrl), headers: {"Accept": "application/json"},
        body: {
          'building_id':building_id,
        });
    var resBody = json.decode(res.body);
    setState(() {
      departmentDrop = resBody['date'];
    });
    print('Department $departmentDrop');
  }
 _getOfficerList(String department_id) async {
    var res = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetOfficerUrl), headers: {"Accept": "application/json"},
        body: {
          'department_id':department_id,
        });
    var resBody = json.decode(res.body);
    setState(() {
      officerDrop = resBody['date'];
    });
    print('Officer $officerDrop');
  }
  @override
  void initState() {
    super.initState();

  /*  var manager = RequestManager();
    var data = manager.getLocationApi(ApiConstants.Base_Url+RoutePaths.GetLocationUrl)
        .then((value) {
         locationModel = value;
      print('response:${locationModel.status}');
      if (locationModel.status == 'success') {
        BaseMethod().VMSToastMassage('${locationModel.status}');

        setState(() {
        //  locatonDrop=resBody['date'];
        });
        print('dhfgd $locatonDrop');
      }
    });*/

    _getLocationList();
    print(widget.visitorName.toString()+" "+widget.visitorEmail.toString()+" "+widget.visitorPhone.toString());
    print(widget.visitorPinNo.toString()+" "+widget.visitorAddress.toString()+" "+widget.visitorAddress2.toString());
    print(widget.visitorVehicle.toString()+" "+widget.country_id.toString()+" "+widget.state_id.toString()+" "+widget.city_id.toString());
    print(widget.vehicleType.toString()+" "+widget.documentType.toString()+" "+widget.genderType.toString());
    print("File Name >>2 "+widget.fileName.toString());
  }

  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    TextEditingController pusposeVisitCtrl = TextEditingController();

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
        "Visit Address",
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
                    value: location_id,
                    hint: Text('Select Your Location'),
                    items: locatonDrop.map((e) {
                      return DropdownMenuItem(
                        value:e['id'].toString(),
                        child: Text(e['name'].toString(),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String val) {
                      setState(() {
                        location_id=val;
                        buildingType=null;
                        department_id=null;
                        officerType=null;
                        _getBuildingList(val);
                      });
                    }))),
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
                    value: buildingType,
                    hint: Text('Select Your Building'),
                    items: buildingDrop?.map((ee) {
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
                    onChanged: (String val) {
                      setState(() {
                        buildingType = val ?? "";
                        department_id=null;
                        officerType=null;
                        _getDepartmentList(val);
                      });
                    }))),
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
                    value: department_id,
                    hint: Text('Select Your Department'),
                    items: departmentDrop?.map((e) {
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
                        department_id = val ?? "";
                        officerType=null;
                        _getOfficerList(val);
                      });
                    }))),
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
                    value: officerType,
                    hint: Text('Select Your Officer'),
                    items: officerDrop?.map((ee) {
                      return DropdownMenuItem(
                        value: ee['id'].toString(),
                        child: Text(ee['name'],
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      );
                    })?.toList(),
                    onChanged: (String val) {
                      setState(() {
                        officerType = val ?? "";
                      });
                    }))),
                  ),
              SizedBox(
             height: 8,
             ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top:15,left: 10,right: 10),
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
                            value: accountType4[0],
                            items: accountType4.map((accountType) {
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
                              purposeVisitType = val ?? "";
                            }))),
              ),
              SizedBox(
                height: 20,
              ),
              new GestureDetector(

                onTap: () {
                  print("dgh");
                  showDatePicker(context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050)).then((value) {

                    setState(() {
                      dateTime=value;
                      print( "date "+dateFormat.format(dateTime));
                      myDate=dateFormat.format(dateTime);
                    });

                  });
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10,right: 10),
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Text((dateTime==null)?'Picked Date!!':dateFormat.format(dateTime)),
                    ),
                  ],
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VisitorPage3(location_id:location_id,
                        buildingType:buildingType,department_id:department_id,officerType:officerType,
                        visitorName:widget.visitorName,documentType:widget.documentType,
                        genderType:widget.genderType,fileName:widget.fileName,visitorAdhdhar:widget.visitorAdhdhar,
                        visitorEmail:widget.visitorEmail,visitorPhone:widget.visitorPhone,
                        visitDurationType:widget.visitDurationType,purposeVisitType:widget.purposeVisitType,
                        vehicleType:widget.vehicleType,country_id:widget.country_id,state_id:widget.state_id,
                        city_id:widget.city_id,visitorVehicle:widget.visitorVehicle,visitorPinNo:widget.visitorPinNo,
                        visitorAddress:widget.visitorAddress,visitorAddress2:widget.visitorAddress2,myDate:myDate.toString(),
                    )));
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
