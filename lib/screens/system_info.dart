import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_hospital/home_wrapper/informationList.dart';
import 'package:smart_hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/home_wrapper/main_drawer.dart';
import 'package:smart_hospital/authenticate/sign_in.dart';
import 'package:smart_hospital/services/auth.dart';
import 'package:smart_hospital/screens/hospital_system.dart';
class SystemInfo extends StatefulWidget {
  @override
  _SystemInfoState createState() => _SystemInfoState();
}

class _SystemInfoState extends State<SystemInfo> {
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
            'System info',
          ),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                 await _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScrean()),
                  );
                },
                icon: Icon(Icons.person),
                label: Text('Log Out'))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: Column(
              children: <Widget>[
          ListTile(

        ),
        ],
    ),
        ),
        ),
        ],
        ),
      ),
    );
  }
}
