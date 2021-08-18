import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final EdgeInsetsGeometry edgeInsets;
  final Widget childWidget;

  ReusableCard(
      {@required this.colour,
      @required this.edgeInsets,
      @required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      child: childWidget,
      margin: edgeInsets,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
