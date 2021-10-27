
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:facechk_app/Screen/login_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  State<StatefulWidget> createState() =>InitState();
}

class InitState extends State<SplashScreen>{

  void initState() {
    Permission.camera.request();
    Permission.storage.request();
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }
  Widget build(BuildContext context) {
    return initWidget();
  }
  Widget initWidget(){
    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [( Color(0XFF4FC3F7)), Color(0XFF81D4FA),Color(0XFFB3E5FC),Color(0xFF03A9F4)],
              )
          ),
          child: ListView(
            children: [

              Center(

                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50 ,top:70),
                    alignment:Alignment.center,
                    height: 70,
                    width: 500,
                    child: Image.asset("images/facechk_logo.png"),
                  )
              ),

              Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20 ,top: 40),
                    alignment:Alignment.center,
                    child: Column(
                      children:[ RichText(
                        text: TextSpan(
                          text:
                          "Visitor Management System",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                        SizedBox(height: 15,),
                        Text("Get Safe & TouchLess Entry",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.blue[900],
                              fontSize: 20,
                            ))
                      ],
                    ),
                  )),
              SizedBox(height: 40,),
              Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20,right: 20,top:50,bottom: 20),
                    alignment:Alignment.center,
                    child: Image.asset("images/visitor_logo.png"),
                  )
              )
            ],
          ),
        )
    );
  }
}