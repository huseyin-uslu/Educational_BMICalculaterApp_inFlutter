import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bmi_calculater_onmyown/data/Constants.dart';
import 'package:flutter/rendering.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bmi_calculater_brain.dart';
import 'calculationscreen.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  int _currentValueNumberPicker = 30;
  int _weightValue = 60;
  int _heightValue = 165;
  int _calculationStep = 0;
  String textOfCalculationButton = "Could You Please Select Your Right Values?";

  String _stepToStepToCalculation() {
    switch (_calculationStep) {
      case 0:
        textOfCalculationButton = "Could You Please Select Your Right Values?";
        break;
      case 1:
        textOfCalculationButton = "Your height : $_heightValue , Right?";
        break;
      case 2:
        textOfCalculationButton = "Your height : $_weightValue , Right?";
        break;
      case 3:
        textOfCalculationButton =
            "Your age : $_currentValueNumberPicker , Right?";
        break;
      case 4:
        textOfCalculationButton =
            "Are you sure that you wanna calculate your BMI?";
        break;
      case 5:
        textOfCalculationButton = "CALCULATE";
        break;
      case 6:
        _calculationStep = 0;
        //navigator
        break;
      default:
        textOfCalculationButton = "Could You Please Select Your Right Values?";
    }
    return textOfCalculationButton;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.black, blurRadius: 5.0, spreadRadius: 2.0),
                ],
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("HEIGHT:  ",
                                  style: kLABEL_DEFAULT_TEXTSTYLE),
                              Text("$_heightValue",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: kCUSTOM_DEFAULT_2_TEXT_COLOR,
                                      fontWeight: FontWeight.bold)),
                              Text("cm",
                                  style: TextStyle(
                                      color: kCUSTOM_DEFAULT_2_TEXT_COLOR,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kBACKGROUND_THE_APP,
                              inactiveTrackColor:
                                  kCUSTOM_SECONDARY_COLOR_OF_THEME,
                              thumbColor: kCUSTOM_DEFAULT_TEXT_COLOR,
                              overlayColor:
                                  kCUSTOM_DEFAULT_2_TEXT_COLOR.withAlpha(0x33),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 18.0),
                            ),
                            child: Slider(
                              value: _heightValue.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  _heightValue = newValue.round();
                                  _calculationStep = 0;
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("WEIGHT:  ",
                                  style: kLABEL_DEFAULT_TEXTSTYLE),
                              Text("$_weightValue",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: kCUSTOM_DEFAULT_2_TEXT_COLOR,
                                      fontWeight: FontWeight.bold)),
                              Text("kg",
                                  style: TextStyle(
                                      color: kCUSTOM_DEFAULT_2_TEXT_COLOR,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kBACKGROUND_THE_APP,
                              inactiveTrackColor:
                                  kCUSTOM_SECONDARY_COLOR_OF_THEME,
                              thumbColor: kCUSTOM_DEFAULT_TEXT_COLOR,
                              overlayColor:
                                  kCUSTOM_DEFAULT_2_TEXT_COLOR.withAlpha(0x33),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 18.0),
                            ),
                            child: Slider(
                              value: _weightValue.toDouble(),
                              min: 20.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  _weightValue = newValue.round();
                                  _calculationStep = 0;
                                });
                              },
                            ),
                          ),
                        ],
                      )), //double sliders
                  Expanded(
                      flex: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 25,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      _calculationStep++;
                                      if (_calculationStep == 6) {
                                        CalculaterBrain _brain =
                                            CalculaterBrain(
                                                weight: _weightValue,
                                                height: _heightValue);
                                        Map<String, String> info =
                                            _brain.getResult();

                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CalculationScreen(info)));
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    child: Center(
                                      child: Text(
                                        _calculationStep == 0
                                            ? textOfCalculationButton
                                            : _stepToStepToCalculation(),
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: _calculationStep != 5
                                              ? 20.0
                                              : 30.0,
                                          fontWeight: FontWeight.bold,
                                          color: _calculationStep != 5
                                              ? kCUSTOM_SECONDARY_COLOR_OF_THEME
                                              : kCUSTOM_DEFAULT_2_TEXT_COLOR,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                              spreadRadius: 5.0)
                                        ],
                                        color: kCUSTOM_DEFAULT_TEXT_COLOR,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: kCUSTOM_DEFAULT_TEXT_COLOR,
                                          width: 20.0,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Expanded(
                                flex: 10,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Text('AGE:',
                                          style: kLABEL_DEFAULT_TEXTSTYLE),
                                    ),
                                    Expanded(
                                      flex: 30,
                                      child: Container(
                                        child: NumberPicker(
                                          selectedTextStyle: TextStyle(
                                              fontSize: 20,
                                              color:
                                                  kCUSTOM_DEFAULT_2_TEXT_COLOR,
                                              fontWeight: FontWeight.bold),
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                kCUSTOM_SECONDARY_COLOR_OF_THEME,
                                          ),
                                          value: _currentValueNumberPicker,
                                          minValue: 5,
                                          maxValue: 100,
                                          onChanged: (value) => setState(() {
                                            _currentValueNumberPicker = value;
                                            _calculationStep = 0;
                                          }),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    kCUSTOM_DEFAULT_TEXT_COLOR,
                                                width: 5),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            )),
                                      ),
                                    ),
                                    Expanded(flex: 22, child: SizedBox()),
                                  ],
                                )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.male),
            label: "MALE",
          ),
          const BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.female), label: "FEMALE"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
