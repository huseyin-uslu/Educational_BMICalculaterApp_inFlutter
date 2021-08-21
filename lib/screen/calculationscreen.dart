import 'package:bmi_calculater_onmyown/data/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculationScreen extends StatelessWidget {
  final Map<String, String> information;
  CalculationScreen(this.information);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: kTHEME_DATA_DEFAULT,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATER',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                color: kCUSTOM_DEFAULT_TEXT_COLOR),
          ),
          elevation: 20,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kCUSTOM_PRIMARY_COLOR_OF_THEME,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 2.0),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 30.0),
                    Expanded(
                        flex: 1,
                        child: Text('Your result :',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: kCUSTOM_DEFAULT_2_TEXT_COLOR))),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Text(information['conclusion']!,
                              textAlign: TextAlign.center,
                              style: kLABEL_DEFAULT_2_TEXTSTYLE),
                          SizedBox(
                            height: 30,
                          ),
                          Text(information['avarage']!.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: kLABEL_DEFAULT_3_TEXTSTYLE),
                          SizedBox(
                            height: 100,
                          ),
                          Text("#" + information['advice']!,
                              textAlign: TextAlign.center,
                              style: kDEFAULT_TEXTSTYLE),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FloatingActionButton.extended(
                            icon: Icon(FontAwesomeIcons.recycle),
                            label: Text("RE-CALCULATE"),
                            backgroundColor: kCUSTOM_DEFAULT_TEXT_COLOR,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
