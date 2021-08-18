import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculationBrain {
  CalculationBrain({@required this.height, @required this.weight}) {
    _bmi = weight.toDouble() / pow(height / 100, 2).toDouble();
  }

  final int height;
  final int weight;
  double _bmi;

  String calculateBMIValue() {
    String value = _bmi.toStringAsFixed(1);
    return value;
  }

  Map<String, String> getResult() {
    Map<String, String> hashMapList = {"result": "", "advice": ""};

    if (_bmi >= 25) {
      hashMapList["result"] = "OVERWEIGHT";
      hashMapList.update("result", (value) => "OVERWEIGHT");
      hashMapList.update(
          "advice",
          (value) =>
              "You have a higher weight than a normal body, Try to exercise more..!");
    } else if (_bmi >= 18.5) {
      hashMapList.update("result", (value) => "NORMAL");
      hashMapList.update(
          "advice", (value) => "You have a normal body weight, good Job..!");
    } else {
      hashMapList.update("result", (value) => "UNDERWEIGHT");
      hashMapList.update(
          "advice",
          (value) =>
              "You have a lower than a normal body , you should eat more..!");
    }
    return hashMapList;
  }
}
