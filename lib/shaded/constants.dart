import 'package:flutter/material.dart';
const kTextInputDecoration=InputDecoration(
  hintText: 'Enter a Value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kContainerHeight = 130.0;
const kContainerWidth =130.0;
const kContainerColour = Colors.blueAccent;
const kDrawerContainerColour = Colors.lightBlue;
const kFontTextStyle =Colors.white;

const kInactiveColour =Colors.blueGrey;
const kActiveColour =Colors.white30;
const kBottomContainerColour = Colors.blueGrey;
const kLabelTextStyle =TextStyle(
  fontSize: 20.0,
  letterSpacing: 1.0,
  color:Colors.white,
  fontWeight: FontWeight.bold,
);
const kNumberTextStyle =TextStyle(
  color: Colors.white,
  fontSize: 50.0,
  fontWeight: FontWeight.w400,
);
//const kTitleTextStyle =TextStyle(
//  fontSize: 60.0,
//  fontWeight: FontWeight.bold,
//);
//const kResultTextStyle =TextStyle(
//  color: Color(0xFF24D876),
//  fontWeight: FontWeight.bold,
//  fontSize: 22.0,
//);
//const kDescriptionBMI=TextStyle(
//  fontWeight: FontWeight.bold,
//  fontSize: 20.0,
//);
//const kBmiTest=TextStyle(
//    fontSize: 80.0,
//    fontWeight:FontWeight.bold
//);



