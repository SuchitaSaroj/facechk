import 'dart:convert';

import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Screen/DetailWithQrCode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KnowStatusList extends StatefulWidget {
  String mobileNo;

  KnowStatusList({this.mobileNo=''});

  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<KnowStatusList> {
  List KnowListDrop = [];
  //List visitorListDrop = [];
  bool isLoading = false;
  _getKnowList(String mobile) async {
    setState(() {
      isLoading = true;
    });
    var data = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetKnowVisitListUrl), headers: {"Accept": "application/json"},
        body: {
          'mobile':mobile,
        });
    if(data.statusCode==200) {
      var resBody = json.decode(data.body)['data'];
      print('dfdf $resBody');
      setState(() {
        KnowListDrop = resBody;
        isLoading = false;
      });
    }else{
      setState(() {
        KnowListDrop =[];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this._getKnowList('8931909840');
  }

  Widget build(BuildContext context) {

    return new Scaffold(
        body:Container(
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
                        "Know Status Details",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue[900]),
                      )),

                  Flexible(child:getBody())



                ]

            )));
  }

  Widget getBody(){
    if(KnowListDrop.contains(null) || KnowListDrop.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: KnowListDrop.length,

        itemBuilder: (context,index){
          return getCard(KnowListDrop[index]);
        });

  }
  Widget getCard(item) {
    var id_no = item['id_no'];
    var fullName = item['name'];
    var Visitor_id = item['Visitor_id'];
    var status = item['status'];
    var office = item['office'];
    var mobile = item['mobile'];
    var gender = item['gender'];
    var purpose = item['purpose'];
    var email= item['email'];
     var visit_id= item['visit_id'];
    var visit_type = item['visit_type'];
    var officer_department= item['officer_department'];

    //visitorListDrop=item['visitor_group'];
    //var user_id = item['user_id'];
    // print('mshrgd'+visitorListDrop.toString());
    return Card(

      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(


          title: Row(
            children: <Widget>[
              SizedBox(width: 20,),
              Expanded(child:
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width-140,
                      child:  Text("Id.No: "+(id_no ?? ""),style: TextStyle(fontSize: 13),),),
                    Text("FullName: "+(fullName ?? ""),style: TextStyle(fontSize: 14),),
                    Text("Visitor_id"+(Visitor_id ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Status: "+(status ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Office: "+(office ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Mobile: "+(mobile ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Gender: "+(gender + ""),style: TextStyle(fontSize: 13),),
                    Text("Purpose: "+(purpose ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Email: "+(email ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Visit_type: "+(visit_type ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Officer_departmen: "+(officer_department ?? ""),style: TextStyle(fontSize: 13),),


                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            textColor: Colors.lightBlueAccent,
                            child: Text('View' ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => DetailWithQrCode(visit_id:visit_id.toString())));
                            },
                          ),
                        ),
                      ],
                    ),


                  ],

                ),


              )),



            ],
          ),
        ),
      ),
    );


  }


}

/*ListView.builder(
    padding: EdgeInsets.all(0.0),
    itemCount: visitorListDrop.length,
    itemBuilder: (context, index) {
      return getCard(visitorListDrop[index]);

    return ListTile(
    title: Text(visitorListDrop[index], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),

    );
    }




       ),*/







/*
    ListView.builder(itemCount: visitorListDrop.length,
                    itemBuilder:  (context, index) {
                      var secName =visitorListDrop[index]['group_name'];
                      print('group_name'+visitorListDrop.toString());

                      return Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text('secName $secName'),

                      );
                    },




                  ),*/