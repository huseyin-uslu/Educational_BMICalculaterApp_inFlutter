import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  IconContent({@required this.icon, @required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
          color: this.color,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: this.color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
