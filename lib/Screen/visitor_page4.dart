
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisitorPage4 extends StatefulWidget{
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<VisitorPage4> {

  Widget build(BuildContext context) {
    return initWidget();
  }

  @override
  void initState() {
    super.initState();
  }
  Widget initWidget() {
    TextEditingController visitAssetInfoNameCtrl = TextEditingController();
    TextEditingController visitAssetInfoSerialNoCtrl = TextEditingController();
    TextEditingController visitAssetInfoBrandCtrl = TextEditingController();
    TextEditingController visitAssetInfoPanDriverCtrl = TextEditingController();
    TextEditingController visitAssetInfoHardDiskCtrl = TextEditingController();
    final routeData=ModalRoute.of(context).settings.arguments as Map<String,String>;
    print("Navigator data4 ${routeData['fileNameProfile']}");

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                (Color(0XFF4FC3F7)),
                                Color(0XFF81D4FA),
                                Color(0XFFB3E5FC)
                              ]
                          )
                      ),
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 35 ,left: 50,right: 50),
                                  child: Image.asset("images/facechk_logo.png"),
                                  height: 30,
                                ),
                                SizedBox(
                                  height:2,
                                ),
                                Container(
                                    child: Text(
                                      "Visitor Management System",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                              ]
                          )
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Text(
                        "Visitor Asset Informations",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue[900]
                        ),
                      )
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Form(
                      child: Column(
                        children:<Widget> [
                          Container(
                            margin: EdgeInsets.only(left:10, right: 10 ),
                            alignment:Alignment.center,
                            child:TextFormField(
                              controller: visitAssetInfoNameCtrl,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Name:"),
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
                        children:<Widget> [
                          Container(
                            margin: EdgeInsets.only(left:10, right: 10 ),
                            alignment:Alignment.center,
                            child:     TextFormField(
                              controller: visitAssetInfoSerialNoCtrl,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Serial Number:"),
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
                        children:<Widget> [
                          Container(
                            margin: EdgeInsets.only(left:10, right: 10 ),
                            alignment:Alignment.center,
                            child:     TextFormField(
                              controller: visitAssetInfoBrandCtrl,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Brand:"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // add a tag (Are you carrying storage device)
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Form(
                      child: Column(
                        children:<Widget> [
                          Container(
                            margin: EdgeInsets.only(left:10, right: 10 ),
                            alignment:Alignment.center,
                            child:     TextFormField(
                              controller: visitAssetInfoPanDriverCtrl,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "No.Of Pan Drivers:"),
                              keyboardType: TextInputType.number,
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
                        children:<Widget> [
                          Container(
                            margin: EdgeInsets.only(left:10, right: 10 ),
                            alignment:Alignment.center,
                            child:     TextFormField(
                              controller: visitAssetInfoHardDiskCtrl,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "No. Of Hard Disk:"),
                              keyboardType: TextInputType.number,
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
                          mainAxisSize: MainAxisSize.max ,
                          children:[
                            RaisedButton(
                              color: Colors.blueGrey,
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              ) ,
                              textColor: Colors.white,
                              child: Text("Back"),

                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RaisedButton(
                              color: Colors.blue[900],
                              onPressed: (){
                                Navigator.pushNamed(context,'/visitorPage5',
                                arguments: {'location_id':routeData['location_id'],'buildingType':routeData['buildingType'],'department_id':routeData['department_id'],
                                  'officerType':routeData['officerType'],'pusposeVisitCtrl':routeData['pusposeVisitCtrl'],'visitorName':routeData['visitorName'],
                                  'visitorEmail':routeData['visitorEmail'],'visitorPhone':routeData['visitorPhone'],'visitDurationType':routeData['visitDurationType'],
                                  'purposeVisitType':routeData['purposeVisitType'],'vehicleType':routeData['vehicleType'],'country_id':routeData['country_id'],
                                  'state_id':routeData['state_id'],'city_id':routeData['city_id'],'visitorVehicle':routeData['visitorVehicle'],'organizationpinCtrl':routeData['organizationpinCtrl'],
                                  'visitorPinNo':routeData['visitorPinNo'],'visitorAddress':routeData['visitorAddress'],'visitorAddress2':routeData['visitorAddress2'],
                                  'documentType':routeData['documentType'],'genderType':routeData['genderType'],'fileName':routeData['fileName'],'visitorAdhdhar':routeData['visitorAdhdhar'],
                                  'organizationNameCtrl':routeData['organizationNameCtrl'],'org_country_id':routeData['org_country_id'],'org_state_id':routeData['org_state_id'],
                                  'org_city_id':routeData['org_city_id'],'fileNameProfile':routeData['fileNameProfile'],'visitorAdhdhar':routeData['visitorAdhdhar'],
                                  'visitAssetInfoNameCtrl':visitAssetInfoNameCtrl.text.toString(),'visitAssetInfoSerialNoCtrl':visitAssetInfoSerialNoCtrl.text.toString(),'visitAssetInfoBrandCtrl':visitAssetInfoBrandCtrl.text.toString(),
                                  'visitAssetInfoPanDriverCtrl':visitAssetInfoPanDriverCtrl.text.toString(),'visitAssetInfoHardDiskCtrl':visitAssetInfoHardDiskCtrl.text.toString(),'myDate':routeData['myDate'],
                                }
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ) ,
                              textColor: Colors.white,
                              child: Text("Next"),

                            ),
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}