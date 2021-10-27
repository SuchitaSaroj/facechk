import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:facechk_app/ApiService/Loading.dart';

import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Models/sendOtpModel.dart';

import 'package:facechk_app/RequestManager/RequestManager.dart';
import 'package:facechk_app/Screen/otp_page.dart';
import 'package:facechk_app/Screen/visitor_screen.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendOtp extends StatefulWidget {
  final String mytitle;
  const SendOtp({Key key, this.mytitle}) : super(key: key);

  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SendOtp> {
  bool loading = false;
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    TextEditingController mobileController = TextEditingController();

    SendOtpModel sendOtpModel = SendOtpModel();
    bool validateMobile(){
      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(patttern);
      if (mobileController.text.length == 0) {
        BaseMethod().VMSToastMassage('Enter Your  Mobile No');
        return false;
      } else if (!regExp.hasMatch(mobileController.text)) {
        BaseMethod().VMSToastMassage('Enter valid mobile No');
        return false;
      }
      return true;
    }

    return loading
        ? Loading()
        : Scaffold(
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
                    widget.mytitle.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue[900]),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                    "Enter Your Mobile Number",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueGrey,
                    ),
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
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Mobile Number:"),
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
                            if(validateMobile()) {
                              print('hlllo');
                              setState(() {
                                loading = true;
                                print("loading true");
                              });
                              // print(ApiConstants.Base_Url + RoutePaths.SendOtpUrl);
                              var manager = RequestManager();
                              var data = manager
                                  .sendOtp(
                                  ApiConstants.Base_Url + RoutePaths.SendOtpUrl,
                                  mobileController.text.toString(),
                                  widget.mytitle.toString())
                                  .then((value) {
                                print('response---:$value');
                                sendOtpModel = value;
                                print('response:${sendOtpModel.msg}');
                                setState(() {
                                  loading=false;
                                });
                                if (sendOtpModel.msg == 'Otp send successfully') {
                                  BaseMethod().VMSToastMassage(sendOtpModel.msg);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OtpPage(
                                                  mobilenumber:
                                                  mobileController.text.toString(),
                                                  purpose: widget.mytitle
                                                      .toString())));
                                }
                              });
                            }},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          textColor: Colors.white,
                          child: Text("Submit"),
                        ),
                      ]))
            ])));
  }
}
