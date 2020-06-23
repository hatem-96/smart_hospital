import 'package:flutter/material.dart';
import 'package:smart_hospital/home_wrapper/home.dart';
import 'package:smart_hospital/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user==null){
      return Authenticate() ;
    }
    else {
      return Home();
    }
  }
}

