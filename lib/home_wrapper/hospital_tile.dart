import 'package:flutter/material.dart';
import 'package:smart_hospital/models/hospital.dart';

class HospitalTile extends StatelessWidget {
  final Hospital hospital;
 HospitalTile({this.hospital});
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person_pin),
                      title: Text('name:  ${hospital.name}',style: TextStyle(fontSize: 20.0),),
                      onTap: null,
                    ),
                    ListTile(
                      leading: Icon(null),
                      title:Text('jobe:  ${hospital.jobe}',
                        style: TextStyle(fontSize: 20.0),) ,
                      onTap: null,
                    ),
                    ListTile(
                      leading: Icon(null),
                      title:Text('age:  ${hospital.age} year(s)',
                      style: TextStyle(fontSize: 20.0),) ,
                      onTap: null,
                    ),
                    ListTile(
                      leading: Icon(null),
                      title:Text('phone:  ${hospital.phone}',
                        style: TextStyle(fontSize: 20.0),) ,
                      onTap: null,
                    ),

                  ],
                ),
                  ),
            ),
          ],
    );
  }
}
