import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute({@required this.bmiValue, @required this.bmiResult});

  final String bmiValue;
  final Map bmiResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: kBackgroundScaffoldColor,
          scaffoldBackgroundColor: kBackgroundScaffoldColor),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Your Result :", style: kTextStyleOfNeeds)),
              ),
              SizedBox(height: 10.0),
              Expanded(
                flex: 70,
                child: ReusableCard(
                    colour: kColorNotTickedButton,
                    edgeInsets: kEdgeInsetsOfAllContainers,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(bmiResult["result"],
                            style:
                                TextStyle(color: Colors.green, fontSize: 25.0)),
                        Text(bmiValue,
                            style: TextStyle(
                                fontSize: 75.0, fontWeight: FontWeight.w900)),
                        Text(bmiResult["advice"],
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ReusableCard(
                      colour: kColorApplyButton,
                      edgeInsets: kEdgeInsetsOfAllContainers,
                      childWidget: Text(
                        "RE-CALCULATE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.5,
                            letterSpacing: 8.0),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
