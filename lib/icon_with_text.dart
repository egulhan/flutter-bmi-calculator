import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final Icon icon;
  final Text text;

  IconWithText({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        this.icon,
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: this.text,
        ),
      ],
    );
  }
}
