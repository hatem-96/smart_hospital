import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_hospital/services/auth.dart';
import 'package:smart_hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/home_wrapper/main_drawer.dart';
import 'package:smart_hospital/authenticate/sign_in.dart';


class HospitalDevices extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Hospital>>.value(
      value: DatabaseService().hospital,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Hospital Devices',
          ),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignInScrean()),
                  );
                },
                icon: Icon(Icons.person),
                label: Text('Log Out'))
          ],
        ),
drawer: MainDrawer(),
      ),
    );

  }
}