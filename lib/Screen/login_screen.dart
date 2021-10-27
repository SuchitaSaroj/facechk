
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'visitor_screen.dart';
import 'visitor_forms.dart';

class LoginScreen extends StatefulWidget{
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<LoginScreen>{
  Widget build(BuildContext context){
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
                              colors: [( Color(0XFF4FC3F7)), Color(0XFF81D4FA),Color(0XFFB3E5FC)]
                          )
                      ),
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 50),
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

                                GestureDetector(
                                  onTap: ()=>{
                                  Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> VisitorForms(purpose:'New Visitor Entry')
                                  ))
                                  },
                                  child: Container(

                                    margin: EdgeInsets.only(left: 50, right: 50 ,top:70),
                                    alignment:Alignment.center,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [BoxShadow (
                                        offset: Offset(10,10),
                                        blurRadius: 50,
                                        color: Colors.white,
                                      )],
                                    ),

                                    child:Row(
                                        children:[
                                          Container(
                                            padding: EdgeInsets.only(left: 20,right: 40,top: 5,bottom: 5),
                                            child: Image.asset("images/staff.png",width: 30,),
                                          ),

                                          Text(
                                            "Staff Access",
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20,
                                              color: Colors.blue[900],
                                            ),
                                          )
                                        ]
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                    onTap: ()=>{
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=> VisitorScreen()
                                      ))
                                    },

                                    child: Container(
                                      margin: EdgeInsets.only(left: 50, right: 50 ,top:40),
                                      alignment:Alignment.center,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [BoxShadow (
                                          offset: Offset(0,10),
                                          blurRadius: 50,
                                          color: Colors.white,
                                        )],
                                      ),
                                      child:Row(
                                          children:[
                                            Container(
                                              padding: EdgeInsets.only(left: 20, right: 40,bottom: 5,top:5),
                                              child: Image.asset("images/visit.png",width: 30,),
                                            ),
                                            Text(
                                              "Visitor Access",
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20,
                                                color: Colors.blue[900],
                                              ),
                                            ) ,
                                          ]
                                      ),
                                    )
                                ),
                                SizedBox(
                                  height: 408,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 50, left: 50,bottom: 50),
                                  child: Text(
                                    "Version 1.0",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              ]
                          )
                      )
                  )
                ]
            )
        )
    );

  }
}




