import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Button extends StatelessWidget {
  Button({ this.onPress, @required this.text});
  final Function onPress;
  final String  text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
              color:Colors.white70,
            ),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        color: kContainerColour,
        width: kContainerWidth,
        height:kContainerHeight,
      ),
    );
  }
}

