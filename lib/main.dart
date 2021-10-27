import 'package:facechk_app/Screen/GaurdVisitorList.dart';
import 'package:facechk_app/Screen/KnowStatusList.dart';
import 'package:facechk_app/Screen/gaurd_login.dart';
import 'package:facechk_app/Screen/known_status.dart';
import 'package:facechk_app/Screen/login_screen.dart';
import 'package:facechk_app/Screen/splash_screen.dart';
import 'package:facechk_app/Screen/visitor_forms.dart';
import 'package:facechk_app/Screen/visitor_page2.dart';
import 'package:facechk_app/Screen/visitor_page5.dart';
import 'package:facechk_app/Screen/visitor_page6.dart';
import 'package:facechk_app/Screen/visitor_screen.dart';
import 'package:flutter/material.dart';

import 'Screen/DetailWithQrCode.dart';
import 'Screen/VisitorForm.dart';
import 'Screen/visitor_page4.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => GaurdVisitorList(),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/DetailWithQrCode': (context) => DetailWithQrCode(),
        '/GaurdVisitorList': (context) => GaurdVisitorList(),
        '/KnownStatus': (context) => KnownStatus(),
        '/ SplashScreen': (context) => SplashScreen(),
        '/visitorPage4': (context) =>VisitorPage4(),
        '/visitorPage5': (context) =>VisitorPage5(),
        '/visitorPage6':(context)=>VisitorPage6(),
      },
    );
  }
}
