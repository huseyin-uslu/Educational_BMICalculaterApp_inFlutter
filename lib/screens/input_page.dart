import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/screens/calculation_main2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/IconContent.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/CustomIconButton.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.Male;
  int heightValue = 180;
  int weightValue = 65;
  int ageValue = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundScaffoldColor,
      appBar: AppBar(
        backgroundColor: kBackgroundScaffoldColor,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _expandedRows(
                flex: 100,
                widget: _rowMaterials(
                  rightChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                      color: selectedGender == Gender.Female
                          ? kActiveTextColor
                          : kInactiveTextColor,
                    ),
                  ),
                  leftChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                      color: selectedGender == Gender.Male
                          ? kActiveTextColor
                          : kInactiveTextColor,
                    ),
                  ),
                  colorMale: selectedGender == Gender.Male
                      ? kColorTickedButton
                      : kColorNotTickedButton,
                  colorFemale: selectedGender == Gender.Female
                      ? kColorTickedButton
                      : kColorNotTickedButton,
                ),
                edgeInsets: kEdgeInsetsOfAllContainers),
            _expandedRows(
                flex: 110,
                widget: ReusableCard(
                  colour: kColorNotTickedButton,
                  edgeInsets: EdgeInsets.all(3.5),
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kTextStyleOfLabels,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(heightValue.toString(),
                              style: kTextStyleOfNeeds),
                          Text("cm"),
                        ],
                      ),
                      // kColorApplyButton.withAlpha(0x4D),

                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kActiveTextColor,
                          inactiveTrackColor: kInactiveTextColor,
                          thumbColor: kColorApplyButton,
                          overlayColor: kColorApplyButton.withAlpha(0x33),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 18.0),
                        ),
                        child: Slider(
                          value: heightValue.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              heightValue = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                edgeInsets: kEdgeInsetsOfAllContainers),
            _expandedRows(
                flex: 110,
                widget: _rowMaterials(
                  rightChild: _personalInfoCard(name: "AGE"),
                  leftChild: _personalInfoCard(name: "WEIGHT"),
                ),
                edgeInsets: kEdgeInsetsOfAllContainers),
            _expandedRows(
              //CALCULATOR BUTTON
              flex: 35,
              widget: GestureDetector(
                onTap: () {
                  CalculationBrain calculate = CalculationBrain(
                      height: heightValue, weight: weightValue);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondRoute(
                              bmiValue: calculate.calculateBMIValue(),
                              bmiResult: calculate.getResult())));
                },
                child: ReusableCard(
                  colour: kColorApplyButton,
                  edgeInsets: EdgeInsets.zero,
                  childWidget: Text('CALCULATE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.5,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 10.0,
                        color: Colors.white,
                      )),
                ),
              ),
              edgeInsets: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            )
          ],
        ),
      ),
    );
  }

  Column _personalInfoCard({@required String name}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(name, style: kTextStyleOfLabels),
        Text(name == "WEIGHT" ? weightValue.toString() : ageValue.toString(),
            style: kTextStyleOfNeeds),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: () {
                setState(() {
                  if (weightValue > 20 && ageValue > 5) {
                    name == "WEIGHT" ? weightValue-- : ageValue--;
                  }
                });
              },
            ),
            CustomIconButton(
                icon: FontAwesomeIcons.plus,
                onPress: () {
                  setState(() {
                    if (weightValue < 210 && ageValue < 120) {
                      name == "WEIGHT" ? weightValue++ : ageValue++;
                    }
                  });
                }),
          ],
        ),
      ],
    );
  }

  Expanded _expandedRows(
      {@required int flex,
      @required Widget widget,
      @required EdgeInsetsGeometry edgeInsets}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: edgeInsets,
        child: widget,
      ),
    );
  }

  Widget _rowMaterials(
      {@required Widget rightChild,
      @required Widget leftChild,
      Color colorMale,
      Color colorFemale}) {
    Color maleColor;
    Color femaleColor;

    if (colorMale == null && colorFemale == null) {
      maleColor = kColorNotTickedButton;
      femaleColor = kColorNotTickedButton;
    } else {
      maleColor = colorMale;
      femaleColor = colorFemale;
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ReusableCard(
              colour: maleColor,
              edgeInsets: EdgeInsets.all(3.5),
              childWidget: leftChild),
        ),
        Expanded(
          flex: 1,
          child: ReusableCard(
              colour: femaleColor,
              edgeInsets: EdgeInsets.all(3.5),
              childWidget: rightChild),
        ),
      ],
    );
  }
}
