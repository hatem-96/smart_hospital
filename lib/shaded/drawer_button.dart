import 'package:flutter/material.dart';
import 'constants.dart';

class DrawerButton extends StatelessWidget {
  DrawerButton({ this.onPress, @required this.text});
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
              fontSize: 18.0,
              color:Colors.white,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 1.0,bottom: 1.0),
      //  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: double.infinity),
        color: kDrawerContainerColour,
//        width: kContainerWidth,
//        height:kContainerHeight,
      ),
    );
  }
}