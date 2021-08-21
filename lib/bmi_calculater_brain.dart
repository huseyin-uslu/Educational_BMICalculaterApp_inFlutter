import 'dart:math';

class CalculaterBrain {
  final int weight;
  final int height;
  double _result = 0;

  CalculaterBrain({required this.weight, required this.height}) {
    _result = weight.toDouble() / pow((height / 100).toDouble(), 2);
  }

  Map<String, String> getResult() {
    Map<String, String> result = {
      "conclusion": "",
      "advice": "",
      "avarage": ""
    };
    if (_result < 18.5) {
      result["conclusion"] = _result.toStringAsFixed(1);
      result["advice"] = "You must eat more not to die..";
      result["avarage"] = "underweight";
    } else if (_result < 25.0) {
      result["conclusion"] = _result.toStringAsFixed(1);
      result["advice"] = "You're a normal weight person. Congrulations..";
      result["avarage"] = "normal";
    } else {
      result["conclusion"] = _result.toStringAsFixed(1);
      result["advice"] = "You should eat less than before to fit!";
      result["avarage"] = "overweight";
    }
    return result;
  }
}
