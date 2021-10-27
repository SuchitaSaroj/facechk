import 'dart:convert';

import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Models/CityModel.dart';
import 'package:facechk_app/Models/CountryModel.dart';
import 'package:facechk_app/Models/StateModel.dart';
import 'package:facechk_app/Screen/visitor_page2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' as Io;
import 'package:http/http.dart' as http;
import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:image_picker/image_picker.dart';


class VisitorForms extends StatefulWidget {
  String purpose;



  VisitorForms({this.purpose='',});


  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<VisitorForms> {
  GlobalKey<FormState> formkey=GlobalKey();
  String country_id;
  String state_id;
  String city_id;
  CountryModel countryData= CountryModel();
  StateModel stateData= StateModel();
  CityModel cityData= CityModel();
  List countryDrop = [];
  List stateDrop =[];
  List cityDrop =[];
  bool disableDropDown=true;
  bool disableDropDownthird=true;

  String title='';
String fileName='';
  var genderType = 'Gender';
  final List<String> accountType = ['Select Gender', 'Male', 'Female', 'Other'];
  var documentType = 'Document';
  final List<String> accountType1 = [
    'Select Document',
    'dl',
    'Adhar Card',
    'Govt Identity Proof'
  ];
  var vehicleType = 'Vechical type';
  final List<String> accountType2 = [
    'Select Vechical Type',
    '2 Wheeler',
    '4 Wheeler'
  ];
  var visitDurationType = 'Visit Duration';
  final List<String> accountType3 = [
    'Visit Duration',
    '15 Min',
    '30 Min',
    '45 Min',
    '1 Hour'
  ];


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
  }

  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    TextEditingController visitorNameCtrl = TextEditingController();
    TextEditingController visitorEmailCtrl = TextEditingController();
    TextEditingController visitorPhoneCtrl = TextEditingController();
    TextEditingController visitorAdhdharCtrl = TextEditingController();
    TextEditingController visitorVehicleCtrl=TextEditingController();
    TextEditingController visitorPinNoCtrl = TextEditingController();
    TextEditingController visitorAddressCtrl = TextEditingController();
    TextEditingController visitorAddress2Ctrl = TextEditingController();

    bool validatedetail() {


      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(patttern);
      if (visitorNameCtrl.text.isEmpty) {
        BaseMethod().VMSToastMassage('Enter Visitor Name');
        return false;
      } else if (visitorPhoneCtrl.text.length == 0) {
        BaseMethod().VMSToastMassage('Enter Mobile No');
        return false;
      } else if (!regExp.hasMatch(visitorPhoneCtrl.text)) {
        BaseMethod().VMSToastMassage('Enter valid mobile No');
        return false;
      }else if(fileName==''){
        BaseMethod().VMSToastMassage('Select Document');
        return false;
      }
      return true;
    }
    return Scaffold(
        body:SingleChildScrollView(
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
                              margin: EdgeInsets.only(top: 35, left: 80, right: 80),
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

                  child: Text( "New Visitor Entry",
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
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorNameCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: " Visitor Name:"),
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
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorEmailCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Visitor Email  (Optional):"),
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
                child: Form(

                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorPhoneCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Visitor Phone:"),

                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                  padding: const EdgeInsets.only(left: 20,right: 20),
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
                          genderType = val ?? "";
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
                    padding: const EdgeInsets.only(top:10,left: 20,right: 20),
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
                            value: accountType1[0],
                            items: accountType1.map((accountType) {
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
                                documentType = val ?? "";
                            }))),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorAdhdharCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Document Number:"),

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
                child: Form(
                    child: Row(children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 10),
                          height: 60, //MediaQuery.of(context).size.width*.200,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: RaisedButton(
                              child: Text(
                                'Attached Document',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              color: Colors.white,
                              onPressed: () async {
                                PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);
                                if (image != null) {
                                  final bytes =Io.File(image.path).readAsBytesSync();
                                  String img64 = base64Encode(bytes);
                                  fileName=img64.toString();
                                  print (fileName);
                                }
                              })),
                    ])),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top:10,left: 20,right: 20),
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
                                visitDurationType = val ?? "";
                            }))),
              ),

              SizedBox(
                height: 8,
              ),
             Center(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
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
                                vehicleType = val ?? "";
                            }))),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorVehicleCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Vehicle Registration Number:"),
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
                  padding: const EdgeInsets.only(left: 20,right: 20),
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
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        value: country_id,
                        hint: Text('Select Your Countory'),
                        onChanged: (String newVal) {
                            country_id = newVal ?? "";
                            state_id=null;
                            city_id=null;
                            print(newVal);
                            _getStateList(newVal);

                        },
                        items: countryDrop?.map((e) {
                          return DropdownMenuItem(
                            value: e['id'].toString(),
                            child: new Text(e['name'].toString()),
                          );
                        })?.toList(),
                      )),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top:10,left: 20,right: 20),
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
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          value: state_id,
                          hint: Text('Select Your State'),
                          onChanged: (String val){
                            setState(() {
                              state_id=val ?? "";
                              city_id=null;
                              _getCityList(val);
                              print(val);
                            });
                          },
                          items: stateDrop?.map((ee) {
                            return DropdownMenuItem<String>(
                              value: ee['id'].toString(),
                              child: new Text(ee['name'].toString(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          })?.toList(),
                        ))),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top:10,left: 20,right: 20),
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
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          value: city_id,
                          hint: Text('Select Your City'),
                          onChanged: (String valCity) {
                            setState(() {
                              city_id=valCity ?? "";
                              print(valCity);
                            });
                          },
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
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorPinNoCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Pincode:"),
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
                height: 20,
              ),
              Center(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorAddressCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Address-1:"),
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
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: visitorAddress2Ctrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Address-2:"),
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
                            if (validatedetail()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => VisitorPage2(visitorName:visitorNameCtrl.text.toString(),
                                    visitorEmail: visitorEmailCtrl.text.toString(),
                                    visitorPhone: visitorPhoneCtrl.text.toString(),
                                    genderType:genderType,documentType:documentType,fileName:fileName,
                                    visitDurationType:visitDurationType,visitorAdhdhar:visitorAdhdharCtrl.text.toString(),
                                    vehicleType: vehicleType, visitorVehicle:visitorVehicleCtrl.text.toString(),
                                    country_id: country_id,state_id: state_id,city_id: city_id,
                                    visitorPinNo: visitorPinNoCtrl.text.toString(),
                                    visitorAddress:visitorAddressCtrl.text.toString(),
                                    visitorAddress2:visitorAddress2Ctrl.text.toString(),
                                  )));
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