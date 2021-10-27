import 'dart:convert';

import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GaurdVisitorList extends StatefulWidget {
  String emailId;


  GaurdVisitorList({this.emailId=''});



  _GaurdVisitorListState createState() => _GaurdVisitorListState();
}

class _GaurdVisitorListState extends State<GaurdVisitorList> {
  List GaurdListDrop = [];


  _getGaurdList(String email) async {
    var data = await http.post(Uri.parse(ApiConstants.Base_Url+RoutePaths.GetGaurdVisitorListUrl), headers: {"Accept": "application/json"},
        body: {
          'emailId':email,
        });
    if(data.statusCode==200) {
      var resBody = json.decode(data.body)['data'];
      print('skfddd $resBody');
      setState(() {
        GaurdListDrop = resBody;

      });
    }else{
      setState(() {
        GaurdListDrop =[];

      });
    }



  }

  @override
  void initState() {
    super.initState();
    this._getGaurdList('pramod.instaclick@gmail.com');
  }



  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {


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
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset("images/facechk_logo.png"),
                    //height: 300,
                    //width: 300,
                  ),
                  Container(
                    // margin: EdgeInsets.only(bottom: 20),
                    child: Text("Visitor Management System",
                      style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.white
                      ),
                    ),
                  ),
                ]))),
             SizedBox(
              height: 10,
              ),



            Container(

              child: Text( "Visitors List",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                  color: Colors.blue[900]),
                  )),

                  SizedBox(
                    height: 10,

                  ),
                  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RaisedButton(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textColor: Colors.lightBlueAccent,
                            child: Text('Visitors Detail' ),
                            onPressed: () {
                              /*Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => VisitorForms()));*/
                            },
                          ),

                        ],
                      )),


                ]
            )
        )
    );
  }
  Widget getBody(){
    if(GaurdListDrop.contains(null) || GaurdListDrop.length < 0 ){
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: GaurdListDrop.length,

        itemBuilder: (context,index){
          return getCard(GaurdListDrop[index]);
        });

  }
  Widget getCard(item) {
    var id = item['id'];
    //var fullName = item['name'];
   // var Visitor_id = item['Visitor_id'];
   // var status = item['status'];
   // var office = item['office'];
   // var mobile = item['mobile'];
    //var gender = item['gender'];
    //var purpose = item['purpose'];
    var email= item['email'];
   // var visit_id= item['visit_id'];
    //var visit_type = item['visit_type'];
   // var officer_department= item['officer_department'];

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
                      child:  Text("Id.No: "+id,style: TextStyle(fontSize: 13),),),
                    //Text("FullName: "+(fullName ?? ""),style: TextStyle(fontSize: 14),),
                    //Text("Visitor_id"+(Visitor_id ?? ""),style: TextStyle(fontSize: 13),),
                    //Text("Status: "+(status ?? ""),style: TextStyle(fontSize: 13),),
                    //Text("Office: "+(office ?? ""),style: TextStyle(fontSize: 13),),
                    //Text("Mobile: "+(mobile ?? ""),style: TextStyle(fontSize: 13),),
                   // Text("Gender: "+(gender + ""),style: TextStyle(fontSize: 13),),
                   // Text("Purpose: "+(purpose ?? ""),style: TextStyle(fontSize: 13),),
                    Text("Email: "+email,style: TextStyle(fontSize: 13),),
                   // Text("Visit_type: "+(visit_type ?? ""),style: TextStyle(fontSize: 13),),
                   // Text("Officer_departmen: "+(officer_department ?? ""),style: TextStyle(fontSize: 13),),





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
