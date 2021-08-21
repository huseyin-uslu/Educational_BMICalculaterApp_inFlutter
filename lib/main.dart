import 'package:flutter/material.dart';
import 'package:bmi_calculater_onmyown/screen/mainscreen.dart';
import 'package:bmi_calculater_onmyown/data/constants.dart';

void main() => runApp(MyMainScreen());

class MyMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kTHEME_DATA_DEFAULT,
      home: MyStatefulWidget(),
    );
  }
}
