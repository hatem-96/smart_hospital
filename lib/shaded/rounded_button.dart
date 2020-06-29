import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.icon, this.color, @required this.onPressed});
  final IconData icon;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: color,
      ),
      onPressed: onPressed,
      elevation: 2.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.blue,
    );
  }
}
