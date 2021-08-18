import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      mouseCursor: SystemMouseCursors.click,
      fillColor: Color(0xFF212747),
      shape: CircleBorder(),
      highlightElevation: 12,
      focusElevation: 6,
      hoverElevation: 8,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
