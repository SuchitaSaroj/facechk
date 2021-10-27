import 'package:facechk_app/ApiService/BaseMethod.dart';
import 'package:facechk_app/ApiService/Loading.dart';
import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Models/OtpVerifyModel.dart';
import 'package:facechk_app/Models/sendOtpModel.dart';
import 'package:facechk_app/RequestManager/RequestManager.dart';
import 'package:facechk_app/Screen/KnowStatusList.dart';
import 'package:facechk_app/Screen/visitor_forms.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:timer_button/timer_button.dart';
class OtpPage extends StatefulWidget {
  String mobilenumber;
  String purpose;
  OtpPage({this.mobilenumber = '',this.purpose=''});
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<OtpPage> {
  bool loading = false;


  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    TextEditingController otpController = TextEditingController();
    OtpVerifyModel otpverifymodel = OtpVerifyModel();
    SendOtpModel sendOtpModel = SendOtpModel();


    return  loading
        ?Loading()
        :Scaffold(
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
                    "Enter Your  Otp",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue[900]),
                  )),
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: PinEntryTextField(
                        fields: 6,
                        // fields: int.parse('$otpController'),
                        showFieldAsBox: true,
                        onSubmit: (String pin) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Pin"),
                                  content: Text("Pin entered is $pin"),
                                );
                              });
                          var manager = RequestManager();


                          var data = manager
                              .verifyOtp(ApiConstants.Base_Url+RoutePaths.OtpVerifyUrl, widget.mobilenumber, pin,widget.purpose.toString())
                              .then((value) {
                            // print('response:$value');
                            otpverifymodel = value;
                            print('response:${otpverifymodel.msg}');
                            if (otpverifymodel.msg == 'Otp Verify') {
                              if(otpverifymodel.purpose=='New_visit'){
                                BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => VisitorForms(purpose:otpverifymodel.purpose)));
                              }else if(otpverifymodel.purpose=='re_visit'){
                                BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => VisitorForms(purpose:otpverifymodel.purpose)));
                              }else if(otpverifymodel.purpose=='know_status'){
                                BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => KnowStatusList(mobileNo:widget.purpose)));
                              }else{
                                BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                              }
                            }else if(otpverifymodel.msg == 'Invalid Otp'){
                              print('msg : ${otpverifymodel.msg}');
                              BaseMethod().VMSToastMassage('${otpverifymodel.msg}');
                            }
                          });
                        }),
                  ),
                ),
              ),
              new TimerButton(
                label: "Send OTP Again",
                timeOutInSeconds: 20,
                onPressed: () {
                  print("send otp");
                  setState(() {
                    loading = true;
                  });

                  var manager = RequestManager();
                  var data = manager.sendOtp(ApiConstants.Base_Url+RoutePaths.SendOtpUrl,widget.mobilenumber.toString(),widget.purpose.toString())
                      .then((value) {
                    print('response:$value');
                    sendOtpModel = value;
                    print('response:${sendOtpModel.msg}');
                    if (sendOtpModel.msg == 'Otp send successfully') {
                      setState(() {
                        loading = false;
                      });

                      BaseMethod().VMSToastMassage('${otpverifymodel.msg}');
                    }
                  });
                },
                disabledColor: Colors.red,
                color: Colors.grey,
                disabledTextStyle: new TextStyle(fontSize: 20.0),
                activeTextStyle: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              RaisedButton(
                color: Colors.blue[900],
                onPressed: () {
                  print('hlllo');
                  var manager = RequestManager();
                  setState(() {
                    loading = true;
                  });


                  var data = manager
                      .verifyOtp(ApiConstants.Base_Url+RoutePaths.OtpVerifyUrl, '', otpController.text.toString(),widget.purpose.toString())
                      .then((value) {
                    print('response:$value');
                    otpverifymodel = value;
                    print('response:${otpverifymodel.msg}');
                    if (otpverifymodel.msg == 'Otp Verify') {
                      setState(() {
                        loading = false;
                      });

                      if(otpverifymodel.purpose=='New_visit'){
                        BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VisitorForms(purpose:otpverifymodel.purpose)));
                      }else if(otpverifymodel.purpose=='re_visit'){
                        BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VisitorForms(purpose:otpverifymodel.purpose)));
                      }else if(otpverifymodel.purpose=='know_status'){
                        MaterialPageRoute(builder: (context) => KnowStatusList(mobileNo:widget.purpose));
                    BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                      }else{
                        BaseMethod().VMSToastMassage('${otpverifymodel.purpose}');
                      }
                    }else if(otpverifymodel.msg == 'Invalid Otp'){
                      setState(() {
                        loading = false;
                      });

                      print('msg : ${otpverifymodel.msg}');
                      BaseMethod().VMSToastMassage('${otpverifymodel.msg}');
                    }
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                textColor: Colors.white,
                child: Text("Submit"),
              ),
            ])));
  }


}


