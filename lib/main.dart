import 'package:flutter/material.dart';
import 'package:smart_hospital/home_wrapper/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/services/auth.dart';
import 'package:smart_hospital/models/user.dart';

void main() => runApp(SmartHospital());

class SmartHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
