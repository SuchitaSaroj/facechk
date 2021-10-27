import 'package:facechk_app/Screen/gaurd_login.dart';
import 'package:facechk_app/Screen/login_screen.dart';
import 'package:facechk_app/Screen/qrcode.dart';
import 'package:facechk_app/Screen/send_otp.dart';
import 'package:flutter/material.dart';
import 'known_status.dart';
import  'visitor_forms.dart';


class VisitorScreen extends StatefulWidget{
  State<StatefulWidget> createState() => InitState();
}
class InitState extends State<VisitorScreen>{
  Widget build (BuildContext context) {
    return initWidget();
  }
  Widget initWidget(){
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
                                  child: Text(
                                    "Visitor Management System",
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
                                        builder: (context)=>SendOtp(mytitle: 'New_visit',)
                                    ))
                                  },
                                  child: Container(

                                    margin: EdgeInsets.only(left: 50, right: 50 ,top:70),
                                    alignment:Alignment.center,
                                    height: 40,
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
                                            child: Image.asset("images/newvisitors.jpg"),
                                          ),

                                          Text(
                                            " New Visit",
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
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
                                          builder: (context)=>SendOtp(mytitle: 're_visit',)
                                      ))
                                    },

                                    child: Container(
                                      margin: EdgeInsets.only(left: 50, right: 50 ,top:30),
                                      alignment:Alignment.center,
                                      height: 40,
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
                                              child: Image.asset("images/revisitors.png"),
                                            ),
                                            Text("Re-Visit",
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                              ),
                                            ) ,
                                          ]
                                      ),
                                    )
                                ),

                                GestureDetector(
                                    onTap: ()=>{
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=> KnownStatus()
                                      ))
                                    },

                                    child: Container(
                                      margin: EdgeInsets.only(left: 50, right: 50 ,top:30),
                                      alignment:Alignment.center,
                                      height: 40,
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
                                              padding: EdgeInsets.only(left: 20, right: 30,bottom: 5,top:5),
                                              child: Image.asset("images/k.png"),
                                            ),
                                            Text("   Know Visit Status",
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                              ),
                                            ) ,
                                          ]
                                      ),
                                    )
                                ),


                                GestureDetector(
                                    onTap: ()=>{
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=> QRCode(),
                                      ))
                                    },

                                    child: Container(
                                      margin: EdgeInsets.only(left: 50, right: 50 ,top:30),
                                      alignment:Alignment.center,
                                      height: 40,
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
                                              padding: EdgeInsets.only(left: 20, right: 30,bottom: 5,top:5),
                                              child: Image.asset("images/qr code.jpg"),
                                            ),
                                            Text("   QR Scanner",
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                              ),
                                            ) ,
                                          ]
                                      ),
                                    )
                                ),



                                GestureDetector(
                                  onTap: ()=>{
                                   Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=> GaurdLogin(),
                                    ))
                                  },
                                  child: Container(

                                    margin: EdgeInsets.only(left: 50, right: 50 ,top:30),
                                    alignment:Alignment.center,
                                    height: 40,
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
                                            child: Image.asset("images/newvisitors.jpg"),
                                          ),

                                          Text(
                                            " Gaurd Login",
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              color: Colors.blue[900],
                                            ),
                                          )
                                        ]
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 318,
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












      /*body: SingleChildScrollView(
            child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [(new Color(0XFF81D4FA)),new Color(0XFF4FC3F7),Color(0XFFB3E5FC)],
                  )
              ),
              child: Column(
                  children: [
              Center(
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
                      child: Text(
                        "Visitor Management System",
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
                            builder: (context)=>SendOtp()
                        ))
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50 ,top:70),
                        alignment:Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow (
                            offset: Offset(0,10),
                            blurRadius: 50,
                            color: Color(0xFF0D47A1),
                          )],
                        ),
                        child:Row(
                            children:[
                              Container(
                                padding: EdgeInsets.only(left: 20,right: 18,top: 5,bottom: 5),
                                child: Image.asset("images/newvisitors.jpg"),
                              ),
                              Text(
                                "New Visit",
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
                        Navigator.of(context).pop(),
                        Navigator.push(context,MaterialPageRoute(builder:(builder)=>SendOtp()
                        ),
                        )
                      },


                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50 ,top:30),
                        alignment:Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow (
                            offset: Offset(0,10),
                            blurRadius: 50,
                            color: Color(0xFF0D47A1),
                          )],
                        ),
                        child:Row(
                            children:[
                              Container(
                                padding: EdgeInsets.only(left: 20,right: 18,top: 5,bottom: 5),
                                child: Image.asset("images/revisitors.png"),
                              ),
                              Text(
                                "Re-Visit",
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
                            builder: (context)=> KnownStatus()
                        ))

                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50 ,top:30),
                        alignment:Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow (
                            offset: Offset(0,10),
                            blurRadius: 50,
                            color: Color(0xFF0D47A1),
                          )],
                        ),
                        child:Row(
                            children:[
                              Container(
                                padding: EdgeInsets.only(left: 20,right: 18,top: 5,bottom: 5),
                                child: Image.asset("images/k.png"),
                              ),
                              Text(
                                "Know Visit Status",
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
                      // Navigator.push(context, MaterialPageRoute(
                      // builder: (context)=> QRCode(),
                      // ))
                        },
                      child: Container(
                          margin: EdgeInsets.only(left: 50, right: 50 ,top:30,),
                          alignment:Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow (
                              offset: Offset(0,10),
                              blurRadius: 60,
                              color: Color(0xFF0D47A1),
                            )],
                          ),
                          child:Row(
                                    children:[
                                Container(
                                padding: EdgeInsets.only(left: 20,right: 18,top: 5,bottom: 5),
                                child: Image.asset("images/qr code.jpg"),
                              ),
                           Text(
                            "QR Scanner",
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

                    SizedBox(
                      height: MediaQuery.of(context).size.height*.30,
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 50, left: 50,bottom: 30),
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
              ),
            ),

        ]
    ),
            ),


    ])));*/

);
  }
}