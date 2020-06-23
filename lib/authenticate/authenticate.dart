import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'register.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInScrean =true;
  void toggleView ()
  {
   setState(() =>showSignInScrean = !showSignInScrean);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignInScrean){
      return SignInScrean(toggleView:toggleView);
    }
    else {
      return Register(toggleView:toggleView);
    }

  }
}
