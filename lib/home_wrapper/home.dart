import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_hospital/services/auth.dart';
import 'package:smart_hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/home_wrapper/main_drawer.dart';
import 'package:smart_hospital/shaded/buttons.dart';
import 'package:smart_hospital/screens/person.dart';
import 'package:smart_hospital/screens/hospital_system.dart';
import 'package:smart_hospital/screens/devices.dart';
import 'package:smart_hospital/screens/regular_maintenance.dart';
import 'package:smart_hospital/authenticate/sign_in.dart';

class Home extends StatelessWidget {
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
            'Mans.S.Hospital ',
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Button(
                        text: 'User Informations',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Personality()),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Button(
                        text: 'Hospital system',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalSystem()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Button(
                        text: 'Hospital Devices',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalDevices()),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Button(
                        text: 'Regular Maintenance',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegularMaintenance()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
