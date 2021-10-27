import 'dart:io';
import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:facechk_app/ApiService/Loading.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Models/GaurdLoginModel.dart';
import 'package:facechk_app/RequestManager/RequestManager.dart';
import 'package:facechk_app/Screen/GaurdVisitorList.dart';
import 'package:flutter/material.dart';

class GaurdLogin extends StatefulWidget {

  //String purpose;

  //GaurdLogin({this.purpose=''});


  _GaurdLoginState createState() => _GaurdLoginState();
}

class _GaurdLoginState extends State<GaurdLogin> {
  bool loading = false;
  List GaurdListDrop = [];

  /*Widget getBody(){
    if(GaurdListDrop.contains(null) || GaurdListDrop.length < 0 ){
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: GaurdListDrop.length,

        itemBuilder: (context,index){
          //return getCard(GaurdListDrop[index]);
        });


  }*/

  bool isVisible = true;



  Widget build(BuildContext context) {
    return initWidget();
  }
  Widget initWidget() {

    //TextEditingController _name = TextEditingController();
    TextEditingController gaurdNameCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    GaurdLoginModel gaurdLoginModel = GaurdLoginModel();

    bool validatedetail() {

      String  pattern = r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$';
      RegExp regExp = new RegExp(pattern);

      var password;
      stdout.write("Enter Your  Password: ");
      password=stdin.readLineSync();


      if (gaurdNameCtrl.text.isEmpty) {
        BaseMethod().VMSToastMassage(' Enter Your Email');
        return false;
      }
     /* else if(password.length>=10 && !password.contains(RegExp(r'\W')) && RegExp(r'\d+\w\d+').hasMatch(password))
      {
      print(" \n\t$password is Valid Password");
      }
      else
      {
      print("\n\t$password is Invalid Password");

      }*/
      return true;

    }
    return  loading
        ?Loading()
        :Scaffold(
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
                                  margin: EdgeInsets.only(top: 35,left: 50,right: 50),
                                  child: Image.asset("images/facechk_logo.png"),
                                  height: 30,
                                ),
                                Container(
                                  // margin: EdgeInsets.only(bottom: 20),
                                  child: Text("Visitor Management System",
                                    style: TextStyle(
                                        fontSize: 20,
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

                      child: Text( "Gaurd Login",
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
                          Visibility (
                              visible: isVisible,
                              child:  Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  controller: gaurdNameCtrl,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: " User Name"),

                                ),
                              )
                          ),

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
                          Visibility (
                            visible: isVisible,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20),
                              alignment: Alignment.center,
                              child: TextFormField(
                                controller: passwordCtrl,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: " Password"),

                              ),

                            ),
                          ),


                        ],
                      ),

                    ),
                  ),


                  SizedBox(
                    height: 30,
                  ),

                  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Visibility (
                            visible: isVisible,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              textColor: Colors.lightBlueAccent,
                              child: Text('Login Here' ),
                              onPressed: () {
                                print('Visitor List ');
                                if (validatedetail()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  var manager = RequestManager();
                                  var data = manager.GetGaurdLoginApi(ApiConstants.Base_Url + RoutePaths.GetGaurdVisitorListUrl,
                                    gaurdNameCtrl.text.toString().trim(),passwordCtrl.text.toString(),
                                  ).then((value) {
                                    print('response: $value');
                                    gaurdLoginModel = value;
                                    print('response:${gaurdLoginModel.status}');
                                    if (gaurdLoginModel.status == 'success') {
                                      setState(() {
                                        loading = false;
                                        isVisible = !isVisible;
                                      });
                                      BaseMethod().VMSToastMassage(gaurdLoginModel.data.toString());





                                      /*  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          GaurdVisitorList(
                                            emailId: gaurdNameCtrl.text.toString(),
                                            purpose: "Gaurd_Status",)));*/
                                    }else if(gaurdLoginModel.status == 'failed'){
                                      setState(() {
                                        loading = false;
                                      });
                                      BaseMethod().VMSToastMassage(gaurdLoginModel.message);

                                    }
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      )),





                ]
            )
        )
    );
  }

}