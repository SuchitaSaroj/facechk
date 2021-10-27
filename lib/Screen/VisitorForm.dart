import 'package:facechk_app/Constants/RoutePaths.dart';
import 'package:facechk_app/Models/CountryModel.dart';
import 'package:facechk_app/RequestManager/RequestManager.dart';
import 'package:facechk_app/Constants/ApiConstants.dart';
import 'package:flutter/cupertino.dart';

class VisitorForm1 extends StatefulWidget {
  // const VisitorForm1({Key? key}) : super(key: key);

  @override
  _VisitorForm1State createState() => _VisitorForm1State();
}

class _VisitorForm1State extends State<VisitorForm1> {
  CountryModel countryModel = CountryModel();
  List countryData = [];

  @override
  void initState() {
    super.initState();
    var manager = RequestManager();
    var callApi = manager.getCountryApi(ApiConstants.Base_Url+RoutePaths.GetCountryUrl).then((value) {
      setState(() {
        countryModel = value;
      });
      print('in:$countryModel');
      countryData = countryModel.date;
    });
    print('DDD:$countryData');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
